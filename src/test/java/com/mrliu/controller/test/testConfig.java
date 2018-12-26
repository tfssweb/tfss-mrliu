package com.mrliu.controller.test;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类  
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"}) 
public class testConfig {

	private static Logger logger = Logger.getLogger(testConfig.class);
	
	@Test
	public void test1(){
//		AdminExample adminExample = new AdminExample();
//		adminExample.createCriteria().andUsernameEqualTo("admin");
//		Admin admin = DataAccessManager.getMapper(AdminMapper.class).selectByExample(adminExample).get(0);
		
//		logger.info(JSON.toJSON(admin));
		
		//加载xml文件
//		ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-mybatis.xml");
//		AdminMapper adminMapper = (AdminMapper)ctx.getBean("adminMapper");
//		AdminExample adminExample = new AdminExample();
//		Admin admin = adminMapper.selectByExample(adminExample).get(0);
//		logger.info(JSON.toJSON(admin));
	}
	
}
