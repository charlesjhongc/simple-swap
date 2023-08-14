// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { Test } from "forge-std/Test.sol";
import { SimpleSwap } from "contracts/SimpleSwap.sol";

contract MockERC20 is ERC20 {
    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) {}

    function mint(address to, uint256 value) public {
        _mint(to, value);
    }

    function burn(address from, uint256 value) public {
        _burn(from, value);
    }
}

contract SimpleSwapTest is Test {
    MockERC20 simpleUSD = new MockERC20("Simple USD", "simUSD");
    MockERC20 userToken = new MockERC20("My Token", "MTN");
    address bank = makeAddr("bank");
    uint256 userPrivateKey = uint256(1);
    address user = vm.addr(userPrivateKey);
    SimpleSwap simpleSwap;

    function setUp() public {
        // deploy SimpleSwap
        simpleSwap = new SimpleSwap(bank, address(simpleUSD));

        // ERC20 mint
        simpleUSD.mint(bank, 10000 * 10e18);
        userToken.mint(user, 10000 * 10e18);

        // approve
        vm.prank(bank);
        simpleUSD.approve(address(simpleSwap), type(uint256).max);
        vm.prank(user);
        userToken.approve(address(simpleSwap), type(uint256).max);
    }

    function testSwap() public {
        vm.prank(user);
        simpleSwap.swap(address(userToken), 1 * 10e18);
    }

    function testSwapWithSignature() public {
        bytes memory userSignature;
        // TODO generate userSignature
        simpleSwap.swap(userSignature, address(userToken), 1 * 10e18);
    }
}
