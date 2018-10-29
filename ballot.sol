pragma solidity ^0.4.7;
import "remix_tests.sol"; // this import is automatically injected by Remix.
import "./ballot.sol";

contract Ballot {
  
   struct Voter
   {
       uint vote;
       boolean hasVoted;
       bytes32 name;
   }
   
   struct VotingOptions
   {
       uint candidate1;
       uint candidate2;
       uint candidate3;
       uint candidate4;
   }
   
   // setting an address value for each voter
   // similar to a dictionary term where each address maps to a Voter
   mapping(address => Voter) voters;
   
   // votesFor [] 
    
}
