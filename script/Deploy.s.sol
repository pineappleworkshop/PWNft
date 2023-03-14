// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

import "../src/PWNft.sol";

contract Deploy is Script {
    // Deployments
    PWNft public pwNft;

    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY_TESTNET_DEPLOYER");

        //Deploy Contracts
        vm.startBroadcast(deployerPrivateKey);

        pwNft = new PWNft();

        vm.stopBroadcast();
    }
}
