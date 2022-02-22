// SPDX-License-Identifier: MIT

pragma solidity 0.8;

contract ElectionSimulation {
    
    struct Candidate {
        uint id;
        uint voteCount;
        string name;
        address identity;
    }
    
    address public senat; // who run contract [admin]
    address private registered;
    mapping(address => bool) public voters;
    mapping(uint => Candidate) public candidates;
    uint public candidCount;
    uint public maxCondidates;

    constructor(uint _max) {
        senat = msg.sender;
        maxCondidates = _max;
    }

    modifier Validator() {
        require(msg.sender == senat,"only SENAT can action");
        _;
    }

    modifier electionBegin() {
        _;
    }

    modifier electionEnd() {
        _;
    }

    modifier electionreleaseVoteWinner() {
        _;
    }

    event votedEvent (uint indexed _candidateId);
    event newCandidate (string _name, address _identity);

    function Election (string memory _name, address _identity) public Validator {
        addCandidate(_name, _identity);
    }

    function addCandidate (string memory _name, address _identity) private Validator {
        require(candidCount < maxCondidates, "finish for register condidates");
        require(registered != _identity,"this candidate has been registred");
        require(_identity != senat, "dictatory?");
        candidCount += 1;
        candidates[candidCount] = Candidate(candidCount, 0, _name, _identity);
        registered = _identity;
        emit newCandidate(_name, _identity);
    }

    function vote (uint _candidateId) public {
        require(candidCount == maxCondidates, "wait for more condidate");
        require(!voters[msg.sender], "you are voted is ready");
        require(_candidateId > 0 && _candidateId <= candidCount, "not valid to vote"); // more trust
        voters[msg.sender] = true;
        candidates[_candidateId].voteCount += 1;
        emit votedEvent(_candidateId);
    }

    // a modifier for time (when release & finish count of votes)
    function newPresident() external Validator view returns (uint _voteCount) {

    }
}

// make a time cournometer for voting time
// make governance token, remove address voter & replace by governance
// important: find bug and graduate solidity >> level = mid-junior on smartcontract development
