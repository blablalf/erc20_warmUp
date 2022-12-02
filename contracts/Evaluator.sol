pragma solidity ^0.8.9;
pragma experimental ABIEncoderV2;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IExerciceSolution is IERC20 {

  function symbol() external view returns (string memory);
    
  function getToken() external returns (bool);

  function buyToken() external payable returns (bool);

  function isCustomerWhiteListed(address customerAddress) external returns (bool);

  function customerTierLevel(address customerAddress) external returns (uint256);
}

contract Evaluator 
{

	mapping(address => bool) public teachers;
 	uint public nextValueStoreRank;

 	mapping(address => string) public assignedTicker;
 	mapping(address => uint256) public assignedSupply;
 	mapping(address => mapping(uint256 => bool)) public exerciceProgression;
 	mapping(address => IExerciceSolution) public studentErc20;
 	mapping(address => uint256) public ex8Tier1AmountBought;
 	mapping(address => bool) public hasBeenPaired;

 	event newRandomTickerAndSupply(string ticker, uint256 supply);
 	event constructedCorrectly(address erc20Address);
	constructor() 
	public 
	{
		

	}

	fallback () external payable 
	{}

	receive () external payable 
	{}


	function ex1_getTickerAndSupply()
	public
	{
		
	}

	function ex2_testErc20TickerAndSupply()
	public
	{
		

	}

	function ex3_testGetToken()
	public
	{
		
	}

	function ex4_testBuyToken()
	public
	{

	}

	function ex5_testDenyListing()
	public
	{
		
	}

	function ex6_testAllowListing()
	public
	{
		
	}

	function ex7_testDenyListing()
	public
	{
		
	}

	function ex8_testTier1Listing()
	public
	{
		
	}

	function ex9_testTier2Listing()
	public
	{
		
	}

	function ex10_allInOne() 
	public  
	{
		
	}


	/* Internal functions and modifiers */ 


	modifier onlyTeachers() 
	{
	    _;
	}

	function submitExercice(IExerciceSolution studentExercice)
	public
	{
	}

	function _compareStrings(string memory a, string memory b) 
	internal 
	pure 
	returns (bool) 
	{
    	return false;
	}

	function bytes32ToString(bytes32 _bytes32) 
	public 
	pure returns (string memory) 
	{
        return "";
    }

	function _testBuyToken()
	internal
	returns(uint256 firstBuyAmount)
	{
		return 0;
	}

	function readTicker(address studentAddres)
	public
	view
	returns(string memory)
	{
		return "";
	}

	function readSupply(address studentAddres)
	public
	view
	returns(uint256)
	{
		return 0;
	}

	function setRandomTickersAndSupply(uint256[20] memory _randomSupplies, string[20] memory _randomTickers) 
	public 
	onlyTeachers
	{
	}




}