// SPDX-License-Identifier: MIT
pragma solidity 0.8;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol";

contract Recurit is Ownable {
    using Address for address payable;

    // variables
    mapping(address => uint256) private deposits;
    mapping(address => mapping(uint256 => bool)) private isReceive;
    address payable private customer;
    uint private ID = 0;
    
    // events
    event Deposited(address indexed payee, uint256 weiAmount, uint256 date);
    event Withdrawn(address indexed payee, uint256 weiAmount, uint256 date);

    // exacutions
    function finish(uint256 id) public returns (bool) {
        require(msg.sender == customer, "recurited user can do this");
        isReceive[msg.sender][id] = true;
        return true;
    }

    function depositsOf(address payee) public view returns (uint256) {
        return deposits[payee];
    }

    function deposit(address payee) external payable onlyOwner returns (bool success) {
        success = _deposit(payee);
        require(success);
    }

    function withdraw(address payable payee, uint256 id) external onlyOwner returns (bool success) {
        success = _withdraw(payee, id);
        require(success);
    }

    // wrapped security [using hooks active]
    function _deposit(address payee) internal virtual onlyOwner returns (bool) { // payable
        uint256 amount = msg.value;
        deposits[payee] += amount;
        customer = payable(payee); // ---
        uint256 id = ID;
        isReceive[payee][id] = false;
        emit Deposited(payee, amount, block.timestamp);
        return true;
    }

    function _withdraw(address payable payee, uint256 id) internal virtual onlyOwner returns (bool) { 
        require(isReceive[payee][id] == true, "not yet finished job");
        uint256 payment = deposits[payee];
        deposits[payee] = 0;
        payee.sendValue(payment);
        emit Withdrawn(payee, payment, block.timestamp);
        return true;
    }

}
