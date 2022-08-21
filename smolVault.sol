//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./Vaulttoken.sol";          //An ERC20 Token which has the ownable and IERC20 import in it, notable functions are mint & burn

contract ownVault is Ownable {      
    IERC20 public DepositToken;     //We define our two tokens interacting with the contract
    IERC20 public VaultToken;       

    mapping (address => uint) public depositAmount; //Every person who deposits an amount can be called with their address showing the amount deposited(uint)
     

    constructor(address _DepositToken, address _VaultToken) {   //Deploying the contract with both of the token addresses
        DepositToken = IERC20(_DepositToken);
        VaultToken = IERC20(_VaultToken);
    }

    function deposit(uint _amount) public payable {             //a deposit function, with a number as amuount(IERC) which is public and can be paid with(payable)
        DepositToken.transferFrom(msg.sender, address(this), _amount);  //"DepositToken is the Token transfered so that ETH wont be associated with this function
        depositAmount[msg.sender] += _amount;                   //when this function is called add the amount to the user at mapping
    }
    
}
