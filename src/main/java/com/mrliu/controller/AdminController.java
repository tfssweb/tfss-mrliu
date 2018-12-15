package com.mrliu.controller;

import java.util.ArrayList;
import java.util.List;

import org.n3r.idworker.Sid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mrliu.common.utils.JsonUtil;
import com.mrliu.common.utils.MrliuJSONResult;
import com.mrliu.common.utils.RedisOperatorUtil;
import com.mrliu.extend.mapper.AdminExtendMapper;
import com.mrliu.generate.mapper.AdminMapper;
import com.mrliu.generate.pojo.Admin;
import com.mrliu.generate.pojo.AdminExample;
import com.mrliu.support.dao.DataAccessManager;

@Controller   //需要配合视图使用
//@RestController		// @RestController = @Controller + @ResponseBody
@RequestMapping("/admin")
public class AdminController {
		@Autowired
		private Sid sid;
		
		@Autowired
		private RedisOperatorUtil redis;
		
		
		//需要放开@Controller ，注释掉@RestController，@Controller需要配合视图（modelandview等）使用
	 	@RequestMapping("/getAdmin")  
	    public String getAdmin(ModelMap map){  
	 		//生成ID
	 		String id = sid.nextShort();
	 		System.out.println(id);
	 		
		 	AdminExample adminExample = new AdminExample();
			adminExample.createCriteria().andUsernameEqualTo("admin");
			AdminMapper mapper = DataAccessManager.getMapper(AdminMapper.class);
			System.out.println(mapper);
			Admin admin = DataAccessManager.getMapper(AdminMapper.class).selectByExample(adminExample).get(0); 
	        System.out.println(admin);
			map.addAttribute("admin", admin);
			return "admin";  
	    }  
		
	 	@RequestMapping("/getAdminList")
	 	public List getAdminList(){
	        
			AdminExample adminExample = new AdminExample();
			adminExample.createCriteria().andUsernameEqualTo("admin");
			List adminList = DataAccessManager.getMapper(AdminMapper.class).selectByExample(adminExample);
			System.out.println(adminList);
			
			return adminList;
	 	}
	 	
	 	//根据条件查询
	 	@RequestMapping("/queryAdminList")
	 	//添加事务：增删改使用：REQUIRED，查使用：SUPPORTS
	 	@Transactional(propagation = Propagation.SUPPORTS)
	 	public String queryAdminList(ModelMap map,String username){
	        
			System.out.println(username);
			List adminList = DataAccessManager.getMapper(AdminExtendMapper.class).queryAdminList(username);
			System.out.println(adminList);
			map.addAttribute("adminList", adminList);
			return "adminList";
	 	}
	 	
	 	
	 	//@RestController的使用测试，即使没有页面，也会返回json数据
	 	@RequestMapping("/getAdmin2")  
	    public Admin getAdmin(){  
		 	AdminExample adminExample = new AdminExample();
			adminExample.createCriteria().andUsernameEqualTo("admin");
			AdminMapper mapper = DataAccessManager.getMapper(AdminMapper.class);
			System.out.println(mapper);
			Admin admin = DataAccessManager.getMapper(AdminMapper.class).selectByExample(adminExample).get(0); 
	        System.out.println(admin);
			return admin;  
	    }  
	 
	 	@RequestMapping("/getJsonList")
	 	public MrliuJSONResult getJsonList() {
	 		Admin admin1 = new Admin();
	 		admin1.setId(20);
	 		admin1.setUsername("admin");
	 		admin1.setPassword("admin20");
	 	
	 		Admin admin2 = new Admin();
	 		admin2.setId(21);
	 		admin2.setUsername("admin");
	 		admin2.setPassword("admin21");
	 		
	 		List<Admin> adminList = new ArrayList<>();
	 		//存
	 		redis.set("json:info:adminList", JsonUtil.objectToJson(adminList),2000);
	 		//取
	 		String userListJson = redis.get("json:info:adminList");
	 		List<Admin> userListBorn = JsonUtil.jsonToList(userListJson, Admin.class);

			return MrliuJSONResult.ok(userListBorn);
	 	}
	 	
}
