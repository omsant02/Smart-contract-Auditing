// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

contract FloatingPoint {
   uint constant public tokensPerEth = 10;  //1eth = 100
   uint constant public weiPerEth = 1e18;
   mapping(address => uint) public balances;
   function buyTokens()  public payable {
        uint tokens = (msg.value/weiPerEth)*tokensPerEth;  // 0.123 rounds to 0
        balances[msg.sender] += tokens;                    // 1.123 rounds to 1
   }

   function sellTokens(uint tokens) public{
        require(balances[msg.sender] >= tokens);
        uint eth = tokens/tokensPerEth;
        balances[msg.sender] -= tokens;
        payable(msg.sender).transfer(eth*weiPerEth);
   }
}