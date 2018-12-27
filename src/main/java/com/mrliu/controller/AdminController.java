package com.mrliu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mrliu.generate.pojo.AdminInfo;
import com.mrliu.generate.pojo.Video;
import com.mrliu.service.AdminService;
import com.mrliu.service.VideoService;

@Controller 
@RequestMapping(value = "/admin")
public class AdminController {

	@Autowired
    private AdminService adminService;
	@Autowired
	private VideoService videoService;
	
	@RequestMapping("/login")  
	public String login(Model model){  
		return "backend/login";
	}
	
	
    /**
     * 登陆验证
     * @param model
     * @param username
     * @param password
     * @return
     */
	@RequestMapping("/index")  
	public String adminLogin(Model model,@RequestParam String username,@RequestParam String password){  
		
		List<AdminInfo> adminList = adminService.getAllAdmin();
		
		AdminInfo adminInfo = null;
		for (int i = 0; i < adminList.size(); i++) {
			adminInfo = adminList.get(i);
			if(username.equals(adminInfo.getUsername()) && password.equals(adminInfo.getPassword())){
				return "backend/index";
//				return "redirect:home";
//				return "forward:home";
			}
		}
		
		return "backend/404";
	}
	
	
	@RequestMapping("/home")  
	public String index(Model model){  
		List<Video> videoList = videoService.getAllVideo();
		model.addAttribute("videoSum", videoList.size());
		return "backend/home";
	}
	
}
