package com.core.service;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.core.entity.PageBean;

public interface BaseService<T> {
	
	void save(T entity);
	void delete(Serializable id);
	void update(T entity);
	
	T selectById(Serializable id);
	
	List<T> selectAll();
	long selectCount();
	PageBean<T> selectPage(int current, int pageSize);
	
	PageBean<T> selectPageByQBC(DetachedCriteria criteria, int current, int pageSize);
}
