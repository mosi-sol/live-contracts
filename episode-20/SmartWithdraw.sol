// SPDX-License-Identifier: MIT
pragma solidity 0.8;
contract WithdrawPassword{

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

    function deposit() payable external {
        emit Deposit();
    }

    function withdraw(string memory password) public noReentrant {
        require(gen(password) == hashedPass, "Access denied!");
        (bool success, ) = msg.sender.call{value: address(this).balance}("");
        require(success);
    }

    function gen(string memory pas) internal pure returns (bytes16 _pasGen) {
        _pasGen = bytes16(keccak256(abi.encodePacked(pas)));
    }
    // example: 0xfb39401d483e3b8ed34e9d5cb7b345ab  <-  mosi-sol
}
