// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

error NotOwner();

struct Clicker {
    address adr;
    uint clickAmount;
}

contract Click {
    address[] private clickerAddresses;
    mapping(address => uint) private clickCountOfClickers;
    address immutable owner;

    modifier OnlyOwner() {
        if (msg.sender != owner) revert NotOwner();
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function showHitterDamage(address adr) public view returns (uint) {
        return clickCountOfClickers[adr];
    }

    function hit() public {
        if (clickCountOfClickers[msg.sender] == 0) {
            clickerAddresses.push(msg.sender);
        }
        clickCountOfClickers[msg.sender] += 1;
    }

    function getTotalDamage() public view returns (uint) {
        address[] memory temp = clickerAddresses;
        uint total = 0;
        for (uint i = 0; i < temp.length; i++) {
            total += clickCountOfClickers[temp[i]];
        }
        return total;
    }

    function getAllHitters() public view returns (Clicker[] memory) {
        address[] memory temp = clickerAddresses;
        Clicker[] memory clickers = new Clicker[](temp.length);
        for (uint i = 0; i < temp.length; i++) {
            clickers[i] = Clicker(temp[i], clickCountOfClickers[temp[i]]);
        }
        return clickers;
    }


}
