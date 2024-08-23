// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity ^0.8.26;

import "forge-std/Script.sol";

contract MaxCodeSizeTester is Script {
    function run(uint256 codeSize) public {
        console.log("Testing size:", codeSize);

        address addr = deployContract(codeSize);

        if (addr != address(0)) {
            require(
                addr.code.length == codeSize,
                "Test failed. Please report at https://github.com/ZeroEkkusu/max-code-size-tester/issues/new."
            );
            console.log("Deployment address:", addr);
        } else {
            console.log("Deployment failed for size:", codeSize);
        }
    }

    function deployContract(uint256 codeSize) internal returns (address addr) {
        bytes memory runtimeCode = new bytes(codeSize);
        for (uint256 i = 0; i < codeSize; i++) {
            runtimeCode[i] = 0x00;
        }

        bytes memory creationCode =
            abi.encodePacked(hex"61", bytes2(uint16(runtimeCode.length)), hex"80600b3d393df3", runtimeCode);

        vm.startBroadcast();
        /// @solidity memory-safe-assembly
        assembly {
            addr := create(0, add(creationCode, 0x20), mload(creationCode))
        }
        vm.stopBroadcast();

        return addr;
    }
}
