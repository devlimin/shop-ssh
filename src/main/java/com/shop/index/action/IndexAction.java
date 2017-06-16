package com.shop.index.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.shop.category.entity.Category;
import com.shop.category.service.CategoryService;
import com.shop.product.entity.Product;
import com.shop.product.service.ProductService;

@Controller
@Scope(scopeName="prototype")
public class IndexAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	
	@Resource
	private CategoryService categoryService;
	@Resource
	private ProductService productService;
	
	public String execute() {
		List<Category> cList = categoryService.selectAllWithSecond();
		ActionContext.getContext().getSession().put("categoryList", cList);
		// 查询热门商品:
		List<Product> hList = productService.selectHot();
		// 保存到值栈中:
		ActionContext.getContext().getValueStack().set("hotProductList", hList);
		// 查询最新商品:
		List<Product> nList = productService.selectNew();
		// 保存到值栈中:
		ActionContext.getContext().getValueStack().set("newProductList", nList);
		return "index";
	}
}
