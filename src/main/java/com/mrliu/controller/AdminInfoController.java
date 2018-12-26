package com.mrliu.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mrliu.generate.mapper.AdminInfoMapper;
import com.mrliu.generate.mapper.VideoMapper;
import com.mrliu.generate.pojo.AdminInfo;
import com.mrliu.generate.pojo.AdminInfoExample;
import com.mrliu.generate.pojo.Video;
import com.mrliu.generate.pojo.VideoExample;
import com.mrliu.support.dao.DataAccessManager;

@Controller 
@RequestMapping(value = "/admin")
public class AdminInfoController {

	
	@RequestMapping("/login")  
	public String login(Model model){  
		return "backend/login";
	}
	
	
//	管理员登陆
	@RequestMapping("/adminIndex")  
	public String adminLogin(Model model,@RequestParam String username,@RequestParam String password){  
		
		AdminInfoExample adminInfoExample = new AdminInfoExample();
		
		List<AdminInfo> adminList = DataAccessManager.getMapper(AdminInfoMapper.class).selectByExample(adminInfoExample);
		System.out.println(adminList);
		
		AdminInfo adminInfo = null;
		for (int i = 0; i < adminList.size(); i++) {
			adminInfo = adminList.get(i);
			if(username.equals(adminInfo.getUsername()) && password.equals(adminInfo.getPassword())){
				return "backend/index";
			}
		}
		
		return "backend/404";
	}
	
}
