# 📦 Upgradeable Smart Contract - Box Project

Welcome to the **Upgradeable Smart Contract - Box Project**! 🎉 This project demonstrates how to deploy and upgrade a smart contract using the **UUPS Proxy pattern** and **ERC1967Proxy**. 

## 🚀 What is This Project About?
This project consists of two versions of a smart contract (`BoxV1` and `BoxV2`) that store a number on the blockchain. With the power of **Upgradeable Contracts**, we can improve or modify our contract without losing stored data!

## 🏗️ Project Structure

```
📂 src/
 ├── BoxV1.sol      # First version of the contract
 ├── BoxV2.sol      # Upgraded version of the contract
📂 script/
 ├── DeployBox.s.sol  # Script to deploy the Box contract with proxy
 ├── UpgradeBox.s.sol # Script to upgrade BoxV1 to BoxV2
```

## ⚙️ How It Works
1. **Deploy `BoxV1` with an upgradeable proxy** using `DeployBox.s.sol`.
2. **Store a number** in `BoxV1`.
3. **Upgrade the contract to `BoxV2`** without losing stored data using `UpgradeBox.s.sol`.
4. **`BoxV2` adds a new function `setNumber(uint256)` to modify the stored value.**

## 📌 How to Deploy and Upgrade

### 1️⃣ Deploy `BoxV1`
You can use either manual (using CLI) or Makefile:

#### **Using CLI**
```sh
forge script script/DeployBox.s.sol --rpc-url YOUR_RPC_URL --broadcast
```

#### **Using Makefile**
If you have a Makefile, you can simply run:
```sh
make deploy
```

### 2️⃣ Upgrade to `BoxV2`
#### **Using CLI**
```sh
forge script script/UpgradeBox.s.sol --rpc-url YOUR_RPC_URL --broadcast
```

#### **Using Makefile**
```sh
make upgrade
```

## 🔥 Quick Test Commands
### Read Stored Value
```sh
cast call --rpc-url YOUR_RPC_URL <PROXY_ADDRESS> "getNumber()(uint256)"
```
### Upgrade Contract
```sh
cast send --rpc-url YOUR_RPC_URL --private-key YOUR_PRIVATE_KEY <PROXY_ADDRESS> "upgradeTo(address)" <NEW_IMPLEMENTATION_ADDRESS>
```

## 🎯 Why Use Upgradeable Contracts?
✅ **Modify Smart Contracts Without Losing Data**  
✅ **Reduce Deployment Costs** (only upgrade the logic, not the storage)  
✅ **Fix Bugs or Add New Features Easily**  

## 🏆 Features
- **Upgradeable via UUPS Proxy** (Minimal Gas Cost!)
- **Uses OpenZeppelin Libraries** for security and efficiency
- **Fully compatible with Foundry for fast testing & deployment**

## 🎉 Conclusion
With this setup, you have a **fully upgradeable** smart contract! Now, you can extend the functionality without redeploying everything from scratch. Happy building! 🚀

---
📌 **Follow me for more Solidity projects!** 🧑‍💻

