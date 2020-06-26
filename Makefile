.PHONY: node-deps go-deps deps gen check-gen add-license check-license spellcheck shellcheck salus check-valid
LICENCE_SCRIPT=addlicense -c "Coinbase, Inc." -l "apache" -v
GO_INSTALL=GO111MODULE=off go get

node-deps:
	npm install -g @apidevtools/swagger-cli@4.0.2

go-deps:
	${GO_INSTALL} github.com/google/addlicense
	${GO_INSTALL} github.com/client9/misspell/cmd/misspell

deps: node-deps go-deps

gen:
	./codegen.sh;

check-valid:
	swagger-cli validate api.yaml

check-gen: | gen
	git diff --exit-code

add-license:
	${LICENCE_SCRIPT} .

check-license:
	${LICENCE_SCRIPT} -check .

spellcheck:
	misspell -error .

shellcheck:
	shellcheck codegen.sh

salus:
	docker run --rm -t -v ${PWD}:/home/repo coinbase/salus

release: check-valid shellcheck spellcheck check-gen check-license salus
