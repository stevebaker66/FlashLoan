pragma solidity 0.6.12;

import { FlashLoanReceiverBase } from "./FlashLoanReceiverBase.sol";
import { ILendingPool } from "./ILendingPool.sol";
import { ILendingPoolAddressesProvider } from "./ILendingPoolAddressesProvider.sol";
import { IERC20 } from "./IERC20.sol";

/**
    !!!
    Never keep funds permanently on your FlashLoanReceiverBase contract as they could be
    exposed to a 'griefing' attack, where the stored funds are used by an attacker.
    !!!
*/
contract MyV2FlashLoan is FlashLoanReceiverBase {

/**
        This function is called after your contract has received the flash loaned amount
     */
    function executeOperation(
            address[] calldata assets,
            uint256[] calldata amounts,
            uint256[] calldata premiums,
            address initiator,
            bytes calldata params
      )
            external
            override 
            returns (bool)
     {

            // 
            // This contract now has the funds requested
            // Your logic goes here
            //

            // At the end of your logic above, this contract owes
            // the flashloaned amounts + premiums.
            // Therefore ensure your contract has enough to repay
            // these amounts.

            // Approve the LendingPool contract allowance to *pull* the owed amount
            for (uint i = 0; i < assets.length; i++) {
                  uint amountOwing = amounts[i].add(premiums[i]);
                  IERC20(assets[i]).approve(address(LENDING_POOL), amountOwing);
            {

           Return true;
    }
}
