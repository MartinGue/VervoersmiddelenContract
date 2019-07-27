pragma solidity 0.5.10;

import "./eigenaarSchap.sol";

contract vervoersmiddelencontract is EigenaarSchap{

    enum VervoersType {FIETS, ATV, EBIKE}

    struct Vervoer {
        string merk;
        string kleur;
        uint maat;
        VervoersType vervoersType;
    }

    address contractEigenaar;

    mapping(address => Vervoer[]) ownerVanVervoer;

   
    constructor() public{
        contractEigenaar = msg.sender;
    }

    function voegVervoerToe(string memory _merk,string memory _kleur, uint _maat, VervoersType _vervoersType) internal returns (uint){
        return ownerVanVervoer[msg.sender].push(Vervoer(_merk,_kleur, _maat, _vervoersType)) - 1;
    }

    function vindVervoer(uint _id) public view returns (string memory) {
        return ownerVanVervoer[msg.sender][_id].merk;
    }
}
