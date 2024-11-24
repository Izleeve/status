// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0; 
 
contract Status { 
    mapping(address => string) public statuses; 
 
    event StatusUpdate(address indexed user, string newStatus); 
 
    modifier validStatus(string memory newStatus) { 
        require(bytes(newStatus).length > 0, "Status cannot be empty"); 
        require(bytes(newStatus).length <=100, "Status is too long"); 
        _; 
    } 
 
    function setStatus(string memory newStatus) public validStatus(newStatus) { 
        statuses[msg.sender] = newStatus; 
        emit StatusUpdate(msg.sender, newStatus); 
    } 
 
    function getStatus(address user) public view returns (string memory) { 
        require(bytes(statuses[user]).length > 0, "No status set for this user"); 
        require(msg.sender == user, "Not authorized to view this status"); 
        return statuses[user]; 
    } 
} 
