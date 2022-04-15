import ethers from 'ethers'
import { wallet, deployContract } from './helpers.js'

import Artifact from '../out/SmartWalletChecker.sol/SmartWalletChecker.json'

const main = async () => {
    const Factory = new ethers.ContractFactory(
        Artifact.abi, Artifact.bytecode.object, wallet
    )

    await deployContract({
        name: 'SmartWalletChecker',
        deployer: wallet,
        factory: Factory,
        args: [],
        opts: {
            gasLimit: 1000000
        }
    })
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });