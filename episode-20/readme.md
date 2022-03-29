***PRIVACY*** IN PUBLIC BLOCKCHAIN.

- did you know about the HASH in Blockchain?
- did you like to untrackable transaction in public blockchains?
- did you like safe & secure transaction?

---

## Secure Anonymous Withdraw
at this lesson we seen how to withdraw safe & secure by using a PASSWORD.
- only anonymous account if have the password can withdraw
- the password is a hash from a string.

## usecase:
- safe transfer
- need more security
- untrackable transaction`s in blockchain
- pay to the targeted person/dapp

### example:
- string password is: ***mosi-sol***
- hash password generated is: ***0xfb39401d483e3b8ed34e9d5cb7b345ab***

```
function gen(string memory pas) external pure returns (bytes16 _pasGen) {
    _pasGen = bytes16(keccak256(abi.encodePacked(pas)));
}
 ```
### disclaimer:
- the code of repo for teaching on my [youtube](https://youtube.com/pafecafe) , so if use it at your own risk.

---
<p align="right">
  <a href="https://github.com/mosi-sol" target="blank">
  <img src="https://img.shields.io/badge/Secure%20anonymous-Withdraw-blue?style=flat" alt="cafe_pafe" /></a>  
</p>
