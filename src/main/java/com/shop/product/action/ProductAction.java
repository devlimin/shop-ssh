package com.shop.product.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.core.entity.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shop.category.service.CategoryService;
import com.shop.product.entity.Product;
import com.shop.product.service.ProductService;

@Controller
@Scope(scopeName="prototype")
public class ProductAction extends ActionSupport 
							implements ModelDriven<Product> {
	private static final long serialVersionUID = 6278485886103425462L;
	
	@Resource
	private ProductService productService;
	@Resource
	private CategoryService categoryService;
	private Product product;
	private Integer cid;//分类id
	private Integer csid;//二级分类id
	private int page = 1;
	@Override
	public Product getModel() {
		product = new Product();
		return product;
	}
	
	//根据商品ID进行商品查询
	public String findByPid() {
		product = productService.selectById(product.getId());
		return "findByPid";
	}
	
	//根据分类id分页查询
	public String findByCid() {
		PageBean<Product> pageBean = new PageBean<Product>();
		pageBean.setPageRow(8);
		pageBean = productService.selectPageByCategoryId(cid, page, pageBean.getPageRow());
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findByCid";
	}

	//根据二级分类id分页查询
	public String findByCsid() {
		PageBean<Product> pageBean = new PageBean<Product>();
		pageBean.setPageRow(8);
		pageBean = productService.selectPageBySecondCategoryId(csid, page, pageBean.getPageRow());
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findByCsid";
	}
	
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public Integer getCsid() {
		return csid;
	}
	public void setCsid(Integer csid) {
		this.csid = csid;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
}
