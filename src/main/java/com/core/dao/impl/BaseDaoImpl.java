package com.core.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;

import com.core.dao.BaseDao;

public class BaseDaoImpl<T> implements BaseDao<T> {
	
	protected SessionFactory sessionFactory;//与子类共享
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	private Class clazz;
	public BaseDaoImpl() {
		ParameterizedType pt = (ParameterizedType) this.getClass().getGenericSuperclass();
		clazz = (Class) pt.getActualTypeArguments()[0];//得到 泛型 类型参数
	}
	
	@Override
	public void save(T entity) {
		Session session = sessionFactory.getCurrentSession();
		session.save(entity);
	}

	@Override
	public void delete(Serializable id) {
		Session session = sessionFactory.getCurrentSession();
		Object obj = session.get(clazz, id);
		session.delete(obj);
	}

	@Override
	public void update(T entity) {
		Session session = sessionFactory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public T selectById(Serializable id) {
		Session session = sessionFactory.getCurrentSession();
		return (T) session.get(clazz, id);
	}

	@Override
	public List<T> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM "+clazz.getSimpleName()).list();
	}
	@Override
	public long selectCount() {
		Session session = sessionFactory.getCurrentSession();
		return (long) session.createQuery("select count(*) from "+clazz.getSimpleName()).uniqueResult();
	}
	@Override
	public List<T> selectByPage(int currentPage, int pageRow) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM "+clazz.getSimpleName();
		
		return session.createQuery(hql)
				.setFirstResult((currentPage-1)*pageRow)
				.setMaxResults(pageRow)
				.list();
	}
	
	@Override
	public List<T> selectPageByQBC(DetachedCriteria criteria, int currentPage, int pageRow) {
		Session session = getSessionFactory().getCurrentSession();
		return criteria.getExecutableCriteria(session)
				.setFirstResult((currentPage-1)*pageRow)
				.setMaxResults(pageRow)
				.list();
	}

	@Override
	public long selectCountByQBC(DetachedCriteria criteria) {
		Session session = getSessionFactory().getCurrentSession();
		return (long) criteria.getExecutableCriteria(session)
				.uniqueResult();
	}
	@Override
	public T selectByQBC(DetachedCriteria criteria) {
		Session session = getSessionFactory().getCurrentSession();
		return (T) criteria.getExecutableCriteria(session)
				.uniqueResult();
	}
	@Override
	public List<T> selectAllByQBC(DetachedCriteria criteria) {
		Session session = getSessionFactory().getCurrentSession();
		return criteria.getExecutableCriteria(session)
				.list();
	}


}
