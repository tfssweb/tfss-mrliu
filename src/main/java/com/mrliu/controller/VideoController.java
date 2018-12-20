package com.mrliu.controller;

import java.util.List;

import org.n3r.idworker.Sid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mrliu.generate.mapper.VideoMapper;
import com.mrliu.generate.pojo.Video;
import com.mrliu.generate.pojo.VideoExample;
import com.mrliu.support.dao.DataAccessManager;

@Controller   //需要配合视图使用
//@RestController		// @RestController = @Controller + @ResponseBody
//@RequestMapping("/video")
public class VideoController {

	@Autowired
	private Sid sid;
	
	@RequestMapping(value = "/")
    public String index() {
        return "redirect:getVideoList";
    }
	
//	@RequestMapping("/getVideoList")  
//    public String getVideoList(Model model){  
//		
//		VideoExample videoExample = new VideoExample();
//		List<Video> videoList = DataAccessManager.getMapper(VideoMapper.class).selectByExample(videoExample);
//		System.out.println(videoList);
//		model.addAttribute("videoList", videoList);
//		return "frontend/list";
//	}
	
	@RequestMapping("/getVideoList")  
    public String getVideoList(Model model){  
		
		VideoExample videoExample = new VideoExample();
		List<Video> videoList = DataAccessManager.getMapper(VideoMapper.class).selectByExample(videoExample);
		System.out.println(videoList);
		model.addAttribute("videoList", videoList);
		return "frontend/videos";
	}
	
	@RequestMapping("/ckplayer")  
	 public String viedo(Model model, Video video) {


        model.addAttribute("videoInfo", video.getPath());
        model.addAttribute("videoname", video.getVersion());
        System.out.println("video:"+video.getPath());
        return "frontend/ckplayer";
    }
}
