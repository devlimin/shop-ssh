package com.core.service.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.core.dao.BaseDao;
import com.core.entity.PageBean;
import com.core.service.BaseService;

public class BaseServiceImpl<T> implements BaseService<T> {

	private BaseDao<T> baseDao;
	public BaseDao<T> getBaseDao() {
		return baseDao;
	}
	public void setBaseDao(BaseDao<T> baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public void save(T entity) {
		baseDao.save(entity);
	}

	@Override
	public void delete(Serializable id) {
		baseDao.delete(id);
	}

	@Override
	public void update(T entity) {
		baseDao.update(entity);
	}

	@Override
	public T selectById(Serializable id) {
		return baseDao.selectById(id);
	}

	@Override
	public List<T> selectAll() {
		return baseDao.selectAll();
	}

	@Override
	public long selectCount() {
		return baseDao.selectCount();
	}
	@Override
	public PageBean<T> selectPage(int currentPage, int pageRow) {
		List<T> list = baseDao.selectByPage(currentPage, pageRow);
		long totalRow = selectCount();
		PageBean<T> pageBean = new PageBean<T>(currentPage, pageRow);
		pageBean.setPageItems(list);
		pageBean.setTotalRow(totalRow);
		return pageBean;
	}
	@Override
	public PageBean<T> selectPageByQBC(DetachedCriteria criteria, int currentPage, int pageSize) {
		baseDao.selectPageByQBC(criteria, currentPage, pageSize);
		return null;
	}
	
	

}
