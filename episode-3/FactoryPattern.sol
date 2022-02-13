// SPDX-License-Identifier: MIT
// factory pattern

pragma solidity 0.8;

contract Factory {
	Child[] public childContract;
	event created(address _child, uint _date, uint _arg );
	event testBro(address _addr, uint _date);
	
    // pattern same file calling (internal contract)
	function newChild(uint _parameter) external {
		Child child = new Child(_parameter);
		childContract.push(child);
		emit created(address(child), block.timestamp, _parameter);
	}

    // pattern external contract calling
	function callBigBro(address _target) public {
		BigBrother(_target).hola(block.timestamp);
		emit testBro(_target, block.timestamp);
	}
}

// child
// should internal contract
contract Child {
	uint value;
	constructor(uint _val){
		value = _val;
	}
}


// like external contract
contract BigBrother {
	function hola(uint _date) external {
		// something here
	}
}


/**
   factory like a mother
   calling contract like a child
*/
