// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Click} from "../src/Click.sol";

contract DeployClickGame is Script {

    function setUp() public {}

    function run() external returns (Click) {
        vm.startBroadcast();
        Click game = new Click();
        vm.stopBroadcast();
        return game;
    }
}