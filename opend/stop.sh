#!/bin/bash

# OpenD NFT Marketplace Stop Script

echo "🛑 Stopping OpenD NFT Marketplace..."

# Stop webpack dev server
echo "Stopping frontend..."
pkill -f webpack 2>/dev/null || true
pkill -f npm 2>/dev/null || true

# Stop DFX
echo "Stopping DFX..."
dfx stop 2>/dev/null || true
pkill icx-proxy 2>/dev/null || true
pkill dfx 2>/dev/null || true

echo "✅ All services stopped!"
echo ""
echo "To restart, run: ./start.sh"
