// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter{
    // code here ...

    //state variable :
    uint count; 
    // 'uint' is an unsigned integer (by default 256 bits), meaning it can hold only non-negative numbers (0 and above).

    uint8 myuint8 = 7;
    // 'uint8' is an unsigned 8-bit integer, meaning it can hold values between 0 and 255.

    string name = "MyCounter";
    // 'string' is a dynamic array of characters, used to store textual data.

    bytes32 public mybytes32 = "hello world !";
    // 'bytes32' is a fixed-size byte array of 32 bytes (256 bits). It stores arbitrary binary data in a more space-efficient way than 'string'.

    address public myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    // 'address' is a 20-byte Ethereum address, used to represent the address of accounts or contracts in the Ethereum blockchain.

    struct student{
        uint usn ;
        string name ;
        string college ; 
    }
    student public s1 = student(1,"aarin","BMSCE");
    // custom datatype using structure

    // visibility of constructor is public by default. No need to mention it.
    constructor() {
        count=0;
    }

    // access specifiers : public , private , internal and external.

    function getCount() public view returns(uint) {
        return count;
    }

    function incrementCount() public {
        count = count+1;
        // or count++;
    }

    function get10() public pure returns(uint) {
         /*
        the pure keyword is used to indicate that a function does not read or modify the state of the contract. Specifically, a pure function:

        -> Does not modify any state variables (i.e., it doesn't write to the blockchain).
        -> Does not read any state variables (i.e., it doesn't access the current state of the blockchain).
        */
        uint val = 10; //local variable
        return val;
    }

}