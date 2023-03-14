// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/PWNft.sol";

interface HEVM {
    function warp(uint256 time) external;

    function roll(uint256) external;

    function prank(address) external;

    function prank(address, address) external;

    function startPrank(address) external;

    function startPrank(address, address) external;

    function stopPrank() external;

    function deal(address, uint256) external;

    function expectRevert(bytes calldata) external;

    function expectRevert() external;
}

contract CounterTest is Test {
    PWNft public pwNft;

    // Cheatcodes
    HEVM public hevm = HEVM(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D);

    // Users
    address public owner;
    address public user1 = address(1);
    address public user2 = address(0x1338);

    function setUp() public {
        pwNft = new PWNft();

        // deal some ether
        hevm.deal(user1, 1 ether);
    }

    function testPW() public {
        string memory name = pwNft.name();
        console.log(name);

        string
            memory baseUrl = "ipfs://bafybeibewadqajwgmka7357h7k7v2fw4jgekmv5di3vryr6lyfanzv3ioq/";
        pwNft.setBaseURI(baseUrl);

        hevm.prank(user1);
        pwNft.mint{value: 0.04 ether}(4);

        string memory retrievedURI = pwNft.tokenURI(1);
        console.log(retrievedURI);
    }
}
