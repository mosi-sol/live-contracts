// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8;
  
contract TransferOwner {
    address public Owner;

    constructor(){
      Owner = msg.sender;
    }

    function transferOwnership(address _newOwner) public {
      require(msg.sender == Owner);
      Owner = _newOwner;  
    }
}
