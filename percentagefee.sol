import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Tax {
  using SafeMath for uint256;

 function setPercentageFee(uint256 fee) external onlyOwner {
    percentage = fee;
  }

  function transferFrom(address from, address to, uint256 amount) public virtual override returns (bool) { 
    uint256 percentageFee = (amount.mul(percentage)).div(10000);
    address spender = _msgSender();
    _spendAllowance(from, spender, amount);
    uint256 total = amount.sub(percentageFee);
    transfer(address(this), percentageFee);
    transfer(to ,total);
    return true;
  }
