# dencentralised-market
A decentralised Market System
(will soon update with truffle framework)
# How is Concensus reached
-- The Seller list a item on Decentralised platform using a Product ID and a secret Random key
-- Amount equal to the price is deducted from the seller's wallet and stored in the contract
-- Amount equal to twice the price is deducted from the interested buyer's account
-- The Product is shipped along with the random secret key
-- Buyer use the hash of product id and random key to verify transaction's success
-- Seller's account get credited by an amount=twice the price and the buyer get half of his deducted amount back
