// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
topics covered :

    Ether payments
    Modifiers
    visibility
    Events 
    Enums
*/

contract HotelRoom{
    
    // vacant or occupied
    enum Statuses { Vacant , Occupied }   // enum is data-structure in solidity that allows to keep constant option names in it
    Statuses public cur_status ;

    event Occupy(address _occupant ,  uint _amountPaid );    // events are a way to log information to the blockchain

    address payable public owner ;

    constructor(){
        owner = payable(msg.sender);
        cur_status = Statuses.Vacant;
    }

    modifier onlyWhenVacant {
        // check status before booking.
        require(cur_status == Statuses.Vacant , "Currently occupied.");              // syntax : require(condition, errorMessage);
        _;
    }

    modifier isSufficientCost(uint _amount) {
        // check price before booking.
        require(msg.value >= _amount , "Not enough Ether provided.");
        _;
    }

    function book() payable onlyWhenVacant isSufficientCost(2 ether) public{

        cur_status = Statuses.Occupied;
        // owner.transfer(msg.value);                    // instead .transfer() we can use .call

        //call: Allows sending Ether with a configurable gas limit and handles success or failure via a boolean return value.
        (bool sent, ) = owner.call{value: msg.value}("");
        require(sent, "Failed to send Ether");

        emit Occupy( msg.sender , msg.value );        // emit is a keyword used to trigger event and save the message
    }

}