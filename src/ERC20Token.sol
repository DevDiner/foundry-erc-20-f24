//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {ERC20} from '@openzeppelin/contracts/token/ERC20/ERC20.sol';
 
contract ERC20Token is ERC20{

    constructor(uint256 initialSupply) ERC20 ("token", "TOKEN"){
        _mint(msg.sender, initialSupply);
    }

}