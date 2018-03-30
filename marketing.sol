pragma solidity ^0.4.16;
contract seller{
    address owner;
    struct product {
    
    //address destination;
    uint price;
    uint productid;
    bool Status;
    bool  buyer ;//check for available customer
    
    }
    uint  amount;
    bytes32 public Hash;
    product public Product;
    mapping(uint => product ) products;
   
   
     function seller(uint Productid ,uint Random)payable {
        owner =msg.sender;
        Hash=sha256(Productid,Random);
        Product = products[Productid];
    //    Product.destination=msg.sender;
        Product.price=msg.value;
        Product.productid = Productid;
        amount =msg.value;
    }
     modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    function() payable {

    }
   
 
   
    function Payback (){
       
        if(Product.Status){
            owner.transfer(2*amount);
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
contract buyer{
    seller s;
    uint public pricelisted;
    uint public pricebuyer;
    address owner;
    bytes32 public hash;
    function buyer(address Seller)payable{
        s = seller(Seller);
        owner=msg.sender;
        pricelisted=address(s).balance;
        pricebuyer=msg.value;//msg.value is twice the price
        if(pricebuyer==2*pricelisted){
            s.boolBuyerEdit();
        }
    }
    
     modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    //to check the price
    function sellersContractBalance() view returns (uint){
        return address(s).balance;   
    }
    function buyersContractBalance() view returns (uint){
        return address(this).balance;   
    }
    
    function Transaction(uint Productid,uint Random ){
        hash=sha256(Productid,Random);
        if(hash==s.Hash()){
            if(s.boolBuyer()){
            s.boolStatusEdit();
            address(s).transfer(pricelisted);
            }
         
        }
        if(s.boolStatus()){
            s.Payback;
            owner.transfer(pricelisted);
        }
    }
   
    
}    
