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

   Candidate[] public candidates;

   constructor() public {
        // For each of the provided proposal names,
        // create a new proposal object and add it
        // to the end of the array.
        // `Proposal({...})` creates a temporary
        // Proposal object and `proposals.push(...)`
        // appends it to the end of `proposals`.
        candidates.push(Candidate({
            name: "Bob Smith",
            votes: 0
        }));
        candidates.push(Candidate({
            name: "John George",
            votes: 0
        }));

    }

    function vote(uint candidate) public {
        Voter storage sender = voters[msg.sender];
        sender.hasVoted = true;
        sender.vote = candidate;

        // vote
        candidates[candidate].votes += 1;
    }

    function showVotes() public constant returns (Candidate[]) {
        return candidates;
    }

   // BEN
   // function to ensure someone doesn't vote twice

   // function to determine winner

   // CHRISTINA
   // make sure candidate being voted for is in array

   // add event for every time someone has voted

   // ensuring users are confidential

}
