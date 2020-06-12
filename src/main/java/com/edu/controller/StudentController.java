package com.edu.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.bean.Customer;

@Controller
@RequestMapping("/stu")
public class StudentController {
	
	@RequestMapping("/list")
	public String list(HttpSession session) {
//		Customer customer = (Customer) session.getAttribute("CUSTOMER") ;
//		
//		if(null == customer) {
//			return "forward:/loginUI";
//		}
		return "stuList" ;
	}
}
