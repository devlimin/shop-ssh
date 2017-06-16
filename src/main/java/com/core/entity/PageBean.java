package com.core.entity;

import java.util.ArrayList;
import java.util.List;

public class PageBean<T> {
	private long totalRow;//总记录数
	private int pageRow = 10;//每页记录数
	private int currentPage = 1;//当前页
	private int totalPage;//总页数
	private List<T> pageItems = new ArrayList<T>();//当前页记录
	private int[] pageBar;//分页栏
	private int pageBarSize = 10;//分页栏长度
	
	public PageBean() {
		super();
	}
	public PageBean(int currentPage, int pageRow) {
		this.currentPage = currentPage;
		this.pageRow = pageRow;
	}
	public long getTotalRow() {
		return totalRow;
	}
	public void setTotalRow(long totalRow) {
		this.totalRow = totalRow;
	}
	public int getPageRow() {
		return pageRow;
	}
	public void setPageRow(int pageRow) {
		this.pageRow = pageRow;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalPage() {
		this.totalPage = (int) ((totalRow % pageRow) == 0 ? (totalRow / pageRow) : (totalRow / pageRow + 1));
		return totalPage;
	}
	public List<T> getPageItems() {
		return pageItems;
	}
	public void setPageItems(List<T> pageItems) {
		this.pageItems = pageItems;
	}
	public int[] getPageBar() {
		int startPage;
		int endPage;
		int pagebar[] = null;
		if(getTotalPage() <= getPageBarSize()) {
			pagebar = new int[getTotalPage()];
			startPage = 1;
			endPage = getTotalPage();
		} else {
			pagebar = new int[getPageBarSize()];
			if(getPageBarSize() % 2 == 1) {
				startPage = getCurrentPage()-getPageBarSize()/2;
				endPage = getCurrentPage()+getPageBarSize()/2;
			} else {
				startPage = getCurrentPage()-getPageBarSize()/2;
				endPage = getCurrentPage()+getPageBarSize()/2-1;
			}
			if(startPage < 1) {
				startPage = 1;
				endPage = getPageBarSize();
			}
			if(endPage > getTotalPage()) {
				endPage = getTotalPage();
				startPage = endPage-getPageBarSize()+1;
			}
		}
		int index = 0;
		for(int i = startPage; i <= endPage; i++) {
			pagebar[index++] = i;
		}
		this.pageBar = pagebar;
		return pageBar;
	}
	public int getPageBarSize() {
		return pageBarSize;
	}
	public void setPageBarSize(int pageBarSize) {
		this.pageBarSize = pageBarSize;
	}
}
