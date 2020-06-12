package com.edu.bean;

import java.util.HashMap;
import java.util.Map;

public class Message {
	private Integer code  ; // 状态码 200代表成功,500代表失败
	
	private String msg ;// 响应的信息
	
	private Map<String,Object> maps = new HashMap<String,Object>();// 响应的数据
	/**
	 * 采用链式书写的方式
	 */
	public Message add(String key,Object value) {
		getMaps().put(key, value) ;
		return this;
	}
	/**
	 * 编写了一个成功方法
	 * @return
	 */
	public static Message success() {
		Message message = new Message();
		message.setCode(200);
		message.setMsg("成功");
		return message ;
	}
	/**
	 * 编写了一个失败方法
	 * @return
	 */
	public static Message fail() {
		Message message = new Message();
		message.setCode(500);
		message.setMsg("失败");
		return message ;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Map<String, Object> getMaps() {
		return maps;
	}

	public void setMaps(Map<String, Object> maps) {
		this.maps = maps;
	}
	
	
	
}
