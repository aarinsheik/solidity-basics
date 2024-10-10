// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
Topics cover :
    iniheritance
    factories - factories are contracts that are used to deploy other contracts.
    interaction
*/

contract Ownable{

    address owner;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner , "owners are only allowed to access secret !");
        _;
    }

}

contract SecretVault {

    string secret;

    constructor(string memory _secret){
        secret = _secret;
    }

    function getSecret() public view returns(string memory){
        return secret;
    }
}

contract MyContract  is Ownable{

    address secretVault;

    constructor(string memory _secret){
        SecretVault _secretVault = new SecretVault(_secret);
        secretVault = address(_secretVault);
        super;              // super keyword is used to call parent constructor
    } 

    function getSecret() onlyOwner public view returns(string memory){
        return SecretVault(secretVault).getSecret();
    }


}