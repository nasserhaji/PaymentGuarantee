// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

/**
 * @title PaymentGuarantee
 * @dev A smart contract that facilitates two-party transactions with payment guarantees.
 */
contract PaymentGuarantee {
    address public seller;
    address payable public payer;
    uint256 public amount;
    bool public paymentMade;
    
    /**
     * @dev Constructor function that sets the seller's address, payer's address, and payment amount.
     * @param _seller The address of the product seller.
     * @param _payer The address of the payer.
     * @param _amount The payment amount.
     */
    constructor(address _seller, address payable _payer, uint256 _amount) {
        seller = _seller;
        payer = _payer;
        amount = _amount;
    }
    
    /**
     * @dev Function that allows the payer to send payment to the contract and confirm the payment.
     */
    function makePayment() external payable {
        require(msg.sender == payer, "Only payer can make payment");
        require(msg.value == amount, "Payment amount must match the agreed upon amount");
        paymentMade = true;
        payable(seller).transfer(amount);
    }
    
    /**
     * @dev Function that allows the seller to cancel the transaction and return the payment to the payer.
     */
    function cancelTransaction() external {
        require(msg.sender == seller, "Only seller can cancel transaction");
        require(!paymentMade, "Payment has already been made");
        selfdestruct(payer);
    }
    
    /**
     * @dev Function that allows the seller to withdraw the payment once it has been confirmed.
     */
    function withdraw() external {
        require(msg.sender == seller, "Only seller can withdraw funds");
        require(paymentMade, "Payment has not been made");
        payable(seller).transfer(address(this).balance);
    }
}
