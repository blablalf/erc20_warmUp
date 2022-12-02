// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./Evaluator.sol";


contract MyToken is ERC20, Ownable, IExerciceSolution {

    constructor(string memory ticker, uint supply) ERC20("blabla_erc20", ticker) {
        _mint(msg.sender, supply);
    }


  function symbol() public view override(IExerciceSolution, ERC20) returns (string memory) {}
    
  function getToken() external returns (bool){return false;}

  function buyToken() external payable returns (bool){ return false;}

  function isCustomerWhiteListed(address customerAddress) external returns (bool){ return false;}

  function customerTierLevel(address customerAddress) external returns (uint256){ return 0;}

}

