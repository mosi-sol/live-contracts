// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract DefiWithdraw is Ownable, ReentrancyGuard {

    mapping(address => uint256) private balances;
    mapping(address => uint256) private nonces;
    bool internal locked;

    modifier noReentrant() {
        _nonReentrant();
        _;
    }

    event Deposit(address indexed account, uint256 amount);
    event Withdrawal(address indexed account, uint256 amount);

    receive() external payable {}

    function deposit() external payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint256 amount, string memory password, uint256 nonce) external noReentrant {
        require(amount > 0, "Withdrawal amount must be greater than 0");
        require(balances[msg.sender] >= amount, "Insufficient balance");
        require(keccak256(abi.encodePacked(password, nonce)) == getHashedPassword(msg.sender), "Access denied");
        require(nonce > nonces[msg.sender], "Invalid nonce");
        
        nonces[msg.sender] = nonce;

        balances[msg.sender] -= amount;
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Transfer failed");

        emit Withdrawal(msg.sender, amount);
    }

    function getBalance(address account) external view returns (uint256) {
        return balances[account];
    }

    function getHashedPassword(address account) internal view returns (bytes32) {
        return keccak256(abi.encodePacked(account, owner(), nonces[account]));
    }
}
