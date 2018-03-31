pragma solidity ^0.4.16;
contract seller{
    address owner;
    struct product {
    uint price;
    uint productid;
    bool Status;
    bool  buyer ;
    }
  
    bytes32 public Hash;
    product public Product;
    mapping(uint => product ) products;//mapping each product id with product
   
   
     function seller(uint Productid ,uint Random)payable {
        owner =msg.sender;
        Hash=sha256(Productid,Random);
        Product = products[Productid];
        Product.price=msg.value;
        Product.productid = Productid;
       
    }
     modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    function() payable {

    }
   
 
   
    function Payback (){
       
        if(Product.Status){
            owner.transfer(2*Product.price);
            Product.Status=false;
        }
    
    }
    function boolBuyer() view public returns (bool){
        return Product.buyer;
    }
    function boolBuyerEdit() {
        Product.buyer=true;  
    }
     function boolStatusEdit()  {
        Product.Status=true;  
    }
     function boolStatus() view returns (bool){
        return Product.Status;
    }
    function ContractsBalance () view returns (uint){
        return address(this).balance;
    }
    //for test purpose--only owner can check his balance 
    function SellersBalance ()onlyOwner view returns (uint){
        return owner.balance;
    }

}    
