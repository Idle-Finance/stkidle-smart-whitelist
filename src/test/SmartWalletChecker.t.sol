// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

import "./BaseTest.sol";
import "../SmartWalletChecker.sol";

contract SmartWalletCheckerTest is BaseTest {
  SmartWalletChecker public a;

  function setUp() public {
    a = new SmartWalletChecker();
  }

  function testToggleAddress() public {
    assertTrue(!a.check(address(1)));
    a.toggleAddress(address(1), true);
    assertTrue(a.check(address(1)));
    a.toggleAddress(address(1), false);
    assertTrue(!a.check(address(1)));
  }

  function testToggleAddressNonOwner() public {
    vm.prank(address(0));
    vm.expectRevert("Ownable: caller is not the owner");
    a.toggleAddress(address(1), true);
  }

  function testCheck() public {
    assertTrue(!a.check(address(1)));
    a.toggleAddress(address(1), true);
    assertTrue(a.check(address(1)));
  }

  function testCheckIsOpen() public {
    assertTrue(!a.check(address(1)));
    a.toggleIsOpen(true);
    assertTrue(a.check(address(1)));
    a.toggleAddress(address(1), true);
    a.toggleIsOpen(false);
    assertTrue(a.check(address(1)));
  }

  function testIsOpen() public {
    assertTrue(!a.isOpen());
    a.toggleIsOpen(true);
    assertTrue(a.isOpen());
    a.toggleIsOpen(false);
    assertTrue(!a.isOpen());
  }

  function testIsOpenNonOwner() public {
    vm.prank(address(0));
    vm.expectRevert("Ownable: caller is not the owner");
    a.toggleIsOpen(true);
  }
}