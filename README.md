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

## PaymentGuaranteeWithMonitor Smart Contract
The [PaymentGuaranteeWithMonitor](PaymentGuaranteeWithMonitor.sol) Smart Contract is a Solidity contract that extends the `PaymentGuarantee` contract to include a third-party monitor for overseeing transactions.
This contract ensures secure transactions between two parties, with the monitor responsible for approving the transaction before the seller can withdraw the payment.

```bash
# Get the latest snapshot
#https
git clone https://github.com/hajihashemabad/PaymentGuarantee.git
#ssh
git clone git@github.com:hajihashemabad/PaymentGuarantee.git
# Change directory
cd PaymentGuarantee/
```
We have added a new smart contract called `PaymentGuaranteeWithMonitor` that enhances the functionality of the original `PaymentGuarantee` contract.
This new contract introduces a third-party monitor who oversees transactions between the payer and the seller. The monitor's role is to approve the transaction after the payment has been made, ensuring an additional layer of security and trust.

The `PaymentGuaranteeWithMonitor` smart contract provides the following functions:

- `constructor(address _seller, address payable _payer, address _monitor, uint256 _amount)`: Constructor function that sets the seller's address, payer's address, monitor's address, and payment amount.
- `makePayment() external payable`: Function that allows the payer to send payment to the contract and confirm the payment.
- `approveTransaction() external`: Function that allows the monitor to approve the transaction after payment has been made.
- `cancelTransaction() external`: Function that allows the seller to cancel the transaction and return the payment to the payer if payment has not yet been made.
- `withdraw() external`: Function that allows the seller to withdraw the payment once it has been approved by the monitor.

## Contributing
I welcome contributions to the `PaymentGuarantee` project! If you'd like to contribute, please fork the repository and create a new branch for your changes. Once you've made your changes, submit a pull request, and I'll review it as soon as possible.

## License
PaymentGuarantee is released under the MIT [LICENSE](LICENSE).

## Authors
- [Mohammad Nasser Haji Hashemabad](https://mohammadnasser.com)

## Contact
If you have any questions or comments about PaymentGuarantee, feel free to reach out to me at [Email](mailto:info@mohammadnasser.com).
