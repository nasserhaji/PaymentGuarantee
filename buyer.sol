pragma solidity >=0.4.22 <0.9.0;

contract PaymentGuarantee {
    address payable public seller; // آدرس فروشنده
    address payable public buyer; // آدرس خریدار
    uint public price; // قیمت کالا
    uint public deposit; // وجه پیش پرداخت
    bool public paid; // وضعیت پرداخت

    constructor(address payable _seller, uint _price, uint _deposit) public {
        seller = _seller;
        buyer = msg.sender;
        price = _price;
        deposit = _deposit;
        paid = false;
    }

    function confirm() public payable {
        require(msg.sender == buyer, "Only buyer can confirm the transaction.");
        require(msg.value == deposit, "Deposit amount should be equal to the agreed amount.");
        paid = true;
    }

    function finalize() public {
        require(msg.sender == buyer || msg.sender == seller, "Only buyer or seller can finalize the transaction.");
        require(paid == true, "Payment should be confirmed first.");
        seller.transfer(price);
        selfdestruct(buyer);
    }
}
