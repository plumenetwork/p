#!/bin/sh

forge script script/DeployUpgradeableToken.s.sol \
  --rpc-url https://ethereum-sepolia-rpc.publicnode.com \
  --verify --verifier etherscan --verifier-url https://api-sepolia.etherscan.io/api \
  --broadcast -i 1