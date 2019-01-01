package com.mrliu.controller;

import java.util.List;

import org.n3r.idworker.Sid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.mrliu.generate.mapper.VideoMapper;
import com.mrliu.generate.pojo.Video;
import com.mrliu.generate.pojo.VideoExample;
import com.mrliu.service.VideoService;
import com.mrliu.support.dao.DataAccessManager;

@Controller   //需要配合视图使用
//@RestController		// @RestController = @Controller + @ResponseBody
//@RequestMapping("/video")
public class VideoController {

	@Autowired
	private VideoService videoService;
	
	@Autowired
	private Sid sid;
	
	@RequestMapping(value = "/")
    public String index() {
        return "redirect:getVideoList";
    }
	
//	获取所有视频列表
	@RequestMapping("/getVideoList")  
    public String getVideoList(Model model){  
		PageHelper.startPage(1, 12);
		List<Video> videoList = videoService.getAllVideo();
		
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
	
	/**
	 * 通过关键字，对video_name video_label进行模糊查询
	 * @param keyword
	 * @return
	 */
	@RequestMapping("/search")  
	public String searchResult(Model model,@RequestParam String keyword) {
		List<Video> videoList = videoService.getVideoByNameOrLabel(keyword);
		System.out.println(videoList);
		model.addAttribute("videoList", videoList);
		model.addAttribute("videoSum", videoList.size());
		System.out.println(videoList.size());
		return "frontend/result";
	}
}
