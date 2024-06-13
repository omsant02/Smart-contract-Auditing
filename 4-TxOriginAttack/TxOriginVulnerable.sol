// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

contract Vulnerable{
    address public owner;

    constructor (address _owner){
        owner= _owner;
    }

    function sendEther() public payable{

    }

    function withdrawAll(address payable _recipient) public {
        require(tx.origin == owner);  //can only called by EOA  ----    owner will deployer   
        _recipient.transfer(address(this).balance);       //--- vulnerable as if anyhow owner clicks on any link
    }                                                     // owner -->  smart contract attacker --> withdraw
}