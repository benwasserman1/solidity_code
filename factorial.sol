pragma solidity ^0.4.0;

contract HelloWorld {

 function Factorial(uint256 n) public constant returns (uint256) {
    if (n >= 1)
        return n * Factorial(n-1);
    else
        return 1;
 }

 function Result() public constant returns (uint256) {
     return Factorial(6);
 }
}
