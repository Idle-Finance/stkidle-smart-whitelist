// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

import "./BaseTest.sol";
import "../Contract.sol";

contract ContractTest is BaseTest {
  Contract public a;

  function setUp() public {
    a = new Contract();
  }

  function testExample() public {
    assertEq(a.balanceOf(address(this)), 0);
    a.mint(address(this), 1e18);
    assertGt(a.balanceOf(address(this)), 0);
  }
}
