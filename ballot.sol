pragma solidity ^0.4.7;
pragma experimental ABIEncoderV2;
import "remix_tests.sol"; // this import is automatically injected by Remix.

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
   
   // when a vote has been cast, add it to the logs
   event voteCast(string name, string message);

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
        
        // setting variable equal to an index in an existing mapping
        Voter storage sender = voters[msg.sender];
        
        // validating that user input is within array of candidates
        require(candidate == 1 || candidate == 0, "Not a valid candidate.");
        
        sender.hasVoted = true;
        sender.vote = candidate;

        // vote
        candidates[candidate].votes += 1;
        
        emit voteCast(candidates[candidate].name, "Vote cast.");
    }
    
    // returns both names of candidates
    function showCandidates() public constant returns (string, string)
    {
        return (candidates[0].name, candidates[1].name);
    }

    function showVotes() public constant returns (Candidate[]) {
        return candidates;
    }

   // BEN
   // function to ensure someone doesn't vote twice

   // function to determine winner

   // CHRISTINA

   // ensuring users are confidential

}