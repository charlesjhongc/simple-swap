# Simple Swap

Simple Swap 是一個簡單的 swap dapp，用戶 swap 時提供任意代幣任意數量，會獲得等數量的 Simple USD token，目前支援用戶直接上鏈操作以及 relayer 代為上鏈兩種方式，後者需要用戶提供鏈下簽名然後由 relayer 發送交易上鏈執行，請你設計一套簽名機制加入到 `swapWithSignature()` function 中，實現 relayer 代為上鏈的驗證檢查，簽名驗證需支援 EOA 與合約錢包兩種帳戶。

# Step

-   `yarn install`
-   `git submodule update --init --recursive`
-   Install foundry (https://book.getfoundry.sh/getting-started/installation)

# Note

-   請補上 `contracts/SimpleSwap.sol` & `test/SimpleSwap.t.sol` 兩處 TODO 的實作
-   請 fork 之後在自己的 repo 中開發
-   請保留完整 git history

# Reference

-   [EIP-191](https://eips.ethereum.org/EIPS/eip-191)
-   [EIP-712](https://eips.ethereum.org/EIPS/eip-712)
-   [EIP-1271](https://eips.ethereum.org/EIPS/eip-1271)
-   [Foundry](https://book.getfoundry.sh/getting-started/installation)
