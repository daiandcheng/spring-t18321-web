package com.edu.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.bean.Customer;
import com.edu.service.CustomerService;

@Controller
public class CustomerController {
	@Autowired
	private CustomerService customerService ;
	/**
	 * 跳转到登录页面
	 * @return
	 */
	@RequestMapping("/loginUI")
	public String loginUI() {
		// /WEB-INF/jsp/loginUI.jsp
		return "loginUI";
	}
	// http://localhost:8080/login
	@RequestMapping("/login")
	public String login(Customer customer,Model model,HttpSession session) {
		// 
		Customer cust = customerService.getCustomerByNameAndPwd(customer) ;
		if(null == cust) {
			// 代表登录失败
			model.addAttribute("msg", "用户名或者密码不正确");
			return "loginUI";
		} else {
			// 代表登录成功，我们要转发？还是重定向？
			session.setAttribute("CUSTOMER", cust);
			return "redirect:/stu/list";
		}
	}
	
	@RequestMapping("/loginout")
	public String loginout(HttpSession session) {
		// 所谓的退出就是让session失效，jsp怎么让session失效， <web.xml
		session.invalidate();// 让session失效
		return "loginUI" ;
	}
}
