package com.mrliu.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mrliu.generate.mapper.VideoMapper;
import com.mrliu.generate.pojo.Video;
import com.mrliu.generate.pojo.VideoExample;
import com.mrliu.support.dao.DataAccessManager;

@Controller 
public class BackendVideoController {

	
	@RequestMapping(value = "/admin")
    public String index() {
        return "redirect:adminLogin";
    }
	
//	获取所有视频列表
	@RequestMapping("/adminLogin")  
	public String getVideoList(Model model,@RequestParam String username,@RequestParam String password){  
		
		VideoExample videoExample = new VideoExample();
		List<Video> videoList = DataAccessManager.getMapper(VideoMapper.class).selectByExample(videoExample);
		System.out.println(videoList);
		model.addAttribute("videoList", videoList);
		return "frontend/videos";
	}
	
}
