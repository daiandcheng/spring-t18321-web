package com.edu.interceptor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.edu.bean.Customer;

public class MyInterceptor implements HandlerInterceptor {
	/**
	 * 请求进入我们的控制器之前，我们干的事情
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		// 判断用户是否登录，从session中去取用户
		Customer customer = (Customer) request.getSession().getAttribute("CUSTOMER") ;
		if(null != customer) {
			return true ;
		}
		request.setAttribute("msg", "你没有访问的权限");
		try {
			request.getRequestDispatcher("/WEB-INF/jsp/loginUI.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	/**
	 * 请求进入了我们的控制器，返回ModelAndView之前执行
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}
	/**
	 * 控制器执行完毕之后，返回ModelAndView之后
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
	
}
