<h3 align="center">
   Mesh Specifications
</h3>
<p align="center">
This repository contains all specification files used to generate code for the Mesh API.
</p>
<p align="center">
Build once. 
Integrate your blockchain everywhere.
</p>

## Overview

Mesh is an open-source specification and set of tools that makes integrating with blockchains simpler, faster, and more reliable. The Mesh API is specified in the [OpenAPI 3.0 format](https://www.openapis.org).

Requests and responses can be crafted with auto-generated code using [Swagger Codegen](https://swagger.io/tools/swagger-codegen) or [OpenAPI Generator](https://openapi-generator.tech), are human-readable (easy to debug and understand), and can be used in servers and browsers.

## Installation

No installation is required, as the repository only includes specification files.

## Documentation

You can find the Mesh API documentation at [mesh-api.org](https://www.mesh-api.org/docs/welcome.html). 

Check out the [Getting Started](https://www.mesh-api.org/docs/getting_started.html) section to start diving into Mesh. 

Our documentation is divided into the following sections:

* [Product Overview](https://www.mesh-api.org/docs/welcome.html)
* [Getting Started](https://www.mesh-api.org/docs/getting_started.html)
* [Mesh API Spec](https://www.mesh-api.org/docs/Reference.html)
* [Testing](https://www.mesh-api.org/docs/rosetta_cli.html)
* [Best Practices](https://www.mesh-api.org/docs/node_deployment.html)
* [Repositories](https://www.mesh-api.org/docs/rosetta_specifications.html)

## Contributing

You may contribute to the `mesh-specifications` project in various ways:

* [Asking Questions](CONTRIBUTING.md/#asking-questions)
* [Providing Feedback](CONTRIBUTING.md/#providing-feedback)
* [Reporting Issues](CONTRIBUTING.md/#reporting-issues)

Read our [Contributing](CONTRIBUTING.MD) documentation for more information.

When you've finished an implementation for a blockchain, share your work in the [ecosystem category of the community site](https://community.mesh-api.org/c/ecosystem). Platforms looking for implementations for certain blockchains will be monitoring this section of the website for high-quality implementations they can use for integration. Make sure that your implementation meets the [expectations](https://www.mesh-api.org/docs/node_deployment.html) of any implementation.

## Related Projects

* [mesh-sdk-go](https://github.com/coinbase/mesh-sdk-go) — The `mesh-sdk-go` SDK provides a collection of packages used for interaction with the Mesh API specification. Much of the SDK code is generated from this, the [mesh-specifications](https://github.com/coinbase/mesh-specifications) repository.
* [mesh-cli](https://github.com/coinbase/mesh-cli) — Use the `mesh-cli` tool to test your Mesh API implementation. The tool also provides the ability to look up block contents and account balances.

### Reference Implementations

To help you with examples, we developed complete Mesh API reference implementations for [Bitcoin](https://github.com/coinbase/mesh-bitcoin) and [Ethereum](https://github.com/coinbase/mesh-ethereum). Developers of Bitcoin-like or Ethereum-like blockchains may find it easier to fork these reference implementations than to write an implementation from scratch.

You can also find community implementations for a variety of blockchains in the [mesh-ecosystem](https://github.com/coinbase/mesh-ecosystem) repository, and in the [ecosystem category](https://community.mesh-api.org/c/ecosystem) of our community site. 

## Specification Development

While working on improvements to this repository, we recommend that you use these commands to check your code:

* `make deps` to install dependencies
* `make gen` to generate the specification files
* `make check-valid` to ensure specification is valid
* `make release` to check if code passes all tests run by CircleCI

### Adding New CurveTypes or SignatureTypes

Unlike the [Data API](https://www.mesh-api.org/docs/data_api_introduction.html) where there are no global type constraints (e.g., you can specify any operation type), the [Construction API](https://www.mesh-api.org/docs/construction_api_introduction.html) has a clearly enumerated list of supported curves and signatures. Each one of these items has a clearly specified format that all implementations should expect to receive.

If a curve or signature you are employing is not enumerated in the [specification](https://www.mesh-api.org/docs/Reference.html), you will need to open a PR against the specification to add it along with the standard format it will be represented in.

It is up to the caller of a Construction API implementation to implement key generation and signing for a particular [`CurveType:SignatureType`](https://www.mesh-api.org/docs/models/CurveType.html). There is a `keys` package in [mesh-sdk-go](https://github.com/coinbase/mesh-sdk-go) that is commonly used by callers and anyone in the community can implement additional schemes there.

## License

This project is available open source under the terms of the [Apache 2.0 License](https://opensource.org/licenses/Apache-2.0).

© 2022 Coinbase