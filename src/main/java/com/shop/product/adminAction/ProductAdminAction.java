package com.shop.product.adminAction;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.core.entity.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shop.product.entity.Product;
import com.shop.product.service.ProductService;
import com.shop.secondCategory.entity.SecondCategory;
import com.shop.secondCategory.service.SecondCategoryService;

@Controller
@Scope("prototype")
public class ProductAdminAction extends ActionSupport implements ModelDriven<Product> {
	private static final long serialVersionUID = 3750144032190471476L;

	private Product product = new Product();

	@Override
	public Product getModel() {
		return product;
	}

	private Integer page = 1;

	@Resource
	private ProductService productService;

	@Resource
	private SecondCategoryService secondCategoryService;

	private File upload;
	private String uploadFileName;
	private String uploadContentType;

	// 查询所有的商品:
	public String findAll() {
		PageBean<Product> pageBean = productService.selectPage(page, 10);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAll";
	}

	// 跳转到添加页面的方法:
	public String addPage() {
		List<SecondCategory> scList = secondCategoryService.selectAll();
		ActionContext.getContext().getValueStack().set("scList", scList);
		return "addPageSuccess";
	}

	private void uploadProductImage() throws Exception{
		// 将商品图片上传到服务器上.
		// 获得上传图片的服务器端路径.
		String path = ServletActionContext.getServletContext().getRealPath("/products");
		// 创建文件类型对象:
		uploadFileName = UUID.randomUUID().toString().replaceAll("-", "") + uploadFileName;
		File diskFile = new File(path + "/" + uploadFileName);
		// 文件上传:
		FileUtils.copyFile(upload, diskFile);

		product.setImage("/products" + "/" + uploadFileName);
	}

	// 保存商品的方法:
	public String save() throws Exception {
		product.setPdate(new Date());
		if (upload != null) {
			uploadProductImage();
		}
		productService.save(product);
		return "saveSuccess";
	}

	// 删除商品的方法:
	public String delete() throws IOException {
		// 根据id查询商品信息
		product = productService.selectById(product.getId());
		// 删除商品的图片:
		String path = ServletActionContext.getServletContext().getRealPath("/" + product.getImage());
		File file = new File(path);
		if(file.exists()) {
			file.delete();
		}
		// 删除数据库中商品记录:
		productService.delete(product.getId());
		// 页面跳转
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().println("success");
		return NONE;
	}

	// 编辑商品的方法
	public String edit() {
		// 根据商品id查询商品信息
		ActionContext.getContext().getValueStack().pop();
		product = productService.selectById(product.getId());
		ActionContext.getContext().getValueStack().push(product);
		// 查询所有二级分类
		List<SecondCategory> csList = secondCategoryService.selectAll();
		ActionContext.getContext().getValueStack().set("csList", csList);
		// 页面跳转到编辑页面:
		return "editSuccess";
	}

	// 修改商品的方法
	public String update() throws Exception {
		// 将信息修改到数据库
		product.setPdate(new Date());

		// 上传:
		if (upload != null) {
			uploadProductImage();
		}
		productService.update(product);
		// 页面跳转
		return "updateSuccess";
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}
}
