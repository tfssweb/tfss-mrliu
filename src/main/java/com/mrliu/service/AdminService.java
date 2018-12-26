package com.mrliu.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mrliu.generate.mapper.AdminInfoMapper;
import com.mrliu.generate.pojo.AdminInfo;
import com.mrliu.generate.pojo.AdminInfoExample;
import com.mrliu.support.dao.DataAccessManager;

@Transactional
@Service
public class AdminService {

	/**
	 * 获取所有admin信息
	 * @return
	 */
	public List<AdminInfo> getAllAdmin(){
		
		AdminInfoExample adminInfoExample = new AdminInfoExample();
		
		List<AdminInfo> adminList = DataAccessManager.getMapper(AdminInfoMapper.class).selectByExample(adminInfoExample);
		System.out.println(adminList);
		
		return adminList;
	}
	
}
