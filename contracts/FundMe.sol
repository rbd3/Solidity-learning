// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

import {PriceConverter} from "./PriceConverter.sol";


contract FundMe {

    using PriceConverter for uint256;
    //uint256 public minimumUsd = 5;
    uint256 public minimumUsd = 5e18;
    address[] public founders;
    mapping (address founder => uint256 amountFounded) public adressToAmountFounded;

    function fund() public payable {
        //require(msg.value > 1e18, "Didn't send ennough ether");
        require(msg.value.getConversionRate() >= minimumUsd, "Didn't send ennough ether");
        //ETH/USD adress from https://docs.chain.link/data-feeds/price-feeds/addresses
        //0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
        founders.push(msg.sender);
        adressToAmountFounded[msg.sender] = adressToAmountFounded[msg.sender] + msg.value;
    }

    function withdraw() public {

    }

}