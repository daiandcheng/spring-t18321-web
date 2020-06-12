package com.edu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.bean.Employee;
import com.edu.bean.Message;
import com.edu.service.EmployeeService;
import com.edu.service.impl.EmployeeServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/emp")
public class EmployeeController {
	private Logger logger = LoggerFactory.getLogger(EmployeeController.class); 
	@Autowired
	private EmployeeService employeeService ;
	
//	@RequestMapping(value="/list",method = RequestMethod.GET)
//	public String list(@RequestParam(name = "pg",defaultValue = "1") int pg,Model model) {
//		//做分页操作1.自己写分页插件 2.使用别人写的分页插件
//		//获取第1页，6条内容，默认查询总数count
//		PageHelper.startPage(pg, 6);
//		// 查询所有的数据
//		List<Employee> empList = employeeService.getAll();
//		//用PageInfo对结果进行包装
//		PageInfo page = new PageInfo(empList,6);
//		model.addAttribute("pageInfo", page) ;
//		return "emp/list";
//	}
	@ResponseBody
	@RequestMapping(value="/list",method = RequestMethod.GET)
	public Message list(@RequestParam(name = "pg",defaultValue = "1") int pg) {
		logger.debug("==============EmployeeController=========list========");
		//做分页操作1.自己写分页插件 2.使用别人写的分页插件
		//获取第1页，6条内容，默认查询总数count
		PageHelper.startPage(pg, 6);
		// 查询所有的数据
		List<Employee> empList = employeeService.getAll();
		//用PageInfo对结果进行包装
		PageInfo page = new PageInfo(empList,6);
		
		return Message.success().add("pageInfo", page);
	}
	@ResponseBody
	@RequestMapping(value="/edit",method = RequestMethod.POST)
	public Message add(@Validated Employee employee,BindingResult result) {
		// 在新增的时候要做校验。hibernatevalidate校验
		if(result.hasErrors()) {
			List<FieldError> fieldErrors = result.getFieldErrors() ;
			Map<String,Object> maps = new HashMap<String,Object>() ;
			fieldErrors.forEach((error)-> {
				maps.put(error.getField(), error.getDefaultMessage());
			});
			
			return Message.fail().add("fielErros", maps) ;
			
		}
		
		employeeService.save(employee);
		return Message.success();
	}
	@ResponseBody
	@RequestMapping(value="/edit/{empId}",method = RequestMethod.GET)
	public Message editUI(@PathVariable("empId") Integer empId) {
		Employee employee = employeeService.getById(empId);
		return Message.success().add("employee", employee);
	}
	@ResponseBody
	@RequestMapping(value="/edit/{empId}",method = RequestMethod.PUT)
	public Message edit(Employee employee) {
		employeeService.update(employee);
		return Message.success();
	}
	@ResponseBody
	@RequestMapping(value="/edit/{empId}",method = RequestMethod.DELETE)
	public Message delete(@PathVariable("empId") String empId) {
		if(empId.contains(",")) {
			// 批量删除
			String[] empStrs = empId.split(",");
			for(int i =0 ;i<empStrs.length;i++) {
				employeeService.deleteById(Integer.valueOf(empStrs[i]));
			}
		} else {
			employeeService.deleteById(Integer.valueOf(empId));
		}
		
		return Message.success();
	}
	@ResponseBody
	@RequestMapping(value="/checkUserName",method = RequestMethod.GET)
	public Message checkUserName(String empName) {
		// 校验用户名是否合规
		String reg = "(^[a-zA-Z0-9_-]{3,16}$)|(^[\\u2E80-\\u9FFF]{2,6}$)";
		if(!empName.matches(reg)) {
			return Message.fail().add("msg", "请输入字母数字或者下划线中划线3到16位,或者输入2到6为的中文") ;
		}
		boolean flag = employeeService.getByUserName(empName) ;
		
		return Message.success().add("flag", flag);
	}
}
