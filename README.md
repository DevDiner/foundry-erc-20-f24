# ERC20 Token Project on Sepolia Testnet

## Overview
This project implements and tests an ERC20 token on the Ethereum Sepolia testnet. The project includes smart contracts for creating a standard ERC20 token, deployment and interaction scripts, and comprehensive test cases to ensure the contract's reliability and functionality. Additionally, it features configuration files to facilitate deployment and testing.

## Project Structure
### 1. **Smart Contracts**
- **`ERC20Token.sol`**:
  - An ERC20 token contract built using OpenZeppelin's `ERC20` implementation to ensure secure and robust token functionality.
  - The contract includes basic features like minting an initial supply and standard ERC20 operations (`transfer`, `balanceOf`, etc.).
- **`ManualToken.sol`**:
  - A simplified implementation of an ERC20-like token with basic balance tracking and transfer functionality.
  - Serves as an educational example to understand how ERC20 tokens work at a fundamental level.

### 2. **Deployment Script**
- **`DeployERC20Token.s.sol`**:
  - A script to deploy the `ERC20Token` contract on the blockchain.
  - Uses Foundry's `forge script` and `vm.startBroadcast()` to handle the deployment process.
  - Allows deployment with an initial token supply of `1000 ether` (1000 * 10^18 wei).

### 3. **Testing**
- **`ERC20TokenTest.sol`**:
  - A comprehensive test suite for the `ERC20Token` contract using Foundry's `forge-std/Test.sol`.
  - **Test Cases Include**:
    - Verifying initial token transfer to `bob` with `testBobBalance`.
    - Testing `approve` and `transferFrom` functions with `testAllowance` to ensure proper approval and transfer of tokens on behalf of another address.

### 4. **Configuration Files**
- **`Makefile`**:
  - Includes commands for building, testing, cleaning, formatting, and deploying the project.
  - Commands for deployment on local Ethereum nodes and the Sepolia testnet.
- **`.env`**:
  - Contains environment variables for network URLs, private keys, and other sensitive data.
  - Example variables:
    - `SEPOLIA_RPC_URL`: RPC URL for the Sepolia testnet.
    - `ACCOUNT`: Account used for deployment.
    - `PRIVATE_KEY`: Private key for deployment.
    - `ETHERSCAN_API_KEY`: API key for contract verification on Etherscan.

- **`foundry.toml`**:
  - Configuration file for Foundry to specify project paths, libraries, and remappings.
  - Includes necessary OpenZeppelin remappings for secure contract development.

## Prerequisites
- **Node.js** and **npm/yarn** (for dependency management)
- **Foundry**: A fast, modular toolkit for Ethereum application development.
- **OpenZeppelin Contracts**: For using pre-built, secure implementations of standard Ethereum smart contracts.

## Installation and Setup
1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd <repository-name>
   ```

2. **Install Foundry**:
   ```bash
   curl -L https://foundry.paradigm.xyz | bash
   foundryup
   ```

3. **Install Dependencies**:
   ```bash
   forge install
   ```

4. **Configure Environment Variables**:
   - Create a `.env` file and add your RPC URL, private key, and other necessary variables:
     ```env
     SEPOLIA_RPC_URL=https://eth-sepolia.g.alchemy.com/v2/YOUR_API_KEY
     PRIVATE_KEY=your-private-key
     ETHERSCAN_API_KEY=your-etherscan-api-key
     ```

## How to Run the Project
### 1. **Build the Contracts**:
   ```bash
   forge build
   ```

### 2. **Run Tests**:
   ```bash
   forge test
   ```
   - Runs the test suite in `ERC20TokenTest.sol` and validates contract functionality.

### 3. **Deploy Contracts**:
   **Local Deployment**:
   ```bash
   forge script script/DeployERC20Token.s.sol:DeployERC20Token --rpc-url http://localhost:8545 --private-key $(PRIVATE_KEY) --broadcast
   ```

   **Sepolia Deployment**:
   ```bash
   forge script script/DeployERC20Token.s.sol:DeployERC20Token --rpc-url $(SEPOLIA_RPC_URL) --account $(ACCOUNT) --broadcast --verify
   ```

### 4. **Verify Contracts**:
   - Ensure the `ETHERSCAN_API_KEY` is set in your `.env` file.
   - Run the verification script:
     ```bash
     forge verify-contract <deployed-contract-address> src/ERC20Token.sol:ERC20Token --etherscan-api-key $(ETHERSCAN_API_KEY)
     ```

## Key Features of the Project
- **ERC20 Standard Compliance**: The project follows the ERC20 standard, ensuring compatibility with wallets and other tools that support ERC20 tokens.
- **Custom Initial Supply**: The `DeployERC20Token` script sets up the token with a configurable initial supply.
- **Comprehensive Testing**: Unit tests cover the basic functionality, including transfers, balances, and allowances.
- **Deployment Flexibility**: Scripts support deployment to local testnets and public Ethereum testnets like Sepolia.
- **Makefile Automation**: Streamlines common operations like build, test, and deploy.

## Potential Enhancements
1. **Implement Burn and Mint Functions**:
   - Add functions to allow authorized users to burn or mint tokens as needed.
2. **Upgrade Security**:
   - Introduce role-based access control for sensitive functions using OpenZeppelin's `AccessControl`.
3. **Gas Optimization**:
   - Analyze and optimize the contract for lower gas costs.
4. **Advanced Testing**:
   - Include edge cases and stress tests for better coverage.
5. **Integrate a Frontend**:
   - Develop a frontend using `React` or `Next.js` with `ethers.js` for interacting with the token contract.

