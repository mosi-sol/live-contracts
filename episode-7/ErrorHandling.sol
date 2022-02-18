// SPDX-License-Identifier: MIT

pragma solidity 0.8;

// recert & require => live in life cycle

contract ErrorRevert {
    // revert check inline code
    function testError(uint _amount) external pure {
        if (_amount > 5) {
            revert("change amount less then 5");
        }
    }
}

contract ErrorRequire {
    // require check must happend code to proccess
    function testError(uint _amount) external pure {
        // if return error, next lines after require not work
        require(_amount < 5, "amount must be greater 5");
    }
}

// assert => never happend error
contract ErrorAssert {
    // check result should be like assert
    uint amount;
    function testError() external view {
        // codes
        assert(amount == 0); // output would equal the assert or make error
    }
}

contract ErrorCustom {
    // custom error type can generate outside of contract
    // can have/haven`t  var 
    error CustomerBalance(uint fee, uint balance);

    function CustomError(uint _fee) public view {
        uint _balance = msg.sender.balance;
        if (_balance < _fee) {
            revert CustomerBalance({
                fee: _fee, 
                balance: _balance
                });
        }
    }
}

// trow: 
// throw error type not work after solidity ver 0.5.4
