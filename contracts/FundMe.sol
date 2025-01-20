// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";


contract FundMe {

    //uint256 public minimumUsd = 5;
    uint256 public minimumUsd = 5e18;
    address[] public founders;
    mapping (address founder => uint256 amountFounded) public adressToAmountFounded;

    function fund() public payable {
        //require(msg.value > 1e18, "Didn't send ennough ether");
        require(getConversionRate(msg.value) >= minimumUsd, "Didn't send ennough ether");
        //ETH/USD adress from https://docs.chain.link/data-feeds/price-feeds/addresses
        //0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
        founders.push(msg.sender);
        adressToAmountFounded[msg.sender] = adressToAmountFounded[msg.sender] + msg.value;
    }

    function withdraw() public {

    }

    function getPrice() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419);
        (, int256 price,,,) = priceFeed.latestRoundData();

        return uint256(price * 1e10);
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount)/1e18;

        return ethAmountInUsd;
    }
}