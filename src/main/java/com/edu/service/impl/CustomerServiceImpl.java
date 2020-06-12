package com.edu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.bean.Customer;
import com.edu.bean.CustomerExample;
import com.edu.mapper.CustomerMapper;
import com.edu.service.CustomerService;
@Service
@Transactional
public class CustomerServiceImpl implements CustomerService{
	@Autowired
	private CustomerMapper customerMapper ;
	@Override
	public Customer getCustomerByNameAndPwd(Customer customer) {
		CustomerExample example = new CustomerExample();
		example.createCriteria().andUserNameEqualTo(customer.getUserName()).andUserPwdEqualTo(customer.getUserPwd());
		List<Customer> customers = customerMapper.selectByExample(example);
		if(customers.size()>0) {
			return customers.get(0) ;
		}
		return null;
	}

}
