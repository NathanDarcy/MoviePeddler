package edu.umsl.cs5012.groupproject.repo;

import org.springframework.data.repository.CrudRepository;

import edu.umsl.cs5012.groupproject.entity.Product;

public interface ProductRepository extends CrudRepository<Product, Integer> {

	Product findByPartnumber(String partnumber);
}
