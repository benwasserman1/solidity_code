pragma solidity ^0.4.7;
pragma experimental ABIEncoderV2;
import "remix_tests.sol"; // this import is automatically injected by Remix.
import "./ballot.sol";

contract Ballot {

   struct Voter
   {
       uint vote;
       bool hasVoted;
       bytes32 name;
   }

   struct Candidate
   {
       string name;
       uint votes;
   }

   // setting an address value for each voter
   // similar to a dictionary term where each address maps to a Voter
   mapping(address => Voter) public voters;

   Candidate[2] public candidates;

   Candidate candidate1 = Candidate("Bob Smith", 0);
   Candidate candidate2 = Candidate("John George", 0);

   function getCandidates() public constant returns (Candidate[2]){
      Candidate[2] memory candidates = [candidate1, candidate2];
      return candidates;
    }

    function vote(uint candidate) public {
        Voter storage sender = voters[msg.sender];
        sender.hasVoted = true;
        sender.vote = candidate;

        Candidate[2] memory candidates = getCandidates();

        // vote
        candidates[candidate].votes += 1;

    }

    function determineWinner() public constant returns (Candidate[2]) {
        Candidate[2] memory candidates = getCandidates();
        return candidates;
    }

   // constructor to set all candidate votes to 0

   // function for vote

   // function to ensure someone doesn't vote twice

   // function to determine winner

}
