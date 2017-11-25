pragma solidity ^0.4.2;

import "./owned.sol";

contract SYDEToken is owned {
    /* This creates an array with all balances */
    mapping (address => uint256) public tokens;

    uint256 public num_tokens = 200; //set default number of tokens to 200

    /* Initializes contract with initial supply tokens to the creator of the contract */
    function MyToken(uint256 initialSupply) {
        num_tokens = initialSupply;   
        tokens[msg.sender] = num_tokens;            // Give the creator all initial tokens
    }

    /* Send tokens */
    function transfer(address _to, uint256 _value) {
        require(tokens[msg.sender] >= _value);           // Check if the sender has enough
        require(tokens[_to] + _value >= tokens[_to]); // Check for overflows
        tokens[msg.sender] -= _value;                    // Subtract from the sender
        tokens[_to] += _value;                           // Add the same to the recipient
    }

    function setSupply(uint256 _supply) onlyOwner returns (uint256) {
        num_tokens = _supply;                 // function to allow admin to set the 
        return num_tokens;                    // inital supply of tokens
    }
}
   