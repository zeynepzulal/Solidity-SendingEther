
// SPDX-License-Identifier:MIT

pragma solidity ^0.8.17;


contract SendingEther{

    function sendViaTransfer(address payable _to) public payable{
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
       bool sent = _to.send(msg.value);
       require(sent, "Failed to send ether");
    }

    //kullanilmasi en çok tavsiye edilen ether transfer yolu 
    function sendViaCall(address payable _to) public payable{
        (bool sent,bytes memory data) = _to.call{value: msg.value}("");
        require(sent,"Failed to send ether");
    }

}

contract ReceiveEther{

       /*
    Which function is called, fallback() or receive()?

           send Ether
               |
         is there any msg.data?
              / \
            yes  no
            /     \
receive() exists?  fallback()
         /   \
        yes   no
        /      \
    receive()   fallback() 
    */


    event FallbackEvent(address sender, uint256 value);

    receive() external payable {
   // msg data var ama bos ise buraya düsüyor
    }

    fallback() external payable{
    // msg data hic yok ise buraya düser
    emit FallbackEvent(msg.sender, msg.value);
    }


}