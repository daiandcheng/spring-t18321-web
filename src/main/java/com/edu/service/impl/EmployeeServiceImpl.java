package com.edu.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.bean.Employee;
import com.edu.bean.EmployeeExample;
import com.edu.mapper.EmployeeMapper;
import com.edu.service.EmployeeService;
@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService{
	private Logger logger = LoggerFactory.getLogger(EmployeeServiceImpl.class); 
	@Autowired
	private EmployeeMapper employeeMapper ;
	@Override
	public List<Employee> getAll() {
		logger.info("EmployeeServiceImpl.............getAll.........");
		// TODO Auto-generated method stub
		return employeeMapper.selectByDeptExample(null);
	}
	@Override
	public void save(Employee employee) {
		logger.info("EmployeeServiceImpl.............save.........");
		employeeMapper.insertSelective(employee);
	}
	@Override
	public Employee getById(Integer empId) {
		// TODO Auto-generated method stub
		logger.info("EmployeeServiceImpl.............getById.........");
		return employeeMapper.selectByPrimaryKey(empId);
	}
	@Override
	public void update(Employee employee) {
		logger.info("EmployeeServiceImpl.............update.........");
		employeeMapper.updateByPrimaryKeySelective(employee);
	}
	@Override
	public void deleteById(Integer empId) {
		// TODO Auto-generated method stub
		employeeMapper.deleteByPrimaryKey(empId);
	}
	@Override
	public boolean getByUserName(String empName) {
		// TODO Auto-generated method stub
		EmployeeExample example = new EmployeeExample();
		example.createCriteria().andEmpNameEqualTo(empName);
		// 查询到的数量大于0代表数据库中有，true有就代表不能用，false代表能用
		return employeeMapper.countByExample(example)>0;
	}

}
