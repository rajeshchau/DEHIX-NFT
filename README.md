# DEHIX-NFT

DEHIX-NFT is a decentralized application (dApp) built on Ethereum that leverages blockchain technology to create, manage, and trade Non-Fungible Tokens (NFTs). This project is designed to issue NFT certificates, enabling secure, transparent, and decentralized validation of digital credentials.

> **Disclaimer:** This project is provided for educational purposes only. Always perform thorough testing and security audits before deploying any smart contracts to a production environment.

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
  - [Clone the Repository](#clone-the-repository)
  - [Install Smart Contract Dependencies](#install-smart-contract-dependencies)
  - [(Optional) Install Frontend Dependencies](#optional-install-frontend-dependencies)
- [Configuration](#configuration)
  - [Foundry Configuration](#foundry-configuration)
  - [Remappings](#remappings)
- [Project Structure](#project-structure)
- [Usage](#usage)
  - [Building the Smart Contracts](#building-the-smart-contracts)
  - [Running Tests](#running-tests)
  - [Code Formatting](#code-formatting)
  - [Running a Local Ethereum Node](#running-a-local-ethereum-node)
  - [Deploying Contracts](#deploying-contracts)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgements](#acknowledgements)
- [Additional Resources](#additional-resources)

---

## Overview

DEHIX-NFT is a robust NFT project that utilizes modern development tools such as [Foundry](https://book.getfoundry.sh/) for smart contract compilation, testing, and deployment, along with OpenZeppelin’s secure and battle-tested smart contract libraries. This project supports multiple sale phases (presale with whitelist verification and public sale) and integrates ERC2981 royalties to ensure creators receive a percentage of secondary sales.

---

## Features

- **NFT Certificate Minting:** Create NFTs with unique metadata representing certificates.
- **Sale Phases:** Presale (whitelist-based) and public minting functionality.
- **Royalties:** Integrated ERC2981 standard for automatic royalty distribution.
- **Security:** Implements pausable functionality and reentrancy guard.
- **Administration:** Owner-controlled configuration (mint price, supply cap, whitelist, etc.).
- **Full Deployment & Testing:** Built using Foundry for rapid development and testing.

---

## Technologies Used

- **Solidity:** Smart contract programming language.
- **Foundry:** A fast, portable, and modular toolkit for Ethereum development.
- **OpenZeppelin Contracts:** Secure, community-vetted smart contract libraries.
- **Node.js:** (Optional) For any frontend or additional tooling.
- **Rust:** (Optional) Required for installing Foundry.

---

## Prerequisites

Before setting up this project, ensure you have the following installed:

- **Rust:** [Install Rust](https://www.rust-lang.org/tools/install)
- **Foundry:** [Foundry Installation Guide](https://book.getfoundry.sh/getting-started/installation.html)
- **Node.js:** [Install Node.js](https://nodejs.org/) (if you plan on running or developing the frontend)
- **Git:** [Install Git](https://git-scm.com/)

---

## Installation

### Clone the Repository

```bash
git clone https://github.com/rajeshchau/DEHIX-NFT.git
cd DEHIX-NFT

# DEHIX-NFT Installation and Configuration Guide

## Install Smart Contract Dependencies

Use Foundry to install external dependencies (such as OpenZeppelin contracts):

```bash
forge install OpenZeppelin/openzeppelin-contracts
```

## (Optional) Install Frontend Dependencies

If your project includes a frontend (e.g., in a `frontend/` directory):

```bash
cd frontend
npm install
cd ..
```

## Configuration

### Foundry Configuration

Ensure you have a `foundry.toml` file in the root directory with the following content:

```toml
[profile.default]
src = "src"
out = "out"
libs = ["lib"]

# Remappings allow Foundry to resolve import paths
remappings = ["@openzeppelin/=lib/openzeppelin-contracts/"]

optimizer = true
optimizer_runs = 200
evm_version = "london"

[profile.release]
optimizer = true
optimizer_runs = 500
evm_version = "london"
```

### Remappings

Ensure you have a `remappings.txt` file in your project root with:

```plaintext
@openzeppelin/=lib/openzeppelin-contracts/
```

This configuration ensures that imports like `@openzeppelin/contracts/...` are correctly resolved.

## Project Structure

Below is an overview of the typical project structure:

```bash
DEHIX-NFT/
├── contracts/           # Solidity smart contracts (e.g., DEHIX-NFT contract)
├── script/              # Deployment scripts written in Solidity or JavaScript
├── test/                # Solidity tests using Foundry's test framework
├── frontend/            # (Optional) Frontend code for interacting with the dApp
├── backend/             # (Optional) Backend services
├── lib/                 # External libraries (e.g., OpenZeppelin contracts)
├── remappings.txt       # Remapping file for Foundry
├── foundry.toml         # Foundry configuration file
└── README.md            # This documentation file
```

## Usage

### Building the Smart Contracts

To compile the smart contracts using Foundry, run:

```bash
forge build
```

This command compiles all Solidity files in your `contracts/` directory and outputs the artifacts to the `out/` directory.

### Running Tests

To run the tests, execute:

```bash
forge test
```

This command executes all tests found in the `test/` directory.

### Code Formatting

To format your Solidity files for consistent style, run:

```bash
forge fmt
```

### Running a Local Ethereum Node

Foundry comes with **Anvil**, a local Ethereum node. Start it by running:

```bash
anvil
```

This command starts a local node on `http://127.0.0.1:8545` which you can use for development and testing.

### Deploying Contracts

Deploy your smart contracts to a network using a deployment script. For example, if you have a deployment script at `script/Deploy.s.sol`, run:

```bash
forge script script/Deploy.s.sol:Deploy --rpc-url <your_rpc_url> --private-key <your_private_key> --broadcast
```

Replace `<your_rpc_url>` with the RPC URL of your network (e.g., from Infura or Alchemy) and `<your_private_key>` with your private key.

## Contributing

Contributions are highly welcome! To contribute:

- **Fork the Repository:** Click the "Fork" button on GitHub.
- **Create a Branch:** Create a new branch for your feature or bug fix.
- **Commit Changes:** Make your changes and commit them with clear messages.
- **Push & Open PR:** Push your branch to your fork and open a pull request to the main repository.
- **Review:** Collaborate with maintainers on any changes or improvements.

## License

This project is licensed under the MIT License. See the LICENSE file for full details.

## Acknowledgements

- **Foundry:** Foundry Book for providing an excellent Ethereum development toolkit.
- **OpenZeppelin:** For offering secure, well-audited smart contract libraries.
- **Ethereum Community:** For continuous support and a wealth of learning resources.

## Additional Resources

- [Official DEHIX Website](https://dehix.org/)
- [DEHIX API Documentation](https://devapi.dehix.org/documentation/static/index.html)
- [NFT Development Guides & Tutorials](https://medium.com/tag/nft)
- [Foundry GitHub Repository](https://github.com/foundry-rs/foundry)

---

Happy Coding!
