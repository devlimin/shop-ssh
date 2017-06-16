package com.shop.category.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.FetchMode;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Property;
import org.hibernate.sql.JoinType;
import org.springframework.stereotype.Service;

import com.core.service.impl.BaseServiceImpl;
import com.shop.category.dao.CategoryDao;
import com.shop.category.entity.Category;
import com.shop.category.service.CategoryService;

import net.sf.ehcache.search.expression.Criteria;

@Service("categoryService")
public class CategoryServiceImpl extends BaseServiceImpl<Category> implements CategoryService {
	
	private CategoryDao categoryDao;

	@Resource
	public void setCategoryDao(CategoryDao categoryDao) {
		super.setBaseDao(categoryDao);
		this.categoryDao = categoryDao;
	}

	@Override
	public List<Category> selectAllWithSecond() {
		DetachedCriteria criteria = DetachedCriteria.forClass(Category.class)
									.createCriteria("secondCategories", JoinType.LEFT_OUTER_JOIN)
									.setResultTransformer(DetachedCriteria.DISTINCT_ROOT_ENTITY);
		return categoryDao.selectAllByQBC(criteria);
	}
}
