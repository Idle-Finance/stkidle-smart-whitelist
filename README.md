# Idle Foundry Template

Based on https://github.com/libevm/forge-example

with some minor modifications/additions to the solidity side such as `BaseTest.sol`

## Overview

- Uses [forge](https://github.com/gakonst/foundry) to compile, test, and debug.
- Uses a custom JS script to deploy, see [deploy.js](https://github.com/libevm/forge-example/blob/main/scripts/deploy.js).

## Development

Building and testing
```bash
forge build
forge test

# forking from existing state
# -vvv = very very verbose
# forge test -f http://127.0.0.1:8545 -vvv

# To access the debugger
# forge run --debug src/test/Contract.t.sol --sig "testExample()"
```

## Contract Deployment

Copy `.env.example` to `.env` and fill it out with correct details.

```bash
node --experimental-json-modules scripts/deploy.js
```

## Etherscan Verification

Check here https://github.com/libevm/forge-example#etherscan-verification