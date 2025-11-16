#!/bin/bash

# OpenD NFT Marketplace Startup Script
# This script starts all services and sets up demo NFTs

set -e

echo "🚀 Starting OpenD NFT Marketplace..."
echo ""

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Step 1: Clean up any existing processes
echo -e "${BLUE}Step 1: Cleaning up existing processes...${NC}"
pkill -f webpack 2>/dev/null || true
pkill icx-proxy 2>/dev/null || true
pkill dfx 2>/dev/null || true
sleep 2

# Step 2: Start DFX
echo -e "${BLUE}Step 2: Starting DFX replica...${NC}"
dfx start --clean --background
sleep 5

# Step 3: Deploy canisters
echo -e "${BLUE}Step 3: Deploying canisters...${NC}"
dfx deploy token
dfx deploy opend
dfx deploy opend_assets

# Step 4: Get canister IDs
echo -e "${BLUE}Step 4: Getting canister IDs...${NC}"
TOKEN_ID=$(dfx canister id token)
OPEND_ID=$(dfx canister id opend)
echo "Token canister: $TOKEN_ID"
echo "OpenD canister: $OPEND_ID"

# Step 5: Create demo NFTs
echo -e "${BLUE}Step 5: Creating demo NFTs...${NC}"

echo "Minting NFT #1..."
NFT1=$(dfx canister call opend mint '(vec {137; 80; 78; 71; 13; 10; 26; 10; 0; 0; 0; 13; 73; 72; 68; 82; 0; 0; 0; 10; 0; 0; 0; 10; 8; 6; 0; 0; 0; 141; 50; 207; 189; 0; 0; 0; 1; 115; 82; 71; 66; 0; 174; 206; 28; 233; 0; 0; 0; 68; 101; 88; 73; 102; 77; 77; 0; 42; 0; 0; 0; 8; 0; 1; 135; 105; 0; 4; 0; 0; 0; 1; 0; 0; 0; 26; 0; 0; 0; 0; 0; 3; 160; 1; 0; 3; 0; 0; 0; 1; 0; 1; 0; 0; 160; 2; 0; 4; 0; 0; 0; 1; 0; 0; 0; 10; 160; 3; 0; 4; 0; 0; 0; 1; 0; 0; 0; 10; 0; 0; 0; 0; 59; 120; 184; 245; 0; 0; 0; 113; 73; 68; 65; 84; 24; 25; 133; 143; 203; 13; 128; 48; 12; 67; 147; 94; 97; 30; 24; 0; 198; 134; 1; 96; 30; 56; 151; 56; 212; 85; 68; 17; 88; 106; 243; 241; 235; 39; 42; 183; 114; 137; 12; 106; 73; 236; 105; 98; 227; 152; 6; 193; 42; 114; 40; 214; 126; 50; 52; 8; 74; 183; 108; 158; 159; 243; 40; 253; 186; 75; 122; 131; 64; 0; 160; 192; 168; 109; 241; 47; 244; 154; 152; 112; 237; 159; 252; 105; 64; 95; 48; 61; 12; 3; 61; 167; 244; 38; 33; 43; 148; 96; 3; 71; 8; 102; 4; 43; 140; 164; 168; 250; 23; 219; 242; 38; 84; 91; 18; 112; 63; 0; 0; 0; 0; 73; 69; 78; 68; 174; 66; 96; 130;}, "CryptoDunks #123")' 2>&1 | grep -oP 'principal "\K[^"]+')
echo "  Created: $NFT1"

