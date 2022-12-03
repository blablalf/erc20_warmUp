pragma solidity ^0.8.9;
import "./Evaluator.sol";
import "./IAllInOneSolution.sol";
import "./erc.sol";

contract MyContract is IAllInOneSolution {
    Evaluator evaluator;

    constructor() {
        // Init
        evaluator = Evaluator(payable(0x7C5629d850eCD1E640b1572bC0d4ac5210b38FA5));
    }

    function allIn() public {
        evaluator.ex10_allInOne();
    }

    function completeWorkshop() external {
        // Ex1
        evaluator.ex1_getTickerAndSupply();

        // Ex2
        uint supply = evaluator.assignedSupply(address(this));
        string memory ticker = evaluator.assignedTicker(address(this));
        MyToken my_erc = new MyToken(ticker, supply);
        evaluator.submitExercice(my_erc);

        // Ex3
		evaluator.ex3_testGetToken();

        // Ex4
		evaluator.ex4_testBuyToken();

        // Ex5
        my_erc.toggleWhitelist();
		evaluator.ex5_testDenyListing();

        // Ex6
        my_erc.addToWhitelist(address(evaluator));
        evaluator.ex6_testAllowListing();

        // Ex7
        my_erc.removeFromWhitelist(address(evaluator));
        evaluator.ex7_testDenyListing();

        // Ex8
        my_erc.toggleWhitelistTiers();
        my_erc.addToWhitelist(address(evaluator));
        my_erc.setWhitelistTier(address(evaluator), 1);
        evaluator.ex8_testTier1Listing();

        // Ex9
        my_erc.setWhitelistTier(address(evaluator), 2);
        evaluator.ex9_testTier2Listing();
    }
}
