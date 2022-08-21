<div align="center">

  <img src="assets/img/logo.png" alt="logo" width="200" height="auto" />
  <h1>Retio</h1>

  <p>
Connecting External Registries to Istio
  </p>



<!-- Badges -->

<p>
  <a href="https://github.com/aeraki-mesh/retio/graphs/contributors">
    <img src="https://img.shields.io/github/contributors/aeraki-mesh/retio" alt="contributors" />
  </a>
  <a href="">
    <img src="https://img.shields.io/github/last-commit/aeraki-mesh/retio" alt="last update" />
  </a>
  <a href="https://github.com/aeraki-mesh/retio/network/members">
    <img src="https://img.shields.io/github/forks/aeraki-mesh/retio" alt="forks" />
  </a>
  <a href="https://github.com/aeraki-mesh/retio/stargazers">
    <img src="https://img.shields.io/github/stars/aeraki-mesh/retio" alt="stars" />
  </a>
  <a href="https://github.com/aeraki-mesh/retio/issues/">
    <img src="https://img.shields.io/github/issues/aeraki-mesh/retio" alt="open issues" />
  </a>
  <a href="https://github.com/aeraki-mesh/retio/blob/master/LICENSE">
    <img src="https://img.shields.io/github/license/aeraki-mesh/retio.svg" alt="license" />
  </a>
</p>

<h4>
    <a href="https://github.com/aeraki-mesh/retio/">View Demo</a>
  <span> · </span>
    <a href="https://github.com/aeraki-mesh/retio">Documentation</a>
  <span> · </span>
    <a href="https://github.com/aeraki-mesh/retio/issues/">Report Bug</a>
  <span> · </span>
    <a href="https://github.com/aeraki-mesh/retio/issues/">Request Feature</a>
  </h4>
</div>

<br />

<!-- Table of Contents -->

# Table of Contents

- [About the Project](#about-the-project)
  * [Background](#background)
  * [Features](#features)
- [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
  * [Run Locally](#run-locally)
- [Usage](#usage)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
  * [Code of Conduct](#code-of-conduct)
- [License](#license)
- [Contact](#contact)
- [Acknowledgements](#acknowledgements)
  

<!-- About the Project -->
## About the Project

**Retio** is the short word for "Registries to Istio", which is capable to communicate with Service Registries and Service Mesh (Istio). It is   an easy-to-use and extendable **adaptor** if you have a service registry and intend to integrate it with Istio. You can just deploy it and tell it which service registries you want to talk to, then Istio will identify the services in the registries.

<!--  Background -->

### Background

While service mesh becomes an important infrastructure for microservices, more and more developers are trying to use Service Mesh like Istio and putting it into production. Also there are many open source service registry projects for discovering services, such as Polaris, Consul, Nacos, ZooKeeper, ETCD, Eureka. So **Retio** is designed to integrate these registries infrastructures with Istio easily. Just give **Retio** one or more registry addresses, then it is done and you do not need to wrong about anything else.

<!-- Features -->

### Features

- Provide an easy-to-use way to integrate Istio with Registries by Service Entries and Mesh Configuration Protocol(MCP).
- Provide the **1 to more** model to integrate Service Mesh with more than one Registries at the same time.
- Provide the convenient way to implement a new Service Registry, which is designed to implement more Registries.
- Provide different options to deploy **Retio** in Kubernetes, so you can choose one as you like.

<!-- Getting Started -->
## Getting Started

<!-- Prerequisites -->
### Prerequisites

<!-- Installation -->
### Installation

You can install **Retio** with Helm Charts and Kubernetes Operator.

```bash
```

<!-- Run Locally -->
### Run Locally

Clone the project and run:

```bash
  git clone https://github.com/aeraki-mesh/retio.git
  make deploy
```

<!-- Roadmap -->
## Roadmap

* [ ] Support ServiceEntry Conventions
  * [ ] Polaris
  * [ ] Consul
  * [ ] Nacos
  * [ ] ZooKeeper
  * [ ] ETCD
  * [ ] Eureka
  * [ ] .........
* [ ] Support Mesh Configuration Protocol (MCP)
  * [ ] Polaris
  * [ ] Consul
  * [ ] Nacos
  * [ ] ZooKeeper
  * [ ] ETCD
  * [ ] Eureka
  * [ ] .........
* [ ] Support Different Deployment Mode
  * [ ] Quick Start
  * [ ] Helm Chart
  * [ ] Kubernetes Operator


<!-- Contributing -->

## Contributing

<a href="https://github.com/aeraki-mesh/retio/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=aeraki-mesh/retio" />
</a>


Contributions are always welcome!

See `contributing.md` for ways to get started.

<!-- Code of Conduct -->
### Code of Conduct

Please read the [Code of Conduct](https://github.com/aeraki-mesh/retio/blob/master/CODE_OF_CONDUCT.md)


<!-- License -->
## License

Distributed under the Apache License 2.0 . See LICENSE.txt for more information.


<!-- Contact -->
## Contact

Mail List: cncf-aerakimesh-maintainers@lists.cncf.io

Project Link: [https://github.com/aeraki-mesh/retio](https://github.com/aeraki-mesh/retio)

<!-- Acknowledgments -->
## Acknowledgements
