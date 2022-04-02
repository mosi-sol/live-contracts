// SPDX-License-Identifier: MIT
pragma solidity 0.8;

contract Proxy {
    uint256 public gold; // first var, following the feed & seedstatement position
    uint256 public silver; // second var, following the feed & seed statement position
    address public owner;
    address public feedContract; // target contract address

    constructor(address _feedContract) {
        feedContract = _feedContract;
        owner = msg.sender;
    }

    function upgrade(address _newContractAddress) external {
        require(msg.sender == owner, "Access restricted");
        feedContract = _newContractAddress;
    }

    fallback() external {
        (bool success, )= feedContract.delegatecall(msg.data);
        require(success, "Unexpected error");
    }

    function mint() public payable {
        (bool success, ) = feedContract.delegatecall(
            abi.encodeWithSignature("mint()")
        );
        require(success);
    }

    function burn() public payable {
        (bool success, ) = feedContract.delegatecall(
            abi.encodeWithSignature("burn()")
        );
        require(success);
    }
}


contract Feed {
    uint256 public gold; // first state

    function mint() external {
        gold += 1;
    }

    function burn() external {
        require(gold >= 1, "limit end");
        gold -= 1;
    }

}

contract Seed {
    uint256 public gold; // first state
    uint256 public silver; // second state
    

    function mint() external {
        gold += 1;
        silver += 5;
    }

    function burn() external {
        require(gold >= 1, "limit end");
        require(silver >= 5, "limit end");
        gold -= 1;
        silver -= 5;
    }

}
