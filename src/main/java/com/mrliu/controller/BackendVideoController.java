package com.mrliu.controller;

import java.util.List;

import org.n3r.idworker.Sid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mrliu.generate.mapper.VideoMapper;
import com.mrliu.generate.pojo.Video;
import com.mrliu.generate.pojo.VideoExample;
import com.mrliu.support.dao.DataAccessManager;

@Controller 
//@RestController
@RequestMapping(value = "/admin")
public class BackendVideoController {

	@Autowired
	private Sid sid;
	
	
//	获取所有视频列表
	@RequestMapping("/getVideoList")  
//    public List getVideoList(Model model){  
	public String getVideoList(Model model){  
		
		VideoExample videoExample = new VideoExample();
		List<Video> videoList = DataAccessManager.getMapper(VideoMapper.class).selectByExample(videoExample);
		System.out.println(videoList);
		model.addAttribute("videoList", videoList);
		return "frontend/videos";
//		return videoList;
	}
	
}
