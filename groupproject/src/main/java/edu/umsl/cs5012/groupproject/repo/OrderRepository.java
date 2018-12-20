package edu.umsl.cs5012.groupproject.repo;

import edu.umsl.cs5012.groupproject.entity.Order;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

public interface OrderRepository extends CrudRepository<Order, Integer> {

	List<Order> findAllByUserIdOrderByOrderDate(Integer userId);

}
