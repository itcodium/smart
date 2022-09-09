// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
// https://www.youtube.com/watch?v=ajCsPRl5S3Q&list=PLO5VPQH6OWdVQwpQfw9rZ67O6Pjfo6q-p&index=50
pragma solidity ^0.8.13;

interface IERC721{
    function transferFrom(
        address _from,
        address _to,
        uint _nftId
    ) external;
}


contract DutchAuction {
   uint private constant DURATION = 7 days;
   
   IERC721 public immutable nft;
   uint public immutable nftId;

   address payable public immutable seller;
   uint public immutable startingPrice;
   uint public immutable startAt;
   uint public immutable expiresAt;
   uint public immutable discountRate;

   constructor(
       uint _startingPrice,
       uint _discountRate,
       address _nft,
       uint _nftId
   ){
       seller = payable(msg.sender);
        startingPrice= _startingPrice;
        discountRate= _discountRate;
        startAt = block.timestamp;
        expiresAt = block.timestamp + DURATION;

        require(
            _startingPrice >= _discountRate * DURATION,
            "Starting Price < discount"
        );

        nft = IERC721(_nft);
        nftId = _nftId;
   }

   function getPrice() public view returns(uint){
        uint timeElapsed = block.timestamp - startAt;
        uint discount = discountRate * timeElapsed;
        return startingPrice - discount;
    }

    function buy() external payable {
        require(block.timestamp < expiresAt, "Auction expired");
        uint price = getPrice();
        require(msg.value >= price, "ETH < price");

        nft.transferFrom(seller, msg.sender, nftId);

        uint refund = msg.value - price;
        if(refund > 0){
            payable(msg.sender).transfer(refund);
        }

        selfdestruct(seller);
    } 

}

// https://solidity-by-example.org/app/erc721/

/**
1. deploy NFT contract
2. call function mint (to creat an NFT)
    Params to pass:

    - address: copy the contract's address od the contact
    - tokenId: any number 555 (*)

    click transact button

3. Deploy Dutch Auction contract

    Params:
      _startingPrice = 1000000
      _discountRate = 1         (every second the starting price will be decreasing by one)
      _nft =    Addres of the NFT deployed (1)
      _nftId = 555 (*)

4. hit transact    
5. approve ductch auction to spend the NFT
6. open NFT contract to approve
    Params:
    address:  Copy ductch auction contract address
    tokenId: 555 (Token selling)
7. Check price: open ductch auction contract

    - call get price function

8. Change to another account

    set value = 999928  (ei)

9. click buy
10. go back to the NFT contract  check nft owner 
    
    Param: tokenId = 555

    
 */

