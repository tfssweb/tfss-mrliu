package com.mrliu.controller.interceptor;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mrliu.generate.pojo.Admin;

@Controller
@RequestMapping("two")
public class TwoController {

	@RequestMapping("/index")
    public String index(ModelMap map) {
        map.addAttribute("admin", "itzixi22");
        return "commingsoon/index";
    }
	
	@RequestMapping("center")
    public String center() {
        return "commingsoon/center/center";
    }

	@RequestMapping("test")
    public String test(ModelMap map) {
		

		Admin user = new Admin();
		user.setUsername("admin");
		user.setPassword("123456");
		
		map.addAttribute("user", user);
		
		Admin user1 = new Admin();
		user1.setUsername("admin");
		user1.setPassword("123456");
		
		Admin user2 = new Admin();
		user2.setUsername("admin");
		user2.setPassword("123456");
		
		List<Admin> userList = new ArrayList<>();
		userList.add(user);
		userList.add(user1);
		userList.add(user2);
		
		map.addAttribute("adminList", userList);
		
        return "adminList";
    }
	
	@PostMapping("postform")
    public String postform(Admin user) {
		System.out.println(user.getUsername());
        return "redirect:/th/test";
    }
}