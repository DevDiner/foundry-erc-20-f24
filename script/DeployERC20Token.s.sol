//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {ERC20Token} from "../src/ERC20Token.sol";

contract DeployERC20Token is Script {

    uint256 public constant INITIAL_SUPPLY= 1000 ether; //"ether" here represents 10e18 wei

    function run () external returns (ERC20Token){
        vm.startBroadcast();
        ERC20Token token = new ERC20Token(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return token;
    }

}