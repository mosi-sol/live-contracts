## Escrow

- Exacutables:
- - deposit
- - finish
- - withdraw


- Readonly:
- - depositsOf

### how to:

`deploy` -> `deployer deposit` -> `crew finish job` -> `deployer sending money`

- **deploy** contract by recuriter/customer
- run **deposit** by sending a ***value & address*** of services(like a programmer)
- after finishing the job by services(programmer) runing **finish** function by him/her
- customer can to run **withdraw** function for releasing & send value

### todo:
in next version
- ``save value amount`` in a variable, delete/0 that after withdraw
- ``getter function`` for escrowID

### security
- change `internal` functions to `private`

---
<p align="right">
  <a href="https://github.com/mosi-sol" target="blank">
  <img src="https://img.shields.io/badge/Escrow-Contract-blue?style=flat" alt="cafe_pafe" /></a>  
</p>

---

### contract info

|  Contract  |         Type        |       Bases      |                  |                 |
|:----------:|:-------------------:|:----------------:|:----------------:|:---------------:|
|     └      |  **Function Name**  |  **Visibility**  |  **Mutability**  |  **Modifiers**  |
||||||
| **Recurit** | Implementation | Ownable |||
| └ | finish | Public ❗️ | 🛑  |NO❗️ |
| └ | depositsOf | Public ❗️ |   |NO❗️ |
| └ | deposit | External ❗️ |  💵 | onlyOwner |
| └ | withdraw | External ❗️ | 🛑  | onlyOwner |
| └ | _deposit | Internal 🔒 | 🛑  | onlyOwner |
| └ | _withdraw | Internal 🔒 | 🛑  | onlyOwner |
||||||
| **Cipher** | Implementation |  |||
| └ | compare | Internal 🔒 |   | |
| └ | morse_to_char | Internal 🔒 |   | |
| └ | char_to_morse | Internal 🔒 |   | |
| └ | hash | Internal 🔒 |   | |
| └ | dehash | Internal 🔒 |   | |
||||||
| **Test** | Implementation | Cipher |||
| └ | receiveMsg | Public ❗️ |   |NO❗️ |
| └ | sendMsg | Public ❗️ |   |NO❗️ |
||||||
| **TestWord** | Implementation | Cipher |||
| └ | concat | Internal 🔒 |   | |
| └ | morse | Public ❗️ |   |NO❗️ |
||||||
| **Cipher** | Implementation |  |||
| └ | compare | Internal 🔒 |   | |
| └ | char_to_morse_code | Internal 🔒 |   | |
||||||
| **Test** | Implementation | Cipher |||
| └ | morse | Public ❗️ |   |NO❗️ |
||||||
| **Cipher** | Implementation |  |||
| └ | <Constructor> | Public ❗️ | 🛑  |NO❗️ |
| └ | _design1 | Internal 🔒 | 🛑  | |
| └ | _design2 | Internal 🔒 | 🛑  | |
| └ | _T | Internal 🔒 |   | |
| └ | concat | Internal 🔒 |   | |
| └ | _generate | Internal 🔒 |   | |
| └ | _pattern_1 | Internal 🔒 | 🛑  | |
| └ | _pattern_2 | Internal 🔒 | 🛑  | |
||||||
| **TestWord** | Implementation | Cipher |||
| └ | unMerge | Public ❗️ |   |NO❗️ |
| └ | generate | Public ❗️ |   |NO❗️ |
| └ | table | Public ❗️ |   |NO❗️ |
| └ | pattern_1 | Public ❗️ | 🛑  |NO❗️ |
| └ | pattern_2 | Public ❗️ | 🛑  |NO❗️ |
||||||
| **Cipher** | Implementation |  |||
| └ | <Constructor> | Public ❗️ | 🛑  |NO❗️ |
| └ | _design | Private 🔐 | 🛑  | |
| └ | _T | Internal 🔒 |   | |
| └ | concat | Internal 🔒 |   | |
| └ | _generate | Internal 🔒 |   | |
||||||
| **TestWord** | Implementation | Cipher |||
| └ | generate | Public ❗️ |   |NO❗️ |
| └ | table | Public ❗️ |   |NO❗️ |
||||||
| **Cipher** | Implementation |  |||
| └ | compare | Internal 🔒 |   | |
| └ | _T | Internal 🔒 |   | |
| └ | T | Public ❗️ |   |NO❗️ |
| └ | isValid | Public ❗️ |   |NO❗️ |
||||||
| **NoFeeSwap2Pairs** | Implementation |  |||
| └ | <Constructor> | Public ❗️ | 🛑  |NO❗️ |
| └ | _lock | Private 🔐 | 🛑  | |
| └ | _release | Private 🔐 | 🛑  | |
| └ | _hold | Private 🔐 | 🛑  | |
| └ | createValuetion | External ❗️ | 🛑  |NO❗️ |
| └ | clearValuetion | External ❗️ | 🛑  |NO❗️ |
| └ | swap | External ❗️ | 🛑  | isValidToken |
| └ | _min | Private 🔐 |   | |
| └ | _sqrt | Private 🔐 |   | |
| └ | sqrt_ | Private 🔐 |   | |
| └ | _this | Internal 🔒 |   | |
| └ | _msgSender | Internal 🔒 |   | |
| └ | _msgData | Internal 🔒 |   | |
| └ | _msgValue | Internal 🔒 |   | |
||||||
| **IERC20** | Interface |  |||
| └ | totalSupply | External ❗️ |   |NO❗️ |
| └ | balanceOf | External ❗️ |   |NO❗️ |
| └ | transfer | External ❗️ | 🛑  |NO❗️ |
| └ | allowance | External ❗️ |   |NO❗️ |
| └ | approve | External ❗️ | 🛑  |NO❗️ |
| └ | transferFrom | External ❗️ | 🛑  |NO❗️ |
||||||
| **CrowdfundingFactory** | Implementation |  |||
| └ | create | Public ❗️ | 🛑  |NO❗️ |
| └ | conterbute | Public ❗️ |  💵 |NO❗️ |
| └ | refund | Public ❗️ | 🛑  |NO❗️ |
| └ | finalize | Public ❗️ | 🛑  |NO❗️ |
| └ | balanceOfCampagin | Public ❗️ |   |NO❗️ |
| └ | balance | Public ❗️ |   |NO❗️ |
| └ | version | Public ❗️ |   |NO❗️ |
||||||
| **Crowdfunding** | Implementation |  |||
| └ | _onlyAdmin | Private 🔐 |   | |
| └ | _onlyFundRaiser | Private 🔐 |   | |
| └ | _isNotEnded | Private 🔐 |   | |
| └ | _areValidToPay | Private 🔐 |   | |
| └ | <Constructor> | Public ❗️ | 🛑  |NO❗️ |
| └ | <Receive Ether> | External ❗️ |  💵 |NO❗️ |
| └ | <Fallback> | External ❗️ |  💵 |NO❗️ |
| └ | create | Public ❗️ | 🛑  | onlyAdmin |
| └ | conterbute | Public ❗️ |  💵 | isNotEnded |
| └ | refund | Public ❗️ | 🛑  | onlyFundRaiser isNotEnded noReentrant |
| └ | revoke | Public ❗️ | 🛑  | onlyAdmin |
| └ | finalize | Public ❗️ | 🛑  | onlyAdmin |
| └ | _isContract | Internal 🔒 |   | |
| └ | balance | Public ❗️ |   |NO❗️ |
| └ | balanceOf | Public ❗️ |   |NO❗️ |
| └ | balanceOfCampagin | Public ❗️ |   |NO❗️ |
| └ | changeNeedTimer | Public ❗️ |   | onlyAdmin |
| └ | theVersion | Public ❗️ |   |NO❗️ |
| └ | changeVersion | Public ❗️ | 🛑  | onlyAdmin |
||||||
| **IERC20** | Interface |  |||
| └ | totalSupply | External ❗️ |   |NO❗️ |
| └ | balanceOf | External ❗️ |   |NO❗️ |
| └ | allowance | External ❗️ |   |NO❗️ |
| └ | transfer | External ❗️ | 🛑  |NO❗️ |
| └ | approve | External ❗️ | 🛑  |NO❗️ |
| └ | transferFrom | External ❗️ | 🛑  |NO❗️ |


 Legend

|  Symbol  |  Meaning  |
|:--------:|-----------|
|    🛑    | Function can modify state |
|    💵    | Function is payable |

### signature hash

| Sighash   |   Function Signature | 
| ---- | ---- | 
| d353a1cb  |  finish(uint256) | 
| e3a9db1a  |  depositsOf(address) | 
| f340fa01  |  deposit(address) | 
| f3fef3a3  |  withdraw(address,uint256) | 
| 5415aaf2  |  _deposit(address) | 
| b790a77b  |  _withdraw(address,uint256) | 
