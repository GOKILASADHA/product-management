// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract AgricultureContract {

    
    struct Product {
        string name;
        string description;
        uint256 quantity;
        uint256 price;
    }
    
    mapping (uint256 => Product) products;
    
    function addProduct(uint256 id, string memory name, string memory description, uint256 quantity, uint256 price) public {
        products[id] = Product(name, description, quantity, price);
    }
    
    function getProduct(uint256 id) public view returns (string memory, string memory, uint256, uint256) {
        Product storage p = products[id];
        return (p.name, p.description, p.quantity, p.price);
    }
    
    function updateProduct(uint256 id, string memory name, string memory description, uint256 quantity, uint256 price) public {
        require(products[id].price > 0, "Product not found");
        products[id] = Product(name, description, quantity, price);
    }
}
