// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8;

library Strings {
	function length(string calldata str) internal pure returns(uint) {
		return bytes(str).length;
	}

	function concat(string calldata _first, string calldata _second) internal pure returns (string memory) {
		return string(abi.encodePacked(_first, _second));
	}

	function compare(string calldata _first, string calldata _second) internal pure returns (bool) {
		bytes32 value1 = keccak256(abi.encodePacked(_first));
		bytes32 value2 = keccak256(abi.encodePacked(_second));
		return value1 == value2;
	}

	function reverse(string calldata _string) internal pure returns (string memory) {
		bytes memory source = bytes(_string);
		string memory temp = new string(source.length);
		bytes memory _reverse = bytes(temp);
		for(uint i = 0; i < source.length; i++) {
			_reverse[source.length - i - 1] = source[i];
		}
		return string(_reverse);
	}
}
