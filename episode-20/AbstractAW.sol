// SPDX-License-Identifier: MIT
pragma solidity 0.8;

// AbstractAW.sol ==> abstract anonymous withdraw 
// version 1

abstract contract AWithdrawPassword{
    
    bytes16 immutable hashedPass = 0xfb39401d483e3b8ed34e9d5cb7b345ab;
    bool internal locked;

	modifier noReentrant() {
		require(!locked, "no re entrancy");
		locked = true;
		_;
		locked = false;
	}

    event Deposit();

    receive() external payable {}

    event Deposit();

    function deposit() payable external virtual;

    function withdraw(string memory password) external virtual;

    function gen(string memory pas) external virtual pure returns (bytes16 _pasGen);
}
