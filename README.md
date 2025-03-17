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
