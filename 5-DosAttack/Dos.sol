// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

contract Dos {
    mapping (address => uint256) public balances;

    function  deposit()  public payable {
        require(msg.value>0);
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount);
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
}