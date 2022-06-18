## Proxy Pattern

### Example:
- deploy `Seed` and `Feed` contract's
- deploy `Proxy` contract and put the address of 1 of those contract's
- run `mint`  and `burn` function's for make new experiance

### info:
- proxy use target contract's, but not change those variables
- proxy `state variable's` would in the same order & roles by target state variable's

### fallback()
the beauty of `Low level interactions` in proxy pattern is: 
- not defined exacution's can call
- defined exacution's too

#

**proxy have many vulebalities** so learn & understand ***how to work delegatecall***

an example for LOWLEVEL call, delegate like this in writing but different answer in final.

```js
tokenAddress.call(abi.encodeWithSignature("transfer(address,uint256)", 0x__Address__, 17))
```
#

**how to get** `SELECTOR` : [ like: `"transfer(address,uint256)"` ]
- no need for many smartcontracts, but good to know.
- usecase in ERC165
```js
function getSelector(string calldata _func) external pure returns (bytes4) {
    return bytes4(keccak256(bytes(_func)));
}
```
