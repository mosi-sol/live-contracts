zero knowledge proof (ZKproof)
#
***PRIVACY*** IN PUBLIC BLOCKCHAIN.

- did you know about the HASH in Blockchain?
- did you like to untrackable transaction in public blockchains?
- did you like safe & secure transaction?

read the article about this 0n [hackernoon](https://hackernoon.com/preview/k9fK6cWEjCwfa5Vc5cmO)

---

## Secure Anonymous Withdraw
at this lesson we seen how to withdraw safe & secure by using a PASSWORD.
- only anonymous account if have the password can withdraw
- the password is a hash from a string.
- ! 1 user withdraw all fund in this example.

`deposit` -> `depositor set a password` -> `delivered pass, withdraw`
<!-- https://drive.google.com/file/d/1E8J1NOWJWsXaQOEFvgRtHGk-p4z4ZeaV/view -->
<!-- https://drive.google.com/file/d/1E8J1NOWJWsXaQOEFvgRtHGk-p4z4ZeaV/view?usp=sharing -->
<!-- <a href="https://drive.google.com/file/d/1E8J1NOWJWsXaQOEFvgRtHGk-p4z4ZeaV/view" target="blank">
    <img src="https://drive.google.com/file/d/1E8J1NOWJWsXaQOEFvgRtHGk-p4z4ZeaV/view" alt="zero knowledge proof" />
</a> -->
<!-- [[https://drive.google.com/file/d/1E8J1NOWJWsXaQOEFvgRtHGk-p4z4ZeaV/view|alt=octocat]] -->

## usecase:
- safe transfer
- need more security
- untrackable transaction`s in blockchain
- pay to the targeted person/dapp

## ver 0.1 files
- simple contract
- interface
- abstract

#

### example:
- string password is: ***mosi-sol***
- hash password generated is: ***0xfb39401d483e3b8ed34e9d5cb7b345ab***

```solidity
function gen(string memory pas) external pure returns (bytes16 _pasGen) {
    _pasGen = bytes16(keccak256(abi.encodePacked(pas)));
}
 ```
 
 ### Todo:
 - the hashed lonely **password** is not safe, need the safe role like => pass+msg.sender <- this is make unique password.
 - build a hackaton for find bugs & best features
 
### disclaimer:
- the code of repo for teaching on my [youtube](https://youtube.com/pafecafe) , so if use it at your own risk.

---
<p align="right">
  <a href="https://github.com/mosi-sol" target="blank">
  <img src="https://img.shields.io/badge/Secure%20anonymous-Withdraw-blue?style=flat" alt="cafe_pafe" /></a>  
</p>
