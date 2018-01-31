pragma solidity ^0.4.18;

import "../node_modules/zeppelin-solidity/contracts/lifecycle/Pausable.sol";
import "../node_modules/zeppelin-solidity/contracts/token/ERC827/ERC827Token.sol";


contract TraxionToken is ERC827Token, Pausable {
  
  //Inspired by LIF ERC827 Tokens
    string public constant name = "Traxion Token ERC827 Test 2";
    string public constant symbol = "TRXT";
    uint8 public constant decimals = 18;
    uint256 public constant INITIAL_SUPPLY = 5e8 * 10**uint256(decimals);

    function TraxionToken()  public {
        totalSupply_ = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
        Transfer(0x0, msg.sender, INITIAL_SUPPLY);
    }

    function approveData(address spender, uint256 value, bytes data) public whenNotPaused returns (bool) {
        return super.approve(spender, value, data);
    }

    function transferData(address to, uint256 value, bytes data) public whenNotPaused returns (bool) {
        return super.transfer(to, value, data);
    }

    function transferDataFrom(address from, address to, uint256 value, bytes data) public whenNotPaused returns (bool) {
        return super.transferFrom(from, to, value, data);
    }
  
    function transfer(address _to, uint256 _value) public whenNotPaused returns (bool) {
        return super.transfer(_to, _value);
    }

    function transferFrom(address _from, address _to, uint256 _value) public whenNotPaused returns (bool) {
        return super.transferFrom(_from, _to, _value);
    }

    function approve(address _spender, uint256 _value) public whenNotPaused returns (bool) {
        return super.approve(_spender, _value);
    }
}