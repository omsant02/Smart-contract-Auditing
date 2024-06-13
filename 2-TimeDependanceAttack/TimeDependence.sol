// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

contract TimeDependence {
    address winner;
    function winnerCheck(uint value) external {
        if (value == block.timestamp%2){    //instead use block.number
            winner=msg.sender;
        }
    }
}