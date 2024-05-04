// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Click} from "../src/Click.sol";
import {StdCheats} from "forge-std/StdCheats.sol";
import {Clicker} from "../src/Click.sol";

contract CounterTest is Test {
    Click public click;
    uint256 public constant SEND_VALUE = 0.1 ether; // just a value to make sure we are sending enough!
    uint256 public constant STARTING_USER_BALANCE = 10 ether;
    uint256 public constant GAS_PRICE = 1;
    address public constant USER = address(1);
    address public constant USER2 = address(2);
    address public constant USER3 = address(3);

    function setUp() public {
        click = new Click();
        vm.deal(USER, STARTING_USER_BALANCE);
    }

    function testHitAmount() public {
        vm.startPrank(USER);
        click.hit();
        vm.stopPrank();
    }

    function testSort() public {
        vm.startPrank(USER);
        click.hit();
        vm.stopPrank();
        Clicker[] memory clickers = click.getAllHitters();
        console.log("");
    }
}
