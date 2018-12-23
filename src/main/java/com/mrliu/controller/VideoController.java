package com.mrliu.controller;

import java.util.List;

import org.n3r.idworker.Sid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
//	获取所有视频列表
	@RequestMapping("/getVideoList")  
    public String getVideoList(Model model){  
		
		VideoExample videoExample = new VideoExample();
		List<Video> videoList = DataAccessManager.getMapper(VideoMapper.class).selectByExample(videoExample);
		System.out.println(videoList);
		model.addAttribute("videoList", videoList);
		return "frontend/videos";
	}
	
//	播放
	@RequestMapping("/ckplayer")  
	 public String viedo(Model model, Video video) {

		VideoExample videoExample = new VideoExample();
		videoExample.createCriteria().andVideoIdEqualTo(video.getVideoId());
		Video video2 = DataAccessManager.getMapper(VideoMapper.class).selectByExample(videoExample).get(0);
        model.addAttribute("videoInfo", video2);
        return "frontend/ckplayer";
    }
	
//	查询
	@RequestMapping("/search")  
	public String searchResult(Model model,@RequestParam String keyword) {
		System.out.println(keyword);
		keyword = "%"+keyword+"%";
		VideoExample videoExample = new VideoExample();
		videoExample.createCriteria().andVideoNameLike(keyword);	//根据videoName模糊查询
		videoExample.or().andVideoLabelLike(keyword);				//根据videoLabel模糊查询
		
		List<Video> videoList = DataAccessManager.getMapper(VideoMapper.class).selectByExample(videoExample);
		System.out.println(videoList);
		model.addAttribute("videoList", videoList);
		model.addAttribute("videoSum", videoList.size());
		System.out.println(videoList.size());
		return "frontend/result";
	}
}
