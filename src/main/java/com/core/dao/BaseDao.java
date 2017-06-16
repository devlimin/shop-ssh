package com.core.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.shop.product.entity.Product;

public interface BaseDao<T> {
	
	void save(T entity);
	void delete(Serializable id);
	void update(T entity);
	
	T selectById(Serializable id);
	T selectByQBC(DetachedCriteria criteria);
	
	List<T> selectAll();
	List<T> selectAllByQBC(DetachedCriteria criteria);
	
	List<T> selectByPage(int currentPage, int pageRow);
	List<T> selectPageByQBC(DetachedCriteria criteria, int currentPage, int pageRow);
	
	long selectCount();
	long selectCountByQBC(DetachedCriteria criteria);
	
}
