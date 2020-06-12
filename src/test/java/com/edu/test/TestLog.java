package com.edu.test;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class TestLog {

	public static void main(String[] args) {
		 Logger logger = LoggerFactory.getLogger(TestLog.class);
		 // 日志的级别 trace < debug < info < warn <error
		 logger.trace("这是日志的trace级别.....");
		 logger.debug("这是日志的debug级别.....");
		 logger.info("这是日志的info级别.....");
		 logger.warn("这是日志的warn级别.....");
		 logger.error("这是日志的error级别.....");
	}

}
