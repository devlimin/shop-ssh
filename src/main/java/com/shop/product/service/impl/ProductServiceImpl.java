package com.shop.product.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.core.entity.PageBean;
import com.core.service.impl.BaseServiceImpl;
import com.shop.product.dao.ProductDao;
import com.shop.product.entity.Product;
import com.shop.product.service.ProductService;

@Service("productService")
public class ProductServiceImpl extends BaseServiceImpl<Product> implements ProductService {

	private ProductDao productDao;
	@Resource
	public void setProductDao(ProductDao productDao) {
		super.setBaseDao(productDao);
		this.productDao = productDao;
	}

	@Override
	public List<Product> selectHot() {
		DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);
		criteria.add(Restrictions.eq("is_hot", 1));
		criteria.addOrder(Order.desc("pdate"));
		return productDao.selectPageByQBC(criteria, 1, 12);
	}

	@Override
	public List<Product> selectNew() {
		DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);
		criteria.addOrder(Order.desc("pdate"));
		return productDao.selectPageByQBC(criteria, 1, 12);
	}

	@Override
	public PageBean<Product> selectPageByCategoryId(Integer categoryId, int currentPage, int pageRow) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Product.class)
				.createAlias("secondCategory", "secondCategory")
				.createAlias("secondCategory.category", "category")
				.add(Restrictions.eq("category.id", categoryId));
		List<Product> list = productDao.selectPageByQBC(criteria, currentPage, pageRow);
		
		criteria = DetachedCriteria.forClass(Product.class)
				.createAlias("secondCategory", "secondCategory")
				.createAlias("secondCategory.category", "category")
				.add(Restrictions.eq("category.id", categoryId))
				.setProjection(Projections.projectionList()
				.add(Projections.rowCount()));
		long totalRow = productDao.selectCountByQBC(criteria);
		PageBean<Product> pageBean = new PageBean<>(currentPage, pageRow);
		pageBean.setTotalRow(totalRow);
		pageBean.setPageItems(list);
		return pageBean;
	}

	@Override
	public PageBean<Product> selectPageBySecondCategoryId(Integer secoondcCtegoryId, int currentPage, int pageRow) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Product.class)
				.createAlias("secondCategory", "secondCategory")
				.add(Restrictions.eq("secondCategory.id", secoondcCtegoryId));
		List<Product> list = productDao.selectPageByQBC(criteria, currentPage, pageRow);
		
		criteria = DetachedCriteria.forClass(Product.class)
				.createAlias("secondCategory", "secondCategory")
				.add(Restrictions.eq("secondCategory.id", secoondcCtegoryId))
				.setProjection(Projections.projectionList()
				.add(Projections.rowCount()));
		long totalRow = productDao.selectCountByQBC(criteria);
		PageBean<Product> pageBean = new PageBean<>(currentPage, pageRow);
		pageBean.setTotalRow(totalRow);
		pageBean.setPageItems(list);
		return pageBean;
	}

}
