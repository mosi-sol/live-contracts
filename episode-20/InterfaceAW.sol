// SPDX-License-Identifier: MIT
pragma solidity 0.8;

// InterfaceAW.sol ==> interface anonymous withdraw 
// version 1

interface IWithdrawPassword{

    event Deposit();

    function deposit() payable external;

    function withdraw(string memory password) external;

    function gen(string memory pas) external pure returns (bytes16 _pasGen);
}
