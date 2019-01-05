package com.mrliu.common.utils;

/**
 * 分页用基础信息
 *
 */
public class PaginationDTO {
	
	//pagenum无效时的默认值（默认=1，第一页）
	public static final int DEFAULT_PAGE_NUM = 1;
	//pagesize无效时的默认值(默认获取1000条)
	public static final int DEFAULT_PAGE_SIZE = 1000;
	
	private Integer pageSize;
	private Integer pageNum;
	private long totalNum;

	public PaginationDTO(Integer pageSize, Integer pageNum) {
		this.pageSize = pageSize;
		this.pageNum = pageNum;
	}

	public int getSkipResults() {
		return isParamValid() ? pageSize * (pageNum - 1) : 0;
	}

	public int getMaxResults() {
		return isParamValid() ? pageSize * pageNum : 999;
	}
	
	public int getFixedPageNum() {
		//pagenum=null or 不大于>0 时，认为无效
		return isParamValid() ? pageNum : DEFAULT_PAGE_NUM;
	}

	public int getFixedPageSize() {
		//pagesize=null or 不大于>0 时，认为无效
		return isParamValid() ? pageSize : DEFAULT_PAGE_SIZE;
	}
	
	private boolean isParamValid() {
		return pageSize != null && pageSize.intValue() > 0 && pageNum != null
				&& pageNum.intValue() > 0;
	}

	public long getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(long totalNum) {
		this.totalNum = totalNum;
	}
	
	
}
