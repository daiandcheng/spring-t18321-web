package com.edu.service;

import java.util.List;

import com.edu.bean.Product;
import com.edu.exception.MyException;

public interface ProductService {

	List<Product> getAll();

	void save(Product product);

	Product getProductById(String id) throws Exception;

	void update(Product product);

	void delById(String id);

}
