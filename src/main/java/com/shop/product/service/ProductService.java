package com.shop.product.service;

import java.util.List;

import com.core.entity.PageBean;
import com.core.service.BaseService;
import com.shop.product.entity.Product;

public interface ProductService extends BaseService<Product> {
	
	List<Product> selectHot();
	List<Product> selectNew();
	PageBean<Product> selectPageByCategoryId(Integer categoryId, int currentPage, int pageRow);
	PageBean<Product> selectPageBySecondCategoryId(Integer secoondcCtegoryId, int currentPage, int pageRow);
}
