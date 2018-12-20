package edu.umsl.cs5012.groupproject.form;

import java.util.ArrayList;
import java.util.List;

public class OrderForm {

	private List<OrderFormItem> orderItems=new ArrayList<>();

	public List<OrderFormItem> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(List<OrderFormItem> orderItems) {
		this.orderItems = orderItems;
	}
	

	
	
}
