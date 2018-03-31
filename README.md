# dencentralized-market
A decentralized Market System
(will soon update with truffle framework)
# How is Concensus reached
-- The Seller list a item on Decentralised platform using a Product ID and a secret Random key
-- Amount equal to the price is deducted from the seller's wallet and stored in the contract
-- Amount equal to twice the price is deducted from the interested buyer's account
-- The Product is shipped along with the random secret key
-- Buyer use the hash of product id and random key to verify transaction's success
-- Seller's account get credited by an amount=twice the price and the buyer get half of his deducted amount back

#Test in Remix 
--Copy and paste the code of both contracts in remix ide
--Fill the value = price of product eg. 10 ether and create the seller's contract filling the constructor's arguement(ID and random no.) of your choice
--check the balances
-- Now fill the value = twice the price declared earlier and deploy the buyers contract using the address of the seller's contract   
-- Pass the same product id and random number in the transaction function and execute it
--Check the balances
