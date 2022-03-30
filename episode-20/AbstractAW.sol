// SPDX-License-Identifier: MIT
pragma solidity 0.8;

abstract contract AWithdrawPassword{

    event Deposit();

    function deposit() payable external virtual;

    function withdraw(string memory password) external virtual;

    function gen(string memory pas) external virtual pure returns (bytes16 _pasGen);
}
