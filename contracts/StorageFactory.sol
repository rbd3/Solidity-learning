// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;
import {SimpleStorage} from "./SimpleStorage.sol"; 

contract StorageFactory{

    //SimpleStorage public simpleStorage;
    SimpleStorage[] public listeOfSimpleStorageContract;

    function createSimpleStorageContract() public {
        //simpleStorage = new SimpleStorage();
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listeOfSimpleStorageContract.push(newSimpleStorageContract);
        
    }

    function sfStore(uint256 _simpleSorageIndex, uint256 _simpleStorageNumber) public {
        SimpleStorage mySimpleStorage = listeOfSimpleStorageContract[_simpleSorageIndex];
        mySimpleStorage.store(_simpleStorageNumber);
    }

    function sget(uint256 _simpleStorageIndex) public view returns (uint256) {
        SimpleStorage mySimpleStorage = listeOfSimpleStorageContract[_simpleStorageIndex];
        return mySimpleStorage.retrieve();
    }
}