//SPDX-License-Identifier:Unlicense

pragma solidity ^0.8.0;

contract Whitelist {
    //max number of whitelisted address allowed
    uint8 public maxWhitelistedAddresses;

    mapping(address => bool) public whitelistedAddress;

   //keep track of already whitelisted address
    uint8 public numAddressWhitelisted;

    //set the value for the max number of whitelisted address at the point of deployment of the contract
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        //check through the whitelistedAddress array for the user address.
        require(!whitelistedAddress[msg.sender], "Sender has already been Whitelisted");
        //number of already whitelisted Address must be less than mmax
        require(numAddressWhitelisted < maxWhitelistedAddresses, "More address cant be added, limit reached");

        whitelistedAddress[msg.sender] = true;

        numAddressWhitelisted += 1;
    }
}

