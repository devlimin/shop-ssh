package com.shop.category.service;

import java.util.List;

import com.core.service.BaseService;
import com.shop.category.entity.Category;

public interface CategoryService extends BaseService<Category> {

	List<Category> selectAllWithSecond();

}
