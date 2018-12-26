package com.mrliu.controller.interceptor;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
        return "commingsoon/test";
    }
	
//	@PostMapping("postform")
//    public String postform(User user) {
//		System.out.println(user.getName());
//        return "redirect:/th/test";
//    }
}