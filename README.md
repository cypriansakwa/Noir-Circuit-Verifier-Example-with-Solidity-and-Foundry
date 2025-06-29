# Noir Circuit Verifier Example (with Solidity and Foundry)

### Introduction

An example repo to verify [Noir](https://noir-lang.org) circuits (using the `bb` backend) through a Solidity verifier smart contract.

This repo demonstrates a complete end-to-end pipeline for:
- Writing and testing a Noir circuit.
- Generating a proof using JavaScript.
- Verifying the proof on-chain using a Solidity verifier in a Foundry project.

---

### Directory Structure

```bash
.
├── circuits/          # Contains Noir circuits and tests
├── contract/          # Foundry project: Solidity verifier + test contract
├── js/                # JS utility to generate proofs and save them
```
### Requirements

- [Noir 1.0.0-beta.6](https://github.com/noir-lang/noir/releases)
- `bb` prover v0.84.0
- [Foundry](https://book.getfoundry.sh/) for Solidity testing
- [Node.js](https://nodejs.org/) and [Yarn](https://yarnpkg.com/) for the JavaScript tooling

### Installation / Setup
```ssh
# Foundry
git submodule update

# Build circuits, generate verifier contract
(cd circuits && ./build.sh)

# Install JS dependencies
(cd js && yarn)

```

### Proof generation in JS


```ssh
# Use bb.js to generate proof and save to a file
(cd js && yarn generate-proof)

# Run foundry test to read generated proof and verify
(cd contract && forge test --optimize --optimizer-runs 5000 --gas-report -vvv)

```

### Proof generation with bb cli

```ssh


# Generate witness
nargo execute

# Generate proof
bb prove -b ./target/secret_vote_tally.json -w target/secret_vote_tally.gz -o ./target --oracle_hash keccak

# Run foundry test to read generated proof and verify
cd ..
(cd contract && forge test --optimize --optimizer-runs 5000 --gas-report -vvv)
```
