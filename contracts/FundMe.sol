// Get fund me from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./PriceConverter.sol";

contract FundMe  {
    using PriceConverter for uint256;

    uint256 public minimumUsd = 50 * 1e18; // 1 * 10 ** 18

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    function fund() public payable {

        require(msg.value.getConversionRate() >= minimumUsd, "Didn't send enough!"); // 1e18 == 1 * 10 ** 18 == 1000000000000000000
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
        
    }
        // function withdraw(){}
    
}