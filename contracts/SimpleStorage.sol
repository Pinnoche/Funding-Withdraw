//SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;    //this is the solidity version

// contract SimpleStorage {
//     // Basic Types: boolean, uint, int, address, bytes, string
//     bool hasFavNum = true; //Boolean example
//     uint256 favNum = 77; //only positive integers
//     int256 favInt = -77; //all kinds of numbers
//     address myAddress = 0xEb3D10Cbf9820b2210D8dd544Be2D84f552342e4;
//     bytes32 favByte = "Pinnoche"; //highest byte is 32
//     string favString = "Pinnoche"; //string are converted into bytes
// }

contract SimpleStorage {
    uint256 num;

    function store(uint256 _num) public {
        num = _num;
    }

    function retrieve() public view returns(uint256) {
        return num;
    }
    //custom Type
    struct Person {
        uint256 newNum;
        string name;
    }

    //Dynamic array
    Person[] public listOfPeople;

    //mapping
    mapping(string => uint256) public nameToNewNum;


    function newPerson(string memory _name, uint256 _newNum) public {
        listOfPeople.push(Person(_newNum, _name));
        nameToNewNum[_name] = _newNum;
    }

}



// pragma solidity ^0.8.18;

// import { SimpleStorage } from './SimpleStorage.sol';

// contract AddFiveStorage is SimpleStorage {
//     // SimpleStorage[] public getSimpleStorageContracts;
// }
