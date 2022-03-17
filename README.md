<p align="center">
  <a href="https://www.rosetta-api.org">
    <img width="90%" alt="Rosetta" src="https://www.rosetta-api.org/img/rosetta_header.png">
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
<p align="center">
Build once. 
Integrate your blockchain everywhere.
</p>

## Overview

Rosetta is an open-source specification and set of tools that makes integrating with blockchains simpler, faster, and more reliable. The Rosetta API is specified in the [OpenAPI 3.0 format](https://www.openapis.org).

Requests and responses can be crafted with auto-generated code using [Swagger Codegen](https://swagger.io/tools/swagger-codegen) or [OpenAPI Generator](https://openapi-generator.tech), are human-readable (easy to debug and understand), and can be used in servers and browsers.

## Installation

No installation is required, as the repository only includes specification files.

## Documentation

You can find the Rosetta API documentation at [rosetta-api.org](https://www.rosetta-api.org/docs/welcome.html). 

Check out the [Getting Started](https://www.rosetta-api.org/docs/getting_started.html) section to start diving into Rosetta. 

Our documentation is divided into the following sections:

* [Product Overview](https://www.rosetta-api.org/docs/welcome.html)
* [Getting Started](https://www.rosetta-api.org/docs/getting_started.html)
* [Rosetta API Spec](https://www.rosetta-api.org/docs/Reference.html)
* [Testing](https://www.rosetta-api.org/docs/rosetta_cli.html)
* [Best Practices](https://www.rosetta-api.org/docs/node_deployment.html)
* [Repositories](https://www.rosetta-api.org/docs/rosetta_specifications.html)

## Contributing

You may contribute to the `rosetta-specifications` project in various ways:

* [Asking Questions](CONTRIBUTING.md/#asking-questions)
* [Providing Feedback](CONTRIBUTING.md/#providing-feedback)
* [Reporting Issues](CONTRIBUTING.md/#reporting-issues)

Read our [Contributing](CONTRIBUTING.MD) documentation for more information.

When you've finished an implementation for a blockchain, share your work in the [ecosystem category of the community site](https://community.rosetta-api.org/c/ecosystem). Platforms looking for implementations for certain blockchains will be monitoring this section of the website for high-quality implementations they can use for integration. Make sure that your implementation meets the [expectations](https://www.rosetta-api.org/docs/node_deployment.html) of any implementation.

## Related Projects

* [rosetta-sdk-go](https://github.com/coinbase/rosetta-sdk-go) — The `rosetta-sdk-go` SDK provides a collection of packages used for interaction with the Rosetta API specification. Much of the SDK code is generated from this, the [rosetta-specifications](https://github.com/coinbase/rosetta-specifications) repository.
* [rosetta-cli](https://github.com/coinbase/rosetta-cli) — Use the `rosetta-cli` tool to test your Rosetta API implementation. The tool also provides the ability to look up block contents and account balances.

### Reference Implementations

To help you with examples, we developed complete Rosetta API reference implementations for [Bitcoin](https://github.com/coinbase/rosetta-bitcoin) and [Ethereum](https://github.com/coinbase/rosetta-ethereum). Developers of Bitcoin-like or Ethereum-like blockchains may find it easier to fork these reference implementations than to write an implementation from scratch.

You can also find community implementations for a variety of blockchains in the [rosetta-ecosystem](https://github.com/coinbase/rosetta-ecosystem) repository, and in the [ecosystem category](https://community.rosetta-api.org/c/ecosystem) of our community site. 

## Specification Development

While working on improvements to this repository, we recommend that you use these commands to check your code:

* `make deps` to install dependencies
* `make gen` to generate the specification files
* `make check-valid` to ensure specification is valid
* `make release` to check if code passes all tests run by CircleCI

### Adding New CurveTypes or SignatureTypes

Unlike the [Data API](https://www.rosetta-api.org/docs/data_api_introduction.html) where there are no global type constraints (e.g., you can specify any operation type), the [Construction API](https://www.rosetta-api.org/docs/construction_api_introduction.html) has a clearly enumerated list of supported curves and signatures. Each one of these items has a clearly specified format that all implementations should expect to receive.

If a curve or signature you are employing is not enumerated in the [specification](https://www.rosetta-api.org/docs/Reference.html), you will need to open a PR against the specification to add it along with the standard format it will be represented in.

It is up to the caller of a Construction API implementation to implement key generation and signing for a particular [`CurveType:SignatureType`](https://www.rosetta-api.org/docs/models/CurveType.html). There is a `keys` package in [rosetta-sdk-go](https://github.com/coinbase/rosetta-sdk-go) that is commonly used by callers and anyone in the community can implement additional schemes there.

## License

This project is available open source under the terms of the [Apache 2.0 License](https://opensource.org/licenses/Apache-2.0).

© 2022 Coinbase