<p align="center">
  <a href="https://www.rosetta-api.org">
    <img height="400" alt="Rosetta" src="https://www.rosetta-api.org/img/rosetta_header.png">
  </a>
</p>
<h3 align="center">
   Rosetta Specifications
</h3>
<p align="center">
This repository contains all specification files used to generate code for the Rosetta API.
</p>
<p align="center">
  <a href="https://circleci.com/gh/coinbase/rosetta-specifications/tree/master"><img src="https://circleci.com/gh/coinbase/rosetta-specifications/tree/master.svg?style=shield" /></a>
  <a href="https://github.com/coinbase/rosetta-specifications/blob/master/LICENSE.txt"><img src="https://img.shields.io/github/license/coinbase/rosetta-specifications.svg" /></a>
</p>

## Overview
The Rosetta API is specified in the [OpenAPI 3.0 format](https://www.openapis.org)
(the [successor to Swagger/OpenAPI 2.0](https://swagger.io/blog/news/whats-new-in-openapi-3-0)).
Requests and responses can be crafted with auto-generated code using
[Swagger Codegen](https://swagger.io/tools/swagger-codegen) or
[OpenAPI Generator](https://openapi-generator.tech), are human-readable
(easy to debug and understand), and can be used in servers and browsers.

## Documentation
Before diving into the specifications and starting your implementation, we recommend taking a look at the Rosetta API Docs:

* [Overview](https://www.rosetta-api.org/docs/welcome.html)
* [Node API](https://www.rosetta-api.org/docs/node_api_introduction.html)
* [Wallet API (coming soon!)](https://www.rosetta-api.org/docs/wallet_api_introduction.html)

If you have any questions, don't hesitate to reach out in our [community forum](https://community.rosetta-api.org).

## Writing a Node API Implementation
If you've made it this far, you are interested in developing a Rosetta Node API implementation
for a blockchain project you are working on. As mentioned in the Rosetta doumentation, there
is [no restriction on what language you choose to use for your implementation](https://www.rosetta-api.org/docs/no_gatekeepers.html#no-required-languages)
and [no repository](https://www.rosetta-api.org/docs/no_gatekeepers.html#no-master-repository)
where you must open a PR to share your work.

When you've finished an implementation for a blockchain (make sure you
[meet the expectations of any "complete" implementation](https://www.rosetta-api.org/docs/node_deployment.html)),
share your work in the [ecosystem category of the community site](https://community.rosetta-api.org/c/ecosystem).
Platforms looking for implementations for certain blockchains will be monitoring
this section of the website for high-quality implementations they can use
for integration.

### Using Golang
If you are comfortable with Golang, the easiest way to write a Rosetta Node API implementation
is to use the [rosetta-sdk-go](https://github.com/coinbase/rosetta-sdk-go). This Golang project
provides a [server](https://github.com/coinbase/rosetta-sdk-go/tree/master/server) package that
allows a developer to write a Rosetta Node API server by implementing an interface. It automatically
ensures client requests are valid and routes requests to the functions you've implemented in
Go types (instead of in raw JSON).

There is a simple [example](https://github.com/coinbase/rosetta-sdk-go/tree/master/examples/server) of
how to write an implementation using this package in [rosetta-sdk-go](https://github.com/coinbase/rosetta-sdk-go).

### Using Another Language
If you plan to use a language other than Golang, you will need to either codegen
a server (the [overview](#overview) mentions some tools that help with this) or
write one from scratch. If you do choose to write an implementation in another language,
we ask that you create a seperate repository for all the code you generate so that other
developers can use it. Check out [rosetta-sdk-go](https://github.com/coinbase/rosetta-sdk-go)
for an example of how to generate code from this specification.

## Validating Your Implementation
To validate your implementation, check out the [rosetta-cli](https://github.com/coinbase/rosetta-cli).
The `rosetta-cli` has a command called `check` that can be used to ensure your implementation
adheres to the specifications in this repository and that it accurately represents balance changes.

You can view an extensive list of checks this tool performs [here](https://github.com/coinbase/rosetta-cli#correctness-checks).
If you'd like to add more checks for correctness, feel free to [create an issue](https://github.com/coinbase/rosetta-cli/issues) listing
in detail what you think should be checked in any implementation.

## Writing an Integration
Before starting your own integration, we recommend reading this [blog post](https://www.rosetta-api.org/blog/2020/06/17/1-try-celo-rosetta.html) that
walks through how to fetch blocks from a Celo Rosetta API implementation.

The most developed tools for working with Rosetta API implementations can
be found in [rosetta-sdk-go](https://github.com/coinbase/rosetta-sdk-go). Below,
we highlight 2 packages in this repository that are very useful for parsing
data from a blockchain. You can find code examples of these packages throughout
the [rosetta-cli](https://github.com/coinbase/rosetta-cli), which uses `rosetta-sdk-go`
for all block processing.

### Syncer
The core of any integration is syncing blocks reliably. The [syncer](https://github.com/coinbase/rosetta-sdk-go/tree/master/syncer)
serially processes blocks from a Node API implementation (automatically handling re-orgs) with
user-defined handling logic and storage. After a block is processed, store it to a DB or send a push
notification...it's up to you!

### Parser
When reading the operations in a block, it can be helpful to apply higher-level
groupings to related operations or match operations in a transaction to some
set of generic descriptions (i.e. ensure there are 2 operations of equal but
opposite amounts). The [parser](https://github.com/coinbase/rosetta-sdk-go/tree/master/parser)
empowers any integrator to build abstractions on top of the
[low-level building blocks](https://www.rosetta-api.org/docs/low_level_ops.html)
that the Rosetta API exposes.

## SDKs in More Languages
We've spent a lot of time polishing and building on top of [rosetta-sdk-go](https://github.com/coinbase/rosetta-sdk-go). At Coinbase, we write
most of our code in Golang so this was the natural choice for us to invest our time and resources. We'd love to see implementations
in Rust and JavaScript/TypeScript as many new blockchains use Rust and many developers rely on JavaScript/TypeScript.

If you write an implementation of an SDK in another language, please reach out on the [Ecosystem](https://community.rosetta-api.org/c/ecosystem).

## Specification Development
* `make deps` to install dependencies
* `make gen` to generate the specification files
* `make validate` to ensure specification is valid
* `make release` to check if code passes all tests run by CircleCI

## License
This project is available open source under the terms of the [Apache 2.0 License](https://opensource.org/licenses/Apache-2.0).

© 2020 Coinbase
