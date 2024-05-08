// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// First smart contract
contract Producer {

    receive() external payable { }

    function checkbal() public view returns(uint) {
        return address(this).balance;
    }

    event log(uint value);

    function SEND(address payable getter, uint amount) public payable {
        emit log(amount);    
        bool sent = getter.send(amount);
        require(sent, "Transaction failed");
    }

    function TRANSFER(address payable getter, uint amount) public payable {
        emit log(amount);    
        getter.transfer(amount);
    }

    function CALL(address payable getter, uint amount) public payable {
        emit log(amount);    
        (bool sent,) = getter.call{value: amount}("");
        require(sent, "Transaction failed");
    }
}

// Second smart contracts 
contract Consumer {

    receive() external payable { }

    function checkbal() public view returns(uint) {
        return address(this).balance;
    }

    event log(uint value);

    function TRANSFER(address payable getter, uint amount) public payable {
        emit log(amount);    
        getter.transfer(amount);
    }

    function CALL(address payable getter, uint amount) public payable {
        emit log(amount);    
        (bool sent,) = getter.call{value: amount}("");
        require(sent, "Transaction failed");
    }
}

// Third smart contract 
contract Retailer {

    receive() external payable { }

    function checkbal() public view returns(uint) {
        return address(this).balance;
    }

    event log(uint value);

    function TRANSFER(address payable getter, uint amount) public payable {
        emit log(amount);    
        getter.transfer(amount);
    }

    function CALL(address payable getter, uint amount) public payable {
        emit log(amount);    
        (bool sent,) = getter.call{value: amount}("");
        require(sent, "Transaction failed");
    }
}
