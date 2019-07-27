pragma solidity 0.5.10;

contract EigenaarSchap{
    address public eigenaar;
    modifier alleenContractEigenaar(){
       require(msg.sender == eigenaar); 
        _;
    }
    
  constructor() public{
  eigenaar = msg.sender;  
  }
  
  function overdachtEigenaar(address nieuweEigenaar) public alleenContractEigenaar {
     require(nieuweEigenaar != address(0));
     eigenaar = nieuweEigenaar;
    }
}