echo "Minting NFT #2..."
NFT2=$(dfx canister call opend mint '(vec {137; 80; 78; 71; 13; 10; 26; 10; 0; 0; 0; 13; 73; 72; 68; 82; 0; 0; 0; 10; 0; 0; 0; 10; 8; 6; 0; 0; 0; 141; 50; 207; 189; 0; 0; 0; 1; 115; 82; 71; 66; 0; 174; 206; 28; 233; 0; 0; 0; 68; 101; 88; 73; 102; 77; 77; 0; 42; 0; 0; 0; 8; 0; 1; 135; 105; 0; 4; 0; 0; 0; 1; 0; 0; 0; 26; 0; 0; 0; 0; 0; 3; 160; 1; 0; 3; 0; 0; 0; 1; 0; 1; 0; 0; 160; 2; 0; 4; 0; 0; 0; 1; 0; 0; 0; 10; 160; 3; 0; 4; 0; 0; 0; 1; 0; 0; 0; 10; 0; 0; 0; 0; 59; 120; 184; 245; 0; 0; 0; 113; 73; 68; 65; 84; 24; 25; 133; 143; 203; 13; 128; 48; 12; 67; 147; 94; 97; 30; 24; 0; 198; 134; 1; 96; 30; 56; 151; 56; 212; 85; 68; 17; 88; 106; 243; 241; 235; 39; 42; 183; 114; 137; 12; 106; 73; 236; 105; 98; 227; 152; 6; 193; 42; 114; 40; 214; 126; 50; 52; 8; 74; 183; 108; 158; 159; 243; 40; 253; 186; 75; 122; 131; 64; 0; 160; 192; 168; 109; 241; 47; 244; 154; 152; 112; 237; 159; 252; 105; 64; 95; 48; 61; 12; 3; 61; 167; 244; 38; 33; 43; 148; 96; 3; 71; 8; 102; 4; 43; 140; 164; 168; 250; 23; 219; 242; 38; 84; 91; 18; 112; 63; 0; 0; 0; 0; 73; 69; 78; 68; 174; 66; 96; 130;}, "CryptoDunks #456")' 2>&1 | grep -oP 'principal "\K[^"]+')
echo "  Created: $NFT2"

# Step 6: List NFTs for sale
echo -e "${BLUE}Step 6: Listing NFTs on marketplace...${NC}"
dfx canister call opend listItem "(principal \"$NFT1\", 2)" > /dev/null
echo "  Listed NFT #1 for 2 DANG"
dfx canister call opend listItem "(principal \"$NFT2\", 5)" > /dev/null
echo "  Listed NFT #2 for 5 DANG"

# Step 7: Transfer ownership to OpenD
echo -e "${BLUE}Step 7: Transferring NFT ownership to OpenD...${NC}"
dfx canister call $NFT1 transferOwnership "(principal \"$OPEND_ID\")" > /dev/null
dfx canister call $NFT2 transferOwnership "(principal \"$OPEND_ID\")" > /dev/null
echo "  Ownership transferred"

# Step 8: Setup test user with tokens
echo -e "${BLUE}Step 8: Giving test user tokens...${NC}"
dfx canister call token transfer '(principal "2vxsx-fae", 100000)' > /dev/null
echo "  Transferred 100,000 DANG tokens to test user"

# Step 9: Build and start frontend
echo -e "${BLUE}Step 9: Building and starting frontend...${NC}"
npm run build > /dev/null 2>&1
npm start > /tmp/webpack.log 2>&1 &
sleep 8

# Step 10: Verify everything is running
echo -e "${BLUE}Step 10: Verifying deployment...${NC}"
if curl -s -o /dev/null -w "%{http_code}" http://localhost:8080/ | grep -q "200"; then
    echo -e "${GREEN}✅ Frontend is running!${NC}"
else
    echo -e "${YELLOW}⚠️  Frontend may still be starting...${NC}"
fi

echo ""
echo -e "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║                                                            ║${NC}"
echo -e "${GREEN}║  🎉  OpenD NFT Marketplace is ready!                       ║${NC}"
echo -e "${GREEN}║                                                            ║${NC}"
echo -e "${GREEN}║  🌐  Open in browser: http://localhost:8080/              ║${NC}"
echo -e "${GREEN}║                                                            ║${NC}"
echo -e "${GREEN}║  📋  What's available:                                     ║${NC}"
echo -e "${GREEN}║     • 2 NFTs listed on Discover page                      ║${NC}"
echo -e "${GREEN}║     • Test user has 100,000 DANG tokens                   ║${NC}"
echo -e "${GREEN}║     • Buy/Sell/Mint functionality ready                   ║${NC}"
echo -e "${GREEN}║                                                            ║${NC}"
echo -e "${GREEN}║  🔧  Canister IDs:                                         ║${NC}"
echo -e "${GREEN}║     Token:  $TOKEN_ID             ║${NC}"
echo -e "${GREEN}║     OpenD:  $OPEND_ID             ║${NC}"
echo -e "${GREEN}║                                                            ║${NC}"
echo -e "${GREEN}║  📝  To stop: ./stop.sh                                    ║${NC}"
echo -e "${GREEN}║                                                            ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""
