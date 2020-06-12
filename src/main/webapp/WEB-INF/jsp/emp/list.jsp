<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
   <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
	 	<div class="row">
	 		<div class="col-md-12">
	 			<h1>员工的crud操作</h1>
	 		</div>
	 	</div>
	 	<div class="row">
	 		<div class="col-md-4 col-md-offset-8">
	 			<button class="btn btn-info">新增</button>
	 			<button class="btn btn-primary">批量删除按钮</button>
	 		</div>
	 	</div>
	 	<div class="row">
	 		<div class="col-md-12">
	 			<table class="table table-bordered">
			      <thead>
			        <tr>
			          <th>#</th>
			          <th>empName</th>
			          <th>department</th>
			          <th>empEmail</th>
			          <th>empSex</th>
			          <th>empBirthday</th>
			          <th>操作</th>
			        </tr>
			      </thead>
			      <tbody>
			       <c:forEach var="emp" items="${pageInfo.list }">
				        <tr>
				          <th scope="row">${emp.empId }</th>
				          <td>${emp.empName }</td>
				          <td>${emp.department.deptName }</td>
				          <td>${emp.empEmail }</td>
				          <td>${emp.empSex=="F"?"男":"女" }</td>
				          <td>${emp.empBirthday }</td>
				          <td>
				          	<button class="btn btn-info">修改</button>
	 						<button class="btn btn-primary">删除</button>
				          </td>
				        </tr>
			        </c:forEach>
			      </tbody>
			    </table>
	 		</div>
	 	</div>
	 	<div class="row">
	 		 <div class="col-md-6">
	 		 	当前${pageInfo.pageNum}页/总共${pageInfo.pages}页，每页显示${pageInfo.pageSize}条数据,总共${pageInfo.total}条数据
	 		 </div>
	 		 <div class="col-md-6">
	 		 	<nav aria-label="Page navigation">
				  <ul class="pagination">
				    <c:if test="${pageInfo.isFirstPage }">
				    	<li class="disabled"><a href="javascript:void(0);">首页</a></li>
				    </c:if>
				    <c:if test="${!pageInfo.isFirstPage }">
				    	<li><a href="${pageContext.request.contextPath}/emp/list?pg=1">首页</a></li>
				    </c:if>
				    <c:if test="${pageInfo.hasPreviousPage }">
					    <li>
					      <a href="${pageContext.request.contextPath}/emp/list?pg=${pageInfo.pageNum-1}" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
				    </c:if>
				     <c:if test="${!pageInfo.hasPreviousPage }">
					    <li class="disabled">
					      <a href="javascript:void(0);" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
				    </c:if>
				    <c:forEach var="p" items="${pageInfo.navigatepageNums }">
				     <c:if test="${p==pageInfo.pageNum }">
				     	<li class="active"><a href="javascript:void(0);">${p }<span class="sr-only">(current)</span></a></li>
				     </c:if>
				     <c:if test="${p!=pageInfo.pageNum }">
				     	<li><a href="${pageContext.request.contextPath}/emp/list?pg=${p}">${p }</a></li>
				     </c:if>
				   	 
				    </c:forEach>
				    <c:if test="${pageInfo.hasNextPage }">
					    <li>
					      <a href="${pageContext.request.contextPath}/emp/list?pg=${pageInfo.pageNum+1}" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
				    </c:if>
				     <c:if test="${!pageInfo.hasNextPage }">
					    <li class="disabled">
					      <a href="javascript:void(0);" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
				    </c:if>
				    <c:if test="${pageInfo.isLastPage }">
				    	<li class="disabled"><a href="javascript:void(0);">未页</a></li>
				    </c:if>
				     <c:if test="${!pageInfo.isLastPage }">
				    	<li><a href="${pageContext.request.contextPath}/emp/list?pg=${pageInfo.pages}">未页</a></li>
				    </c:if>
				  </ul>
				</nav>
	 		 </div>
	 	</div>
	</div>
</body>
</html>