## Secure Anonymous Withdraw
at this lesson we seen how to withdraw safe & secure by using a PASSWORD.
- only anonymous account if have the password can withdraw
- the password is a hash from a string.

## usecase:
- safe transfer
- need more security
- untrackable transaction`s in blockchain

### example:
- string password is: ***mosi-sol***
- hash password generated is: ***0xfb39401d483e3b8ed34e9d5cb7b345ab***

```
function gen(string memory pas) external pure returns (bytes16 _pasGen) {
    _pasGen = bytes16(keccak256(abi.encodePacked(pas)));
}
 ```

---
<p align="right">
  <a href="https://github.com/mosi-sol" target="blank">
  <img src="https://img.shields.io/badge/Secure%20anonymous-Withdraw-blue?style=flat" alt="cafe_pafe" /></a>  
</p>
