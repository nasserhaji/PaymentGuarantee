# PaymentGuarantee Smart Contract

The PaymentGuarantee Smart Contract is a Solidity contract that facilitates two-party transactions with payment guarantees. It ensures that payments are made securely and that sellers are guaranteed to receive their payments. 

## Getting Started

To use this smart contract, you will need to deploy it on the Ethereum network using a compatible Ethereum wallet such as Metamask. Once the contract is deployed, the payer can call the `makePayment()` function to send the payment to the contract, and the seller can call the `withdraw()` function to withdraw the payment once it has been confirmed. The seller can also call the `cancelTransaction()` function to cancel the transaction and return the payment to the payer if payment has not yet been made.

## Functions

This contract has the following functions:

- `constructor(address _seller, address payable _payer, uint256 _amount)`: Constructor function that sets the seller's address, payer's address, and payment amount.
- `function makePayment() external payable`: Function that allows the payer to send payment to the contract and confirm the payment.
- `function cancelTransaction() external`: Function that allows the seller to cancel the transaction and return the payment to the payer if payment has not yet been made.
- `function withdraw() external`: Function that allows the seller to withdraw the payment once it has been confirmed.

## Usage

1. Deploy the contract on the Ethereum network using a compatible Ethereum wallet.
2. Set the seller's address, payer's address, and payment amount in the constructor function.
3. The payer can call the `makePayment()` function to send payment to the contract.
4. The seller can call the `withdraw()` function to withdraw the payment once it has been confirmed.
5. If payment has not yet been made, the seller can call the `cancelTransaction()` function to return the payment to the payer.

## Built With

- Solidity

## Documentation:

- `constructor(address _seller, address payable _payer, uint256 _amount)`: The constructor function that sets the seller's address, payer's address, and payment amount.
- `function makePayment() external payable`: Function that allows the payer to send payment to the contract and confirm the payment.
- `function cancelTransaction() external`: Function that allows the seller to cancel the transaction and return the payment to the payer.
- `function withdraw() external`: Function that allows the seller to withdraw the payment once it has been confirmed.

## Authors

- [Abdelnasser Hajihashemabad](https://github.com/hajihashemabad)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
