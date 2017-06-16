package com.shop.secondCategory.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.core.service.impl.BaseServiceImpl;
import com.shop.secondCategory.dao.SecondCategoryDao;
import com.shop.secondCategory.entity.SecondCategory;
import com.shop.secondCategory.service.SecondCategoryService;

@Service("secondCategoryService")
public class SecondCategoryServiceImpl extends BaseServiceImpl<SecondCategory> implements SecondCategoryService {
	
	private SecondCategoryDao secondCategoryDao;
	@Resource
	public void setSecondCategoryDao(SecondCategoryDao secondCategoryDao) {
		super.setBaseDao(secondCategoryDao);
		this.secondCategoryDao = secondCategoryDao;
	}
	
}
