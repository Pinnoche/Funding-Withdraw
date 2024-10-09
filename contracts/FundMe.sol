//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

// import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
import { PriceConverter } from './PriceConverter.sol';

contract FundMe {
    using  PriceConverter for uint256;

    uint256 public minUsd = 5e18;

    address[] public funders;

    mapping (address funder => uint256 amountFunded) public addressToAmountFunded;

    address public owner;

    constructor() {
        owner = msg.sender;
    }
    function fund() public payable  {
        require(msg.value.getConvertionRate() >= minUsd, "Eth not enough");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
            
        }
    
    function withdraw() public OnlyOwner {
        
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        //reset the Array
        funders = new address[](0);
        //tranfer
        // payable (msg.sender).transfer(address(this).balance);

        // send
        // bool sendSuccess = payable (msg.sender).send(address(this).balance);
        // require(sendSuccess, 'Send Failed');

        // call 
        (bool callStatus, ) = payable (msg.sender).call{value: address(this).balance}("");
        require(callStatus, "call failed");
    }

    modifier OnlyOwner() {
        require(msg.sender == owner, "Sender Must Be Owner");
        _;
    }
}