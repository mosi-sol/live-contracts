// SPDX-License-Identifier: MIT
pragma solidity 0.8;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract SafeTransferingSystem {

    function _safeTransferFrom(
        IERC20 token,
        address sender,
        address recipient,
        uint amount) private returns (bool) {
        bool sent = token.transferFrom(sender, recipient, amount);
        require(sent, "Token transfer failed");
        return sent;
    }

    function transfering(
        IERC20 token,
        address sender,
        address recipient,
        uint amount) external returns (bool rec) {
            rec = _safeTransferFrom(token, sender, recipient, amount); // if transfer is success, return true
        }

}

// ------------------------------------ \\
// approve SafeTransferingSystem address for spending MyToken
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    constructor() ERC20("MyToken", "MTK") {
        _mint(msg.sender, 100 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
