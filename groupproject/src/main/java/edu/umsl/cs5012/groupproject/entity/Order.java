package edu.umsl.cs5012.groupproject.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name="orders")
public class Order extends EntityBaseClass {


	@OneToOne
	private User user;
	
    @Column
    private Float totalPrice;

    @Column
    private Date orderDate;

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name="orders_id")
    private List<OrderItem> orderItems;



    public Float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }

    public void addOrderItems(OrderItem oi) {
        if (orderItems == null) {
            orderItems = new ArrayList<OrderItem>();
        }
        orderItems.add(oi);
    }

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
