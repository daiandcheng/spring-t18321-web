package com.edu.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

public class MyHandlerExceptionResolver implements HandlerExceptionResolver{
	/**
	 *  判断当前异常是自定义的异常还是系统异常。
		如果当前的异常自定义的异常，获取异常信息，然后在错误页面显示
		如果是系统的异常，我们就设置异常信息为“未知错误”，然后在错误页面显示。

	 */
	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		MyException exception = null ;
		if(ex instanceof MyException) {
			exception = (MyException) ex;
		} else {
			exception = new MyException("未知错误") ;
		}
		ModelAndView model = new ModelAndView() ;
		model.addObject("message", exception.getMessage()) ;
		model.setViewName("error");
		return model;
	}

}
