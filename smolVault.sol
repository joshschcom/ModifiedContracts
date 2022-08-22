//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./Vaulttoken.sol";          //An ERC20 Token which has the ownable and IERC20 import in it, notable functions are mint & burn, can be used with ./crc20.sol

contract smolVault is Ownable {      
    IERC20 public DepositToken;     //We define our two tokens interacting with the contract
    IERC20 public VaultToken;       

    mapping (address => uint) public depositAmount;                     //Every person who deposits an amount can be called with their address showing the amount deposited(uint)
    mapping (address => uint) public depositVTAmount;

    constructor(address _DepositToken, address _VaultToken) {           //Deploying the contract with both of the token addresses
        DepositToken = IERC20(_DepositToken);
        VaultToken = IERC20(_VaultToken);
    }

    function depositDepositToken(uint _amount) public payable {         //a deposit function, with a number as amuount(IERC) which is public and can be paid with(payable)
        DepositToken.transferFrom(msg.sender, address(this), _amount);  //"DepositToken is the Token transfered so that ETH wont be associated with this function
        depositDTAmount[msg.sender] += _amount;                         //when this function is called add the amount to the user at mapping
    }

    function depositVaultToken(uint _amount) public payable onlyOwner {
        VaultToken.transferFrom(msg.sender, address(this), _amount);
        depositVTAmount[msg.sender] += _amount;
    }
    
    function withdrawVaultToken(uint _amount) external {
        VaultToken.transfer(msg.sender, _amount);
    }
}
