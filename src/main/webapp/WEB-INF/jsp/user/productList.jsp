<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>网上商城</title>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	</head>

	<body style="width: 80%;margin: auto;">
		<%@ include file="/WEB-INF/jsp/user/head.jsp" %>
		<div>
			<div class="list-group pull-left" style="width: 220px;">
				<s:iterator value="#session.categoryList" var="category">
					<a href="${pageContext.request.contextPath }/product_findByCid?cid=<s:property value='#category.id'/>" class="list-group-item active">
						<s:property value="#category.name"/>
					</a>
					<s:iterator value="#category.secondCategories" var="secondCateogry">
						<a href="${pageContext.request.contextPath }/product_findByCsid?csid=<s:property value='#secondCateogry.id'/>" class="list-group-item">
							<s:property value="#secondCateogry.name"/>
						</a>
					</s:iterator>
				</s:iterator>
			</div>
			
			<div class="container" style="text-align: center">
				<div class="row">
					<s:iterator value="pageBean.pageItems" var="product">
						<div class="col-xs-2">
							<a href="${pageContext.request.contextPath }/product_findByPid.action?id=<s:property value='#product.id'/>">
								<img width="160" src="${pageContext.request.contextPath }<s:property value="#product.image"/>" class="img-rounded" />
								<div class="text-info"><s:property value="#product.name"/></div>
								<div class="text-primary">商城价：<s:property value="#product.shop_price"/>￥</div>
							</a>
						</div>
					</s:iterator>
				</div>
			</div>
			<s:if test="cid != null">
				<ul class="pagination" style="float: right;">
					<li>
						<s:if test="pageBean.currentPage != 1">
							<a href="${pageContext.request.contextPath }/product_findByCid?cid=<s:property value='cid'/>&page=1" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</s:if>
					</li>
					<s:iterator value="pageBean.pageBar" var="page">
						<li>
							<s:if test="#page == pageBean.currentPage">
								<a style="color: black"><s:property value="#page"/></a> 
							</s:if>
							<s:else>
								<a href="${pageContext.request.contextPath }/product_findByCid?cid=<s:property value='cid'/>&page=<s:property value='#page'/>">
									<s:property value="#page"/>
								</a>
							</s:else>
						</li>
					</s:iterator>
					<li>
						<s:if test="pageBean.currentPage != pageBean.totalPage">
							<a href="${pageContext.request.contextPath }/product_findByCid?cid=<s:property value='cid'/>&page=<s:property value='pageBean.totalPage'/> " aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</s:if>
					</li>
				</ul>
			</s:if>
			<s:else>
				<ul class="pagination" style="float: right;">
					<li>
						<s:if test="pageBean.currentPage != 1">
							<a href="${pageContext.request.contextPath }/product_findByCsid?csid=<s:property value='csid'/>&page=1" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</s:if>
					</li>
					<s:iterator value="pageBean.pageBar" var="page">
						<li>
							<s:if test="#page == pageBean.currentPage">
								<a style="color: black"><s:property value="#page"/></a> 
							</s:if>
							<s:else>
								<a href="${pageContext.request.contextPath }/product_findByCsid?csid=<s:property value='csid'/>&page=<s:property value='#page'/>">
									<s:property value="#page"/>
								</a>
							</s:else>
						</li>
					</s:iterator>
					<li>
						<s:if test="pageBean.currentPage != pageBean.totalPage">
							<a href="${pageContext.request.contextPath }/product_findByCsid?csid=<s:property value='csid'/>&page=<s:property value='pageBean.totalPage'/> " aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</s:if>
					</li>
				</ul>
			</s:else>
		</div>
	</body>

</html>