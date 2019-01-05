pragma solidity 0.4.20;

contract Election {
    struct Candidates {
        uint id;
        string name;
        uint votesCount;
    }

    mapping(address => bool) public voters;
    mapping(uint => Candidates) public candidates;
    
    uint public candCount;

    event votedEvent (
        uint indexed _candidateId
    );

    function Election () public {
        addCandidate("Candidate-1");
        addCandidate("Candidate-2");
    }

    function addCandidate (string _name) private {
        candCount ++;
        candidates[candidatesCount] = Candidates(candidatesCount, _name, 0);
    }

    function vote (uint _candidateId) public {
        require(!voters[msg.sender]);

        require(_candidateId > 0 && _candidateId <= candidatesCount);

        voters[msg.sender] = true;

        candidates[_candidateId].voteCount ++;

        votedEvent(_candidateId);
    }
}
