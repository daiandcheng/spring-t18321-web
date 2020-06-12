package com.edu.service;

import java.util.List;

import com.edu.bean.Employee;

public interface EmployeeService {

	List<Employee> getAll();

	void save(Employee employee);

	Employee getById(Integer empId);

	void update(Employee employee);

	void deleteById(Integer empId);

	boolean getByUserName(String empName);

}
