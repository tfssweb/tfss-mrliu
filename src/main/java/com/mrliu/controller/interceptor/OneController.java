package com.mrliu.controller.interceptor;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mrliu.generate.pojo.Admin;
import com.sun.tools.internal.xjc.reader.xmlschema.bindinfo.BIConversion.User;

@Controller
@RequestMapping("one")
public class OneController {

	@RequestMapping("/index")
    public String index(ModelMap map) {
        map.addAttribute("admin", "imooc22");
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
		
		map.addAttribute("userList", userList);
		
        return "commingsoon/test";
    }
	
	@PostMapping("postform")
    public String postform(User user) {
		System.out.println(user.getName());
        return "redirect:/th/test";
    }
}