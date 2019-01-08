package com.mrliu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
@RequestMapping(value = "/vip")
public class VipController {

	
	@RequestMapping(value = "/")
    public String index() {
        return "redirect:index";
    }
	
	
    /**
     * 登陆验证
     * @param model
     * @param username
     * @param password
     * @return
     */
	@RequestMapping("/index")  
	public String vipIndex(Model model){  
		
		return "frontend/vip/index";
	}
	
}