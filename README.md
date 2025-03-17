# 🚀 DEHIX-NFT 🎨🔗

DEHIX-NFT is a 🌍 decentralized application (dApp) built on ⛓️ Ethereum that leverages blockchain technology to create, manage, and trade 🖼️ Non-Fungible Tokens (NFTs). This project is designed to issue 🎓 NFT certificates, enabling secure, transparent, and decentralized validation of digital credentials. 

> ⚠️ **Disclaimer:** This project is provided for 📚 educational purposes only. Always perform thorough 🛠️ testing and security 🔍 audits before deploying any smart contracts to a production environment.

---

## 📜 Table of Contents 📜

- [📖 Overview](#overview)
- [✨ Features](#features)
- [🛠️ Technologies Used](#technologies-used)
- [🔑 Prerequisites](#prerequisites)
- [📦 Installation](#installation)
  - [📂 Clone the Repository](#clone-the-repository)
  - [🔧 Install Smart Contract Dependencies](#install-smart-contract-dependencies)
  - [💻 (Optional) Install Frontend Dependencies](#optional-install-frontend-dependencies)
- [⚙️ Configuration](#configuration)
  - [🔧 Foundry Configuration](#foundry-configuration)
  - [📍 Remappings](#remappings)
- [📂 Project Structure](#project-structure)
- [🚀 Usage](#usage)
  - [🔨 Building the Smart Contracts](#building-the-smart-contracts)
  - [🧪 Running Tests](#running-tests)
  - [🎨 Code Formatting](#code-formatting)
  - [⚡ Running a Local Ethereum Node](#running-a-local-ethereum-node)
  - [🚀 Deploying Contracts](#deploying-contracts)
- [🤝 Contributing](#contributing)
- [📜 License](#license)
- [🎖️ Acknowledgements](#acknowledgements)
- [🔗 Additional Resources](#additional-resources)

---

## 📖 Overview

DEHIX-NFT is a powerful ⚡ NFT project that utilizes modern development tools such as [🦄 Foundry](https://book.getfoundry.sh/) for smart contract compilation, testing, and deployment, along with OpenZeppelin’s secure 🔒 and battle-tested smart contract libraries. This project supports multiple 🎟️ sale phases (presale with whitelist verification and public sale) and integrates 🎼 ERC2981 royalties to ensure creators receive a percentage 💰 of secondary sales.

---

## ✨ Features

- 🎓 **NFT Certificate Minting:** Create NFTs with unique metadata representing certificates.
- 🎟️ **Sale Phases:** Presale (whitelist-based) and public minting functionality.
- 💰 **Royalties:** Integrated ERC2981 standard for automatic royalty distribution.
- 🔒 **Security:** Implements pausable functionality and reentrancy guard.
- ⚙️ **Administration:** Owner-controlled configuration (mint price, supply cap, whitelist, etc.).
- 🚀 **Full Deployment & Testing:** Built using Foundry for rapid development and testing.

---

## 🛠️ Technologies Used

- 💻 **Solidity:** Smart contract programming language.
- ⚡ **Foundry:** A fast, portable, and modular toolkit for Ethereum development.
- 🏰 **OpenZeppelin Contracts:** Secure, community-vetted smart contract libraries.
- 🌍 **Node.js:** (Optional) For any frontend or additional tooling.
- 🦀 **Rust:** (Optional) Required for installing Foundry.

---

## 🔑 Prerequisites

Before setting up this project, ensure you have the following installed:

- 🦀 **Rust:** [Install Rust](https://www.rust-lang.org/tools/install)
- ⚡ **Foundry:** [Installation Guide](https://book.getfoundry.sh/getting-started/installation.html)
- 🌍 **Node.js:** [Install Node.js](https://nodejs.org/)
- 🖥️ **Git:** [Install Git](https://git-scm.com/)

---

## 📦 Installation

### 📂 Clone the Repository

```bash
git clone https://github.com/rajeshchau/DEHIX-NFT.git
cd DEHIX-NFT
```

### 🔧 Install Smart Contract Dependencies

```bash
forge install OpenZeppelin/openzeppelin-contracts
```

### 💻 (Optional) Install Frontend Dependencies

```bash
cd frontend
npm install
cd ..
```

---

## ⚙️ Configuration

### 🔧 Foundry Configuration

Ensure you have a `foundry.toml` file in the root directory with the proper settings.

### 📍 Remappings

Ensure your `remappings.txt` file includes:

```plaintext
@openzeppelin/=lib/openzeppelin-contracts/
```

---

## 📂 Project Structure

```bash
DEHIX-NFT/
├── contracts/ 📝 Solidity smart contracts
├── script/ 🚀 Deployment scripts
├── test/ 🧪 Solidity tests
├── frontend/ 🌍 (Optional) Frontend code
├── backend/ 🖥️ (Optional) Backend services
├── lib/ 📚 External libraries
└── README.md 📜 Documentation
```

---

## 🚀 Usage

### 🔨 Building the Smart Contracts

```bash
forge build
```

### 🧪 Running Tests

```bash
forge test
```

### 🎨 Code Formatting

```bash
forge fmt
```

### ⚡ Running a Local Ethereum Node

```bash
anvil
```

### 🚀 Deploying Contracts

```bash
forge script script/Deploy.s.sol:Deploy --rpc-url <your_rpc_url> --private-key <your_private_key> --broadcast
```

---

## 🤝 Contributing

- 🍴 **Fork the Repository**
- 🌿 **Create a Branch**
- 🛠️ **Commit Changes**
- 🚀 **Push & Open PR**
- 👀 **Review & Merge**

---

## 📜 License

This project is licensed under the MIT License. See the LICENSE file for details.

---

## 🎖️ Acknowledgements

- 🦄 **Foundry:** Ethereum development toolkit.
- 🏰 **OpenZeppelin:** Secure smart contract libraries.
- 🌍 **Ethereum Community:** Continuous support & resources.

---

## 🔗 Additional Resources

- [🌐 Official DEHIX Website](https://dehix.org/)
- [📜 DEHIX API Documentation](https://devapi.dehix.org/documentation/static/index.html)
- [📚 NFT Development Guides](https://medium.com/tag/nft)
- [🛠️ Foundry GitHub](https://github.com/foundry-rs/foundry)

---

🚀 **Happy Coding!** 🎉

