// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

/*
    A smart contract that automatically provisions a few kilowatts of electricity to every hosuehold everyday 
    to deal with load shedding and ensure everyone has reliable electricity.
*/

contract ElectroForge {
    constructor() {

    }

    struct Household {
        address householdWeb3Address;
        string houseAddress;
        string familyName;
        uint16 availableElectricity;
        uint8 familySize;
    }

    mapping (address  => Household) public household;

    uint256 public countryElectricitySupplyInKilowatts = 100000; // One hundred thousand

    function provision (address _householdAddress) public returns (uint16) {
        uint16 amount = 24; // Give 24 kw of electricity to the household

        household[_householdAddress].availableElectricity += amount;

        // Decrease the country's electricity supply
        countryElectricitySupplyInKilowatts -= amount;

        return household[_householdAddress].availableElectricity;
    }

    function spendElectricity(string memory _activityName, uint16 _expenditure) public returns (uint16) {
        // Check if the user has a registered household
        require(household[msg.sender].householdWeb3Address != address(0), "You don't seem to have a household in our system, try creating one");
    
        // Find the household
        Household storage _household = household[msg.sender];

        // Decrease the household's electricity
        uint16 _household.availableElectricity -= _expenditure;

        return _household.availableElectricity;
    }

    function getAvailableElectricity () public view returns (uint16) {
        // Check if the user has a registered household
        require(household[msg.sender].householdWeb3Address != address(0), "You don't seem to have a household in our system, try creating one");
    
        uint16 _availableElectricity = household[msg.sender].availableElectricity;

        return _availableElectricity;
    }
}