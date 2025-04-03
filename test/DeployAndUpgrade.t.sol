// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {BoxV1} from "src/BoxV1.sol";
import {BoxV2} from "src/BoxV2.sol";
import {DeployBox} from "script/DeployBox.s.sol";
import {UpgradeBox} from "script/UpgradeBox.s.sol";

contract DeployAndUpgrade is Test {
    DeployBox deployer;
    UpgradeBox upgrader;
    address OWNER = makeAddr("owner");

    address proxy;

    function setUp() public {
        deployer = new DeployBox();
        upgrader = new UpgradeBox();
        proxy = deployer.run(); // right now, points to BoxV1
    }

    function testProxyStartAtV1() public {
        uint256 expectedVersion = 1;
        assertEq(BoxV1(proxy).version(), expectedVersion);

        vm.expectRevert();
        BoxV2(proxy).setNumber(7);
    }

    function testUpgrades() public {
        BoxV2 box2 = new BoxV2();
        upgrader.upgradeBox(proxy, address(box2)); // right now, points to BoxV2

        uint256 expectedVersion = 2;
        assertEq(BoxV2(proxy).version(), expectedVersion);

        BoxV2(proxy).setNumber(7);
        assertEq(BoxV2(proxy).getNumber(), 7);
    }
}