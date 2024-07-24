// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import { P } from "../src/P.sol";
import { IDeployer } from "../src/interfaces/IDeployer.sol";
import { PProxy } from "../src/proxy/PProxy.sol";
import "forge-std/Script.sol";

interface IUpgradeableProxy {

    function upgradeToAndCall(address, bytes memory) external payable;

}

contract DeployScript is Script {

    address private constant ADMIN_ADDRESS = 0xd08b81F5e00F0e7a9506051422A055031052C7E0;
    address payable private constant PROXY_ADDRESS = payable(0xA3a0A690dabCDE2042b64382E3fC51fEB7B20928);

    function run() external {
        vm.startBroadcast(ADMIN_ADDRESS);

        P pImpl = new P();
        console.log("pImpl deployed to:", address(pImpl));

        IUpgradeableProxy(PROXY_ADDRESS).upgradeToAndCall(address(pImpl), "");
        console.log("pProxy upgraded at:", PROXY_ADDRESS);

        vm.stopBroadcast();
    }

}
