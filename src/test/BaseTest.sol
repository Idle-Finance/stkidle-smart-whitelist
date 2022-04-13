// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

import {stdCheats} from "forge-std/stdlib.sol";
import {Vm} from "forge-std/Vm.sol";
import "ds-test/test.sol";

contract BaseTest is DSTest, stdCheats {
  /// @dev Use forge-std Vm logic
  Vm public constant vm = Vm(HEVM_ADDRESS);
}
