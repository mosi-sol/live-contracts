// SPDX-License-Identifier: MIT 

pragma solidity 0.8.0;

// not secure method
contract unsecureMethod {
	mapping(address => uint) private userBalances;

	function withdraw() public {
		uint amountToWithdraw = userBalances[msg.sender];
		(bool success, ) = msg.sender.call.value(amountToWithdraw)("");
		require(success);
		userBalances[msg.sender] = 0;
	}
}

// pure secure method
contract secureMethod {
	mapping(address => uint) private userBalances;

	function withdraw() public {
		uint amountToWithdraw = userBalances[msg.sender];
		userBalances[msg.sender] = 0;
		(bool success, ) = msg.sender.call.value(amountToWithdraw)("");
		require(success);
	}
}

// safe secure method
contract safeSecureMethod {
	mapping(address => uint) private userBalances;
	bool internal locked;

	modifier noReentrant() {
		require(!locked, "no re entrancy");
		locked = true;
		_;
		locked = false;
	}

	function withdraw() public noReentrant {
		uint amountToWithdraw = userBalances[msg.sender];
		userBalances[msg.sender] = 0;
		(bool success, ) = msg.sender.call.value(amountToWithdraw)("");
		require(success);
	}

}
