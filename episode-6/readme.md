## Stake NFT for Reward


- remember to approve contract to use token
- make `erc20` & `erc721` for test

### learn about `stake logic` [here](https://github.com/mosi-sol/live-contracts-s2/tree/main/05-simple-staking) 

##

expermential code & idea. this kind of dapp can be the next hype or wave. (3rd generation of dapp`s)


##

- decress reward by decressing value from `100` in `line 8`


```
stake source for erc20 tokens idea & credit : https://www.smartcontract.engineer/
git: t4sk
```

<p align="right">
17Feb 2022 - live video ( learn solidity in farsi for free )
  </p>

---

### contract info

|  Contract  |         Type        |       Bases      |                  |                 |
|:----------:|:-------------------:|:----------------:|:----------------:|:---------------:|
|     └      |  **Function Name**  |  **Visibility**  |  **Mutability**  |  **Modifiers**  |
||||||
| **StakingRewards** | Implementation |  |||
| └ | <Constructor> | Public ❗️ | 🛑  |NO❗️ |
| └ | rewardPerToken | Public ❗️ |   |NO❗️ |
| └ | earned | Public ❗️ |   |NO❗️ |
| └ | stake | External ❗️ | 🛑  | updateReward |
| └ | withdraw | External ❗️ | 🛑  | updateReward |
| └ | getReward | External ❗️ | 🛑  | updateReward |
||||||
| **IERC20** | Interface |  |||
| └ | totalSupply | External ❗️ |   |NO❗️ |
| └ | balanceOf | External ❗️ |   |NO❗️ |
| └ | transfer | External ❗️ | 🛑  |NO❗️ |
| └ | allowance | External ❗️ |   |NO❗️ |
| └ | approve | External ❗️ | 🛑  |NO❗️ |
| └ | transferFrom | External ❗️ | 🛑  |NO❗️ |
||||||
| **IERC721** | Interface |  |||
| └ | balanceOf | External ❗️ |   |NO❗️ |
| └ | ownerOf | External ❗️ |   |NO❗️ |
| └ | safeTransferFrom | External ❗️ |  💵 |NO❗️ |
| └ | safeTransferFrom | External ❗️ |  💵 |NO❗️ |
| └ | transferFrom | External ❗️ |  💵 |NO❗️ |
| └ | approve | External ❗️ |  💵 |NO❗️ |
| └ | setApprovalForAll | External ❗️ | 🛑  |NO❗️ |
| └ | getApproved | External ❗️ |   |NO❗️ |
| └ | isApprovedForAll | External ❗️ |   |NO❗️ |
||||||
| **IERC165** | Interface |  |||
| └ | supportsInterface | External ❗️ |   |NO❗️ |
||||||
| **IERC721TokenReceiver** | Interface |  |||
| └ | onERC721Received | External ❗️ | 🛑  |NO❗️ |
||||||
| **IERC721Metadata** | Interface |  |||
| └ | name | External ❗️ |   |NO❗️ |
| └ | symbol | External ❗️ |   |NO❗️ |
| └ | tokenURI | External ❗️ |   |NO❗️ |
||||||
| **IERC721Enumerable** | Interface |  |||
| └ | totalSupply | External ❗️ |   |NO❗️ |
| └ | tokenByIndex | External ❗️ |   |NO❗️ |
| └ | tokenOfOwnerByIndex | External ❗️ |   |NO❗️ |
||||||
| **AuctionNFT** | Implementation | Ownable, ReentrancyGuard |||
| └ | <Constructor> | Public ❗️ | 🛑  |NO❗️ |
| └ | startAuction | External ❗️ | 🛑  | onlyOwner |
| └ | bid | External ❗️ |  💵 |NO❗️ |
| └ | end | External ❗️ | 🛑  | onlyOwner |
| └ | _startAuction | Internal 🔒 | 🛑  | |
| └ | _bid | Internal 🔒 | 🛑  | |
| └ | _end | Internal 🔒 | 🛑  | |
| └ | withdraw | External ❗️ | 🛑  | nonReentrant |
| └ | onERC721Received | Public ❗️ | 🛑  |NO❗️ |


 Legend

|  Symbol  |  Meaning  |
|:--------:|-----------|
|    🛑    | Function can modify state |
|    💵    | Function is payable |

### signature hash

| Sighash   |   Function Signature | 
| ---- | ---- | 
| cd3daf9d  |  rewardPerToken() | 
| 008cc262  |  earned(address) | 
| a694fc3a  |  stake(uint256) | 
| 2e1a7d4d  |  withdraw(uint256) | 
| 3d18b912  |  getReward() | 
| 18160ddd  |  totalSupply() | 
| 70a08231  |  balanceOf(address) | 
| a9059cbb  |  transfer(address,uint256) | 
| dd62ed3e  |  allowance(address,address) | 
| 095ea7b3  |  approve(address,uint256) | 
| 23b872dd  |  transferFrom(address,address,uint256) | 
| 6352211e  |  ownerOf(uint256) | 
| b88d4fde  |  safeTransferFrom(address,address,uint256,bytes) | 
| 42842e0e  |  safeTransferFrom(address,address,uint256) | 
| a22cb465  |  setApprovalForAll(address,bool) | 
| 081812fc  |  getApproved(uint256) | 
| e985e9c5  |  isApprovedForAll(address,address) | 
| 01ffc9a7  |  supportsInterface(bytes4) | 
| 150b7a02  |  onERC721Received(address,address,uint256,bytes) | 
| 06fdde03  |  name() | 
| 95d89b41  |  symbol() | 
| c87b56dd  |  tokenURI(uint256) | 
| 4f6ccce7  |  tokenByIndex(uint256) | 
| 2f745c59  |  tokenOfOwnerByIndex(address,uint256) | 
