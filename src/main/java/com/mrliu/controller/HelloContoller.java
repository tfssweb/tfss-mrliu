package com.mrliu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
//@RequestMapping("hello")
public class HelloContoller {

//	@RequestMapping("/hello")
//	public Object hello() {
//		return "hello springboot~~";
//	}
	
	@RequestMapping("/index")
    public String index(ModelMap map) {
//        map.addAttribute("name", "thymeleaf-imooc");
        return "preweb/index";
    }
	@RequestMapping("/index2")
	public String index2(ModelMap map) {
//        map.addAttribute("name", "thymeleaf-imooc");
		return "preweb/index2";
	}
	
}
