# 🗳️ Voting Smart Contract (Solidity)

This project is a simple decentralized voting contract written in Solidity. It allows users to vote once for a candidate from a predefined list.

## 🔧 Features

- Struct-based candidate storage
- Admin-defined candidate list during deployment
- One-vote-per-address enforcement
- Function to determine the winning candidate
- Works with Remix IDE (Remix VM)

## 🛠 How to Use

1. Open [Remix IDE](https://remix.ethereum.org/)
2. Paste the code into a file named `Voting.sol`
3. Compile using Solidity `0.8.x`
4. Deploy with an array of candidate names (e.g. `["Alice", "Bob", "Charlie"]`)
5. Use `vote(index)` to cast a vote
6. Call `getWinner()` to see who has the most votes

## ✅ Example Deployment Input
["Alice", "Bob", "Charlie"]
