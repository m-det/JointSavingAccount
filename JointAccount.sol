pragma solidity ^0.5.0;

contract JointSavings {
    address payable accountOne;
    address payable accountTwo;
    address public lastToWithdraw;
    uint public lastWithdrawAmount;
    uint public contractBalance;   

    function withdraw(uint amount, address payable recipient) public payable{
        require(recipient == accountOne || recipient == accountTwo, "You don't own this account!");
        require(contractBalance >= lastWithdrawAmount, "Insufficient Funds!");
        if (lastToWithdraw != recipient) {
            lastToWithdraw == recipient;
        }
        lastWithdrawAmount = amount;

        contractBalance = address(this).balance;
    }

    function deposit() public payable {
        contractBalance = address(this).balance;
    }

    function setAccounts(address payable account1, address payable account2) public payable{
        accountOne = account1;
        accountTwo = account2;
    }

    function() external payable {}
}