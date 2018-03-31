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
            s.boolBuyerEdit();//customer is available
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
    
    function Transaction(uint Productid,uint Random )onlyOwner{
        hash=sha256(Productid,Random);
        if(hash==s.Hash()){
            if(s.boolBuyer()){
            s.boolStatusEdit();
            address(s).transfer(pricelisted);
            }
         
        }
        if(s.boolStatus()){
            s.Payback();
            owner.transfer(pricelisted);
        }
    }   
}    

