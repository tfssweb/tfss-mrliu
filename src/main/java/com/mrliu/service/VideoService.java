package com.mrliu.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.mrliu.generate.mapper.VideoMapper;
import com.mrliu.generate.pojo.Video;
import com.mrliu.generate.pojo.VideoExample;
import com.mrliu.support.dao.DataAccessManager;

@Transactional
@Service
public class VideoService {

	/***
	 * 获取所有video信息
	 * @return
	 */
	public List<Video> getAllVideo(){
		VideoExample videoExample = new VideoExample();
		List<Video> videoList = DataAccessManager.getMapper(VideoMapper.class).selectByExample(videoExample);
		System.out.println(videoList);
		return videoList;
	}
	
	/**
	 * 通过关键字，对video_name video_label进行模糊查询
	 * @param keyword
	 * @return
	 */
	public List<Video> getVideoByNameOrLabel(@RequestParam String keyword){
		
		System.out.println(keyword);
		keyword = "%"+keyword+"%";
		VideoExample videoExample = new VideoExample();
		videoExample.createCriteria().andVideoNameLike(keyword);	//根据videoName模糊查询
		videoExample.or().andVideoLabelLike(keyword);				//根据videoLabel模糊查询
		
		List<Video> videoList = DataAccessManager.getMapper(VideoMapper.class).selectByExample(videoExample);
		
		return videoList;
	}
	
}
