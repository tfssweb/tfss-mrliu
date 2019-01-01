package com.mrliu.common.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

public class PageList {
	public static int PAGE_SIZE = 10;
	public static final int PAGE = 1;
	private int pageSize = 0;
	private int totalSize = 0;
	private int totalPage = 0;
	private int page = 0;
	private int cursor = 0;
	private String parameter = "";
	private List<?> list;

	public void init(int pageSize, int page, int totalSize) {
		PAGE_SIZE = pageSize > 0 ? pageSize : PAGE_SIZE;
		this.pageSize = pageSize > 0 ? pageSize : PAGE_SIZE;
		this.page = page > 0 ? page : PAGE;
		this.totalSize = totalSize > 0 ? totalSize : this.totalSize;
		if (this.totalSize > 0) {
			this.totalPage = (this.totalSize - 1) / this.pageSize + 1;
			this.page = this.page > this.totalPage ? this.totalPage : this.page;
			this.cursor = (this.page - 1) * this.pageSize;
		}
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalSize() {
		return totalSize;
	}

	public void setTotalSize(int totalSize) {
		this.totalSize = totalSize;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getCursor() {
		return cursor;
	}

	public void setCursor(int cursor) {
		this.cursor = cursor;
	}

	public String getParameter() {
		return parameter;
	}

	public void setParameter(String parameter) {
		this.parameter = parameter;
	}

	public List<?> getList() {
		return list;
	}

	public void setList(List<?> list) {
		this.list = list;
	}

	public String encode(String s) {
		try {
			return URLEncoder.encode(s, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return "";
		}
	}

}
