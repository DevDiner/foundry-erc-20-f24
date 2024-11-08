//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployERC20Token} from "../script/DeployERC20Token.s.sol";
import {ERC20Token} from "../src/ERC20Token.sol";

contract ERC20TokenTest is Test{

    ERC20Token public token;
    DeployERC20Token public deployer;

    address bob = makeAddr("bob");
    address alice = makeAddr("alice");

    uint256 public constant STARTING_BALANCE = 100 ether; //"ether" here represents 10e18 wei

    function setUp() public{
        deployer = new DeployERC20Token();
        token = deployer.run();

        vm.prank(msg.sender);
        token.transfer(bob, STARTING_BALANCE);
    }

    function testBobBalance() public{
        assertEq(STARTING_BALANCE, token.balanceOf(bob));
    }

    function testAllowance() public {
        uint256 initialAllowance = 1000;

        //Bob approves Alice to spend tokens on her behalf
        vm.prank(bob);
        token.approve(alice, initialAllowance);

        uint256 transferAmount = 500;
        
        vm.prank(alice);
        token.transferFrom(bob, alice, transferAmount);

        //OR
        //token.transfer(alice, transferAmount);
        assertEq(token.balanceOf(bob), STARTING_BALANCE - transferAmount);
        assertEq(token.balanceOf(alice), transferAmount);
    }
}