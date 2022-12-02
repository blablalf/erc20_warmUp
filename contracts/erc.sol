// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./Evaluator.sol";


contract MyToken is ERC20, Ownable, IExerciceSolution {

    mapping(address => bool) internal whitelist;
    bool private whitelistActivated;

    constructor(string memory ticker, uint supply) ERC20("blabla_erc20", ticker) {
        _mint(msg.sender, supply);
    }

    ///////////////
    // Whitelist //
    ///////////////

    function enableWhitelist() public onlyOwner {
        whitelistActivated = true;
    }
    
    function addToWhitelist(address addressToAdd) public onlyOwner {
        whitelist[addressToAdd] = true;
    }

    function removeFromWhitelist(address addressToRemove) public onlyOwner {
        whitelist[addressToRemove] = false;
    }

    function symbol() public view override(IExerciceSolution, ERC20) returns (string memory) {}
    
    function getToken() external returns (bool){
        // Checking only teacher get free tokens
        require(msg.sender == 0x7C5629d850eCD1E640b1572bC0d4ac5210b38FA5, "Only Teacher Evaluator contract can call this endpoint");
        // Checking only whitelisted can use this function if whitelist is enabled
        if (whitelistActivated) require(isCustomerWhiteListed(msg.sender), "Not whitelisted");
        _mint(msg.sender, 10**decimals());
        return true;
    }

    function buyToken() external payable returns (bool) {
        // Checking only whitelisted can use this function if whitelist is enabled
        if (whitelistActivated) require(isCustomerWhiteListed(msg.sender), "Not whitelisted");
        // price will be set at 0.0001 eth
        _mint(msg.sender, msg.value*1000);
        return true;
    }

    function isCustomerWhiteListed(address customerAddress) public view returns (bool) {
        return whitelist[customerAddress];
    }

  function customerTierLevel(address customerAddress) external returns (uint256){ return 0;}
  

}

