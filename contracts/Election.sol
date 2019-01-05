pragma solidity ^0.4.24;

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

    constructor() public {
        addCandidate("Candidate-1");
        addCandidate("Candidate-2");
    }

    function addCandidate (string _name) private {
        candCount ++;
        candidates[candCount] = Candidates(candCount, _name, 0);
    }

    function vote (uint _candidateId) public {
        require(!voters[msg.sender]);

        require(_candidateId > 0 && _candidateId <= candCount);

        voters[msg.sender] = true;

        candidates[_candidateId].votesCount ++;

        emit votedEvent(_candidateId);
    }
}
