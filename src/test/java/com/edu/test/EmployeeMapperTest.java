package com.edu.test;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.edu.bean.Employee;
import com.edu.mapper.EmployeeMapper;
import com.edu.util.UUIDUtil;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/applicationContext.xml"})
public class EmployeeMapperTest {
	@Autowired
	private EmployeeMapper employeeMapper ;
	@Autowired
	private SqlSession sqlSession ;
	@Test
	public void test() {
//		ClassPathXmlApplicationContext context = 
//				new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");
//		EmployeeMapper employeeMapper = context.getBean(EmployeeMapper.class);
//		System.out.println(employeeMapper);
		// 批量添加数据
		EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
//		for(int i = 1 ;i<=1000;i++) {
//			Employee employee = new Employee();
//			employee.setEmpName(UUIDUtil.getCode().substring(1, 6));
//			employee.setEmpBirthday(new Date());
//			employee.setEmpEmail(UUIDUtil.getCode().substring(1,6)+"@qq.com");
//			employee.setEmpSex("M");
//			employee.setDeptId(1);
//			mapper.insertSelective(employee);
//		}
		
		List<Employee> emps = mapper.selectByDeptExample(null);
		emps.forEach((emp) -> {
			System.out.println(emp.getEmpName()+","+emp.getDepartment().getDeptName());
		});
		
	}
}
