# 🎨 NFT Token Marketplace - OpenD

A decentralized NFT marketplace built on the Internet Computer Protocol (ICP) with DANG token integration for seamless NFT trading.

## ✨ Features

- 🖼️ **Mint NFTs**: Create unique NFTs with custom images and names
- 💰 **Buy & Sell**: Trade NFTs using DANG tokens
- 🔍 **Discover**: Browse all listed NFTs on the marketplace
- 👤 **My NFTs**: View and manage your NFT collection
- 💳 **Token System**: Integrated DANG token for transactions
- ⚡ **Real-time Updates**: Instant UI updates after transactions

## 🚀 Quick Start (Recommended)

Run the entire application with demo NFTs in **one command**:

```bash
cd opend
./start.sh
```

This will automatically:
- ✅ Start local DFX replica
- ✅ Deploy all canisters (token, opend, opend_assets)
- ✅ Create 2 demo NFTs ("CryptoDunks #123" & "CryptoDunks #456")
- ✅ List them for sale (2 DANG & 5 DANG)
- ✅ Give test user 100,000 DANG tokens
- ✅ Start the frontend on **http://localhost:8080/**

### Stop the Application

```bash
cd opend
./stop.sh
```

## 📋 Manual Setup (Step by Step)

If you prefer to run commands individually:

### 1. Start DFX

```bash
cd opend
dfx start --clean
```

### 2. Deploy Canisters

```bash
dfx deploy token
dfx deploy opend
dfx deploy opend_assets
```

### 3. Start Frontend

```bash
npm start
```

### 4. Access Application

Open your browser: **http://localhost:8080/**

## 🎮 How to Use

### Discover Page
- Browse all NFTs listed for sale
- See prices in DANG tokens
- Click "Buy" to purchase (requires DANG tokens)

### Minter Page
- Upload an image (PNG, JPG, GIF, SVG, WebP)
- Enter a collection name
- Click "Mint NFT" to create your NFT

### My NFTs Page
- View all your owned NFTs
- Click "Sell" to list an NFT
- Enter price in DANG tokens
- Confirm to list on marketplace

## 🏗️ Architecture

### Smart Contracts (Motoko)

- **OpenD Canister**: Main marketplace logic
  - Minting NFTs
  - Listing/delisting
  - Purchase completion
  - Ownership tracking

- **Token Canister**: DANG token system
  - Balance tracking
  - Token transfers
  - Faucet for testing

- **NFT Canister**: Individual NFT instances
  - Stores NFT metadata
  - Handles ownership transfers
  - Returns image assets

### Frontend (React)

- **React 17** with Hooks
- **React Router** for navigation
- **Bootstrap** for styling
- **@dfinity/agent** for IC communication

## 📦 Tech Stack

- **Backend**: Motoko (Internet Computer)
- **Frontend**: React, JavaScript, CSS
- **Build**: Webpack 5, Babel
- **Blockchain**: Internet Computer Protocol (ICP)
- **Package Manager**: npm

## 🧪 Testing

The `start.sh` script automatically creates test NFTs. You can also create them manually:

### Create Test NFT

