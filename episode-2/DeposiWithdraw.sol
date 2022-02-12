// SPDX-License-Identifier: MIT

pragma solidity 0.8.0;

contract EtherWallet {
    // variable feeds
    address payable public owner;
    mapping(address => uint) private userBalances;
    bool internal locked;

    // constructor
    constructor(address payable _owner) {
        owner = _owner;
    }

    // modifiers
    modifier noReentrant() {
		require(!locked, "no re entrancy");
		locked = true;
		_;
		locked = false;
	}

    modifier onlyOwner() {
        require(owner == msg.sender, "need to be owner");
        _;
    }

    // events
    event Deposit(address indexed Depositor, uint amount);
    event Sent(uint amount);
    event Receive(address indexed Depositor, uint amount);
    event Fallback(address indexed Depositor, uint amount);

    // ---------- start app ---------- \\

    // deposit fund
    function deposit() payable public {
        emit Deposit(msg.sender, msg.value);
    }

    // symbolic old fund transfering
    function send(address payable to, uint amount) public {
        if(msg.sender == owner) {
            to.transfer(amount);
            emit Sent(amount);
            return;
        } 
        revert("sender is not allowed");
    }

    // safe & secure transfer method
    function withdraw() public noReentrant onlyOwner {
		uint amountToWithdraw = userBalances[msg.sender];
		userBalances[msg.sender] = 0;
		(bool success, ) = msg.sender.call{value: amountToWithdraw}("");
		require(success);
	}

    // watch how many fund deposited
    function balanceOf() view public returns(uint) {
        return address(this).balance;
    }

    // deposit OPCODE methods
    receive() external payable {
        emit Receive(msg.sender, msg.value);
    }

    fallback() external payable {
        emit Fallback(msg.sender, msg.value);
    }
}
