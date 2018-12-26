package com.mrliu.controller.interceptor;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
        return "adminList";
    }
	
}