```bash
dfx canister call opend mint '(vec {137; 80; 78; 71; 13; 10; 26; 10; 0; 0; 0; 13; 73; 72; 68; 82; 0; 0; 0; 10; 0; 0; 0; 10; 8; 6; 0; 0; 0; 141; 50; 207; 189; 0; 0; 0; 1; 115; 82; 71; 66; 0; 174; 206; 28; 233; 0; 0; 0; 68; 101; 88; 73; 102; 77; 77; 0; 42; 0; 0; 0; 8; 0; 1; 135; 105; 0; 4; 0; 0; 0; 1; 0; 0; 0; 26; 0; 0; 0; 0; 0; 3; 160; 1; 0; 3; 0; 0; 0; 1; 0; 1; 0; 0; 160; 2; 0; 4; 0; 0; 0; 1; 0; 0; 0; 10; 160; 3; 0; 4; 0; 0; 0; 1; 0; 0; 0; 10; 0; 0; 0; 0; 59; 120; 184; 245; 0; 0; 0; 113; 73; 68; 65; 84; 24; 25; 133; 143; 203; 13; 128; 48; 12; 67; 147; 94; 97; 30; 24; 0; 198; 134; 1; 96; 30; 56; 151; 56; 212; 85; 68; 17; 88; 106; 243; 241; 235; 39; 42; 183; 114; 137; 12; 106; 73; 236; 105; 98; 227; 152; 6; 193; 42; 114; 40; 214; 126; 50; 52; 8; 74; 183; 108; 158; 159; 243; 40; 253; 186; 75; 122; 131; 64; 0; 160; 192; 168; 109; 241; 47; 244; 154; 152; 112; 237; 159; 252; 105; 64; 95; 48; 61; 12; 3; 61; 167; 244; 38; 33; 43; 148; 96; 3; 71; 8; 102; 4; 43; 140; 164; 168; 250; 23; 219; 242; 38; 84; 91; 18; 112; 63; 0; 0; 0; 0; 73; 69; 78; 68; 174; 66; 96; 130;}, "CryptoDunks #999")'
```

Returns NFT canister ID, for example: `rdmx6-jaaaa-aaaaa-aaadq-cai`

### List NFT

```bash
dfx canister call opend listItem '(principal "rdmx6-jaaaa-aaaaa-aaadq-cai", 10)'
```

### Get OpenD Canister ID

```bash
dfx canister id opend
```

### Transfer Ownership to OpenD

```bash
dfx canister call rdmx6-jaaaa-aaaaa-aaadq-cai transferOwnership '(principal "r7inp-6aaaa-aaaaa-aaabq-cai")'
```

### Give Tokens to User

```bash
dfx canister call token transfer '(principal "2vxsx-fae", 100000)'
```

## 📁 Project Structure

```
opend/
├── src/
│   ├── NFT/              # NFT actor class
│   │   └── nft.mo
│   ├── opend/            # Main marketplace canister
│   │   └── main.mo
│   ├── token/            # DANG token canister
│   │   └── token.mo
│   ├── opend_assets/     # Frontend
│   │   ├── assets/       # Images, CSS
│   │   └── src/
│   │       ├── components/
│   │       │   ├── App.jsx
│   │       │   ├── Header.jsx
│   │       │   ├── Gallery.jsx
│   │       │   ├── Item.jsx
│   │       │   ├── Minter.jsx
│   │       │   └── ...
│   │       └── index.jsx
│   └── declarations/     # Auto-generated canister interfaces
├── dfx.json             # DFX configuration
├── package.json         # NPM dependencies
├── webpack.config.js    # Webpack config
├── start.sh            # 🚀 One-command startup script
└── stop.sh             # Stop all services
```

## 🛠️ Development Commands

### View Canister IDs

```bash
dfx canister id opend
dfx canister id token
```

### Check Canister Status

```bash
dfx canister status opend
dfx canister status token
```

### Check Token Balance

```bash
dfx canister call token balanceOf '(principal "YOUR_PRINCIPAL_HERE")'
```

### View Listed NFTs

```bash
dfx canister call opend getListedNFTs
```

### Get Your Principal

```bash
dfx identity get-principal
```

## 🔧 Troubleshooting

### Port Already in Use

```bash
# Kill processes on ports 8000 and 8080
lsof -ti:8000 | xargs kill -9
lsof -ti:8080 | xargs kill -9
```

### Reset Everything

```bash
./stop.sh
dfx start --clean --background
./start.sh
```

### Webpack Not Starting

```bash
cd opend
rm -rf node_modules dist
npm install
npm start
```

## 📝 License

Apache License 2.0 - See LICENSE file for details

Copyright 2022 London App Brewery LTD (www.appbrewery.com)

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📧 Contact

For questions or support, please open an issue on GitHub.

---

**Built with ❤️ on the Internet Computer** 🚀
