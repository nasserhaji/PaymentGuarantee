pragma solidity >=0.4.22 <0.9.0;

contract PaymentGuaranteeWithMonitor {
    address payable public seller;
    address payable public payer;
    address public monitor;
    uint256 public amount;
    bool public paymentMade;
    bool public transactionApproved;

    constructor(address _seller, address payable _payer, address _monitor, uint256 _amount) public {
        seller = address(uint160(_seller));
        payer = _payer;
        monitor = _monitor;
        amount = _amount;
        paymentMade = false;
        transactionApproved = false;
    }

    function makePayment() external payable {
        require(msg.sender == payer, "Only the payer can make the payment");
        require(msg.value == amount, "Payment amount should match the required amount");
        paymentMade = true;
    }

    function approveTransaction() external {
        require(msg.sender == monitor, "Only the monitor can approve the transaction");
        require(paymentMade, "Payment should be made before approving the transaction");
        transactionApproved = true;
    }

    function cancelTransaction() external {
        require(msg.sender == seller, "Only the seller can cancel the transaction");
        require(!paymentMade, "Cannot cancel the transaction after payment is made");
        selfdestruct(payer);
    }

    function withdraw() external {
        require(msg.sender == seller, "Only the seller can withdraw the payment");
        require(paymentMade, "Payment should be made before withdrawing");
        require(transactionApproved, "Transaction should be approved by the monitor before withdrawing");
        selfdestruct(seller);
    }
}
