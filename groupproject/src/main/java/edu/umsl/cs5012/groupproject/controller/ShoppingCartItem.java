package edu.umsl.cs5012.groupproject.controller;

import edu.umsl.cs5012.groupproject.entity.Product;

public class ShoppingCartItem {

	private Product product;
	private int quantity;
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public void incrementQuantity() {
		quantity++;
	}
	
	
}
