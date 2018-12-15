package com.mrliu.extend.mapper;

import java.util.List;

import com.mrliu.generate.pojo.Admin;

public interface AdminExtendMapper {
   
	List queryAdminList(String username);
}