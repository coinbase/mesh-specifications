.PHONY: node-deps go-deps deps gen validate add-license check-license spellcheck shellcheck salus
LICENCE_SCRIPT=addlicense -c "Coinbase, Inc." -l "apache" -v

node-deps:
	npm install -g @apidevtools/swagger-cli@4.0.2

go-deps:
	go get github.com/google/addlicense
	go get github.com/client9/misspell/cmd/misspell

deps: node-deps go-deps

gen:
	./codegen.sh api.json;

validate:
	./validate.sh;

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

release: shellcheck spellcheck validate add-license salus
