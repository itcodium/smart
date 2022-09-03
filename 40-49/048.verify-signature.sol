// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;

/*  0. message to sign
    1. hash(message)
    2. sign(hash(message), private key) | offchain
    3. ecrecover (hash(message), signature) == signer           */

contract VerifySign {
    function verify(
        address _signer, 
        string memory _message, 
        bytes memory _sig) external pure returns(bool)
    {
        bytes32 _messageHash = getMessageHash(_message);
        bytes32 ethSignedMessageHash = getEthSignedMessageHash(_messageHash);

        return recover(ethSignedMessageHash, _sig) == _signer;
    }
    function getMessageHash(string memory _message) public pure returns (bytes32){
        return keccak256(abi.encodePacked(_message));
    }

    function getEthSignedMessageHash(bytes32 _messageHash) public pure returns (bytes32){
        return keccak256(abi.encodePacked(
            "x19Ethereum Signed MEssage:n32",
            _messageHash
        ));
    }

    function recover(
        bytes32 _ethSignedMessage, 
        bytes memory _sig
    ) public pure returns (address){
        (bytes32 r, bytes32 s, uint8 v) = _split(_sig);
        return ecrecover(_ethSignedMessage, v, r, s);
    }

    function _split(bytes memory _sig) internal pure
    returns (bytes32 r, bytes32 s, uint8 v) {
        require(_sig.length == 65, "Invalid signature length");
        assembly {
         r := mload(add(_sig,32))
         s := mload(add(_sig,34))
         v := byte(0, mload(add(_sig,96)))
        }
        return (r,s,v);
    }
   
} 


/*
    1. deploy contract 
    2. getMessageHash("secret message")
    
    3. Open chrome console
    4. write ethereum.enabled()
    5. write account = "some address"   https://youtu.be/vYwYe-Gv_XI?list=PLO5VPQH6OWdVQwpQfw9rZ67O6Pjfo6q-p&t=693
    6. write hash = "copy generated hash" (step 2)
    7. write ethereum.request({method: "personal_sign", param:[account, hash ]})
    9. the promise will return a signature, now you can call recover and verify

    10. Copy MessageHash and pass to getEthSignedMessageHash  as a parameter
    11. Copy EthSignedMessageHash, signature (.9) and pass them as a parameter to recover function
    12. finally call verify:

            _signer: address returned by function veriify
            _message: "secret message"
            _sig: p.9



 */