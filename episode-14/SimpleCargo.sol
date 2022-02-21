// SPDX-License-Identifier: MIT

pragma solidity 0.8;

contract Cargo {
	mapping(uint => Thing) public things; // id -> things

	struct Thing {
		string name;
		string position;
	}

	uint index = 1;

	function addThings(string memory _name, string memory _pos) public {
		things[index] = Thing(_name, _pos);
		index++;
	}

	function updateThing(uint _id, string memory _name, string memory _pos) public {
		things[_id] = Thing(_name, _pos);
	}

	function soldThing(uint _index) public {
		delete things[_index];
	}

}
