pragma solidity ^0.4.21;

import "../node_modules/zeppelin-solidity/contracts/lifecycle/Pausable.sol";
import "../node_modules/zeppelin-solidity/contracts/token/ERC827/ERC827Token.sol";


contract TraxionToken is ERC827Token, Pausable {
  
    string public constant name = "Traxion Token";
    string public constant symbol = "TXN";
    uint8 public constant decimals = 18;
    uint256 public constant INITIAL_SUPPLY = 5e8 * 10**uint256(decimals);

    function TraxionToken()  public {
        totalSupply_ = INITIAL_SUPPLY;
        balances[this] = INITIAL_SUPPLY;
        emit Transfer(0x0, this, INITIAL_SUPPLY);
    }
    /** @dev approveData, transferData and transferDataFrom will be used by the TraxionWallet system which spawns a dynamic "Traxion Contract" in ethereum blockchain
             which will be used to communicate with the hyperledger fabric API. Traxion Token will be used in our system  wherein the ABI will be written for its specific transaction.
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
