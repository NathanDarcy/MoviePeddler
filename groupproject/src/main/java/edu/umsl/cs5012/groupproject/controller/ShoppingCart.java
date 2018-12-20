package edu.umsl.cs5012.groupproject.controller;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import edu.umsl.cs5012.groupproject.entity.Product;

public class ShoppingCart implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Map<String, ShoppingCartItem> shoppingCartItemMap = new HashMap<>();
	private float total = 0.0f;
	

	
	public Product findProduct(String partnumber) {
		if(shoppingCartItemMap.containsKey(partnumber)) {
			return shoppingCartItemMap.get(partnumber).getProduct();
		}else{
			return null;
		}
	}
	
	public ShoppingCartItem findItem(String partnumber) {
		return shoppingCartItemMap.get(partnumber);
	}


	public Collection<ShoppingCartItem> getShoppingCartItems(){
		return shoppingCartItemMap.values();
	}
	
	/**
	 * adds a product (ShoppingCartItem) to the shopping cart.
	 * If the product already exists, the quantity is updated.
	 * If the quantity is 0, then remove the product from the shopping cart.
	 * 
	 * @param product
	 * @param quantity
	 */
	public void addProduct(Product product, int quantity) {
		ShoppingCartItem item =null;
		if(shoppingCartItemMap.containsKey(product.getPartnumber())) {
			item =shoppingCartItemMap.get(product.getPartnumber());
		}else {
			item = new ShoppingCartItem();
			item.setProduct(product);
			shoppingCartItemMap.put(product.getPartnumber(), item);
		}
		item.setQuantity(quantity);

		if(quantity==0) {
			shoppingCartItemMap.remove(product.getPartnumber());
		}
		
		calculateTotal();
	}
	
	private void calculateTotal() {
		total=0.0f;
		for(ShoppingCartItem item: shoppingCartItemMap.values()) {
			total += item.getQuantity()*item.getProduct().getPrice();
		}
	}
	
	
	public void clearShoppingCart() {
		if(shoppingCartItemMap !=null) {
			this.shoppingCartItemMap.clear();
		}
		total = 0.0f;
	}
	
	public boolean containsPartnumber(String partnumber) {
		return shoppingCartItemMap.containsKey(partnumber);
	}

	public float getTotal() {
		return total;
	}
	
	
}
