// SPDX-License-Identifier: MIT

pragma solidity 0.8;

// micro dbank system
contract TREASURY {
    mapping (address => uint256) private _keep;
    bool internal locked;

    modifier noReentrant() {
		require(!locked, "no re entrancy");
		locked = true;
		_;
		locked = false;
	}

    event Deposit (address indexed _customer, uint256 _amount);
    event Withdraw (address indexed _customer, uint256 _amount);

    function balanceOf (address _terminal) public view returns (uint256 safebox) {
        safebox = _keep[_terminal];
    }

    // receive () external payable {}
    // fallback () external payable {}
    function _income() internal {
        _keep[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }
    function deposit() external payable {
        _income();
    }

    // check for BUG, won the honor  :)
    function withdraw(uint256 _amount) public payable noReentrant {
        require(balanceOf(msg.sender) >= _amount);
        _keep[msg.sender] -= _amount;
        uint256 credit = _amount; // _keep[msg.sender]
        _amount = 0;
        (bool success, ) = payable(msg.sender).call{value: credit}("");
        require (success);
        emit Withdraw(msg.sender, credit);
    }
}
