pragma solidity ^0.8.17;

import "./Verifier.sol";

contract Starter {
    HonkVerifier public verifier;

    uint256 public verifiedCount;

     constructor(HonkVerifier _verifier) {
        verifier = _verifier;
    }

    function getVerifiedCount() public view returns (uint256) {
        return verifiedCount;
    }

    function verifyVoteThreshold(bytes calldata proof, bytes32[] calldata publicInputs) public returns (bool) {
        require(publicInputs.length == 2, "Expected 1 public input: threshold");

        bool proofResult = verifier.verify(proof, publicInputs);
        require(proofResult, "Proof is not valid");

        verifiedCount++;
        return proofResult;
    }
}
