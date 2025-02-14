

```markdown
# DVIN-Vault

A Decentralized Token App on the Internet Computer!

## Overview

**DVIN-Vault** is a decentralized application (dApp) designed to manage tokens on the Internet Computer (ICP) platform. It allows users to check their token balances and transfer tokens seamlessly.

## Features

- **Check Balance**: Retrieve and display your token balance.
- **Transfer Tokens**: Send tokens to other principals.

## Prerequisites

- [dfx SDK](https://smartcontracts.org/docs/developers-guide/install-upgrade-remove.html) installed
- Node.js and npm installed

## Installation

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/melvinprince/DVIN-Vault.git
   cd DVIN-Vault
   ```

2. **Install Dependencies**:

   ```bash
   npm install
   ```

3. **Start the Local Development Environment**:

   ```bash
   dfx start --background
   ```

4. **Deploy the Canisters**:

   ```bash
   dfx deploy
   ```

## Usage

1. **Check Your Balance**:

   - Retrieve your principal ID:

     ```bash
     dfx identity get-principal
     ```

   - Store it in a variable:

     ```bash
     OWNER_PUBLIC_KEY="principal \"$(dfx identity get-principal)\""
     ```

   - Check the owner's balance:

     ```bash
     dfx canister call token balanceOf "($OWNER_PUBLIC_KEY)"
     ```

2. **Charge the Canister**:

   - Retrieve the canister ID:

     ```bash
     dfx canister id token
     ```

   - Store the canister ID in a variable:

     ```bash
     CANISTER_PUBLIC_KEY="principal \"$(dfx canister id token_frontend)\""
     ```

   - Transfer tokens to the canister's principal ID:

     ```bash
     dfx canister call token transfer "($CANISTER_PUBLIC_KEY, 500_000_000)"
     ```

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For any inquiries or support, reach out to:

- **GitHub**: [melvinprince](https://github.com/melvinprince)
```

The END
