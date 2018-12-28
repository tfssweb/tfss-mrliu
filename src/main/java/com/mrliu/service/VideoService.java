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
//		videoExample.setOrderByClause("video_uptime desc,video_id asc");
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
	
	/**
	 * 添加媒体
	 * @param videoName
	 * @param videoUrl
	 * @param videoPattern
	 * @param videoLabel
	 * @param videoInfo
	 * @param videoWeight
	 */
	public void addVideo(@RequestParam String videoName,
						@RequestParam String videoUrl,
						@RequestParam String videoPattern,
						@RequestParam String videoLabel,
						@RequestParam String videoInfo,
						@RequestParam Integer videoWeight){
		
		Video video = new Video();
		video.setVideoName(videoName);
		video.setVideoUrl(videoUrl);
		video.setVideoPattern(videoPattern);
		video.setVideoInfo(videoInfo);
		video.setVideoWeight(videoWeight);
		
		DataAccessManager.getMapper(VideoMapper.class).insertSelective(video);
		
	}
	
	/**
	 * 根据videoId删除媒体
	 * @param videoId
	 */
	public void deleteVideoByVideoId(@RequestParam Integer videoId){
		DataAccessManager.getMapper(VideoMapper.class).deleteByPrimaryKey(videoId);
	}
}
