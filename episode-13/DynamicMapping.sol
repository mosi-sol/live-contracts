// SPDX-License-Identifier: MIT

/// @notice: base code from solidity language documents
pragma solidity 0.8;

contract DynamicMap {
    mapping (uint => uint)[] public array;

    function allocate(uint _newMaps) public {
        for (uint i = 0; i < _newMaps; i++)
            array.push();
    }

    function writeMap(uint _map, uint _key, uint _value) public {
        array[_map][_key] = _value;
    }

    function readMap(uint _map, uint _key) public view returns (uint) {
        return array[_map][_key];
    }

    function eraseMaps() public {
        delete array;
    }
}

