package com.mrliu.controller.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mrliu.common.utils.PageList;
import com.mrliu.generate.mapper.VideoMapper;
import com.mrliu.generate.pojo.Video;
import com.mrliu.generate.pojo.VideoExample;
import com.mrliu.service.VideoService;
import com.mrliu.support.dao.DataAccessManager;

@RunWith(SpringRunner.class)
//@ContextConfiguration(locations = {"application.properties"}) 
@SpringBootTest
public class TfssMrliuApplicationTests {

	@Autowired
	private VideoService videoService;
	
	@Test
	public void contextLoads() {
//		测试分页
		Page<Object> startPage = PageHelper.startPage(1, 3);
		
		VideoExample videoExample = new VideoExample();
		List<Video> videos = DataAccessManager.getMapper(VideoMapper.class).selectByExample(videoExample);	
		System.out.println(videos);
		
		PageInfo<Video> v = new PageInfo<>(videos);
		
		System.out.println(startPage.toPageInfo().getTotal());
		System.out.println(v.isHasNextPage());
		System.out.println(v);
		
		
	}

}
