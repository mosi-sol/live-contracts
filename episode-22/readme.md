## HashMessage 

generate hash for message sender & content messeage

`string data` + `address` -> `encode` = `return bytes`

#

```
   function _hashGen(string calldata to) internal view returns (bytes16 x) {
        x = bytes16(keccak256(abi.encodePacked(to, msg.sender)));
    } 
    
   function _hashContent(string calldata txt) internal view returns (bytes32 x) {
        x = bytes32(keccak256(abi.encodePacked(txt, msg.sender)));
    } 
```

- test account for deploy: `0x5B38Da6a701c568545dCfcB03FcB875f56beddC4`
- to: `mosipvp@gmail.com`     
- txt: `hello world! hashed text.`  
- to output: `0x8a784ae3d8bc929c6a0c0521b9db9d7c`
- txt output: `0xc3c1fa1e1c7ef80b7d094faaf5e3fb262090d75372b9f5cdc76312816c65d317`

---

### [Factory] would be on the same file by [HashMessage]
```
    HashMessage hashMessage = new HashMessage();

    function GenerateMessage(
        string calldata to, string calldata txt) 
        external view returns (bytes16 _to, bytes32 _txt) {
            _to = hashMessage.hashTo(to);
            _txt = hashMessage.hashTxt(txt);
        }
}
```

- bytes16: _to output: `0x5af9544b08252dfef4d34de0bd21b430`
- bytes32: _txt output: `0x512ab90c0e81d9ec26293b5ba38ba02c7eddd67f522774`

---

### [FactoryMessage] can be on the other file, because need the address of [HashMessage]
```
    function GenerateMessage(
        address _generator, string calldata to, string calldata txt) 
        external view returns (bytes16 _to, bytes32 _txt) {
            _to = HashMessage(_generator).hashTo(to);
            _txt = HashMessage(_generator).hashTxt(txt);
        }
}
 ```
 
- bytes16: _to output: `0x8609abc2267abcb82891ea696f3055e0`
- bytes32: _txt output: `0x69e45cf47d11f2b5c85145cbd36cc52f6930019d5b7654cc1879c88b933e2c01`


