package com.edu.util;

import java.util.UUID;

public class UUIDUtil {
	/**
	 * 产生一个uuid
	 * @return
	 */
	public static String getCode() {
		
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
