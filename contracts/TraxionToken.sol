pragma solidity ^0.4.21;

import "../node_modules/zeppelin-solidity/contracts/token/ERC20/PausableToken.sol";
import "../node_modules/zeppelin-solidity/contracts/token/ERC827/ERC827Token.sol";


contract TraxionToken is ERC827Token, Pausable {
  
    string public constant name = "Traxion Token";
    string public constant symbol = "TXN";
    uint8 public constant decimals = 18;
    uint256 public constant INITIAL_SUPPLY = 5e8 * 10**uint256(decimals);

    constructor()  public {
        totalSupply_ = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
        emit Transfer(0x0, msg.sender, INITIAL_SUPPLY);
    }
    /** @dev erc827 extension will be used by the TraxionWallet system which spawns a dynamic "Traxion Contract" in ethereum blockchain
             through Hyperledger Fabric SDK. This bridge the communication with the hyperledger fabric API from ethereum network and vice versa. 
             Traxion Token will be used in our system  wherein the ABI will be written for its specific transaction through out Traxion Wallet App.
    **/
    function approve(address spender, uint256 value, bytes data) public whenNotPaused returns (bool) {
        return super.approve(spender, value, data);
    }

    function transfer(address to, uint256 value, bytes data) public whenNotPaused returns (bool) {
        return super.transfer(to, value, data);
    }

    function transferFrom(address from, address to, uint256 value, bytes data) public whenNotPaused returns (bool) {
        return super.transferFrom(from, to, value, data);
    }
}
