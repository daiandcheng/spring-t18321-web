package com.edu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.bean.Product;
import com.edu.exception.MyException;
import com.edu.mapper.ProductMapper;
import com.edu.service.ProductService;
@Service
@Transactional
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductMapper productMapper;
	@Override
	public List<Product> getAll() {
		return productMapper.selectByExample(null);
	}
	@Override
	public void save(Product product) {
		productMapper.insertSelective(product);
	}

	@Override
	public Product getProductById(String id) throws MyException {
		Product product = productMapper.selectByPrimaryKey(id);
		if(null == product) {
			throw new MyException("数据库没有这个东东......") ;
		}
		return product ;
	}

	@Override
	public void update(Product product) {
		productMapper.updateByPrimaryKeySelective(product);
	}

	@Override
	public void delById(String id) {
		productMapper.deleteByPrimaryKey(id);
	}

}
