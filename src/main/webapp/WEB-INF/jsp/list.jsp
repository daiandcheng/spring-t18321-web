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
   	<a href="${pageContext.request.contextPath}/product" class="btn btn-info">新增</a>
	<div class="bs-example" data-example-id="bordered-table">
    <table class="table table-bordered">
      <thead>
        <tr>
          <th>id</th>
          <th>title</th>
          <th>price</th>
          <th>descs</th>
          <th>shelftime</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody>
      	<c:forEach var="p" items="${productList}">
		 <tr>
          <th scope="row"><input type="checkbox" name="ids" value="${p.id }"></th>
          <td>${p.title }</td>
          <td>${p.price }</td>
          <td>${p.descs }</td>
          <td>
          	<fmt:formatDate value="${p.shelftime }" pattern="yyyy-MM-dd HH:mm:ss"/>
          </td>
          <td>
          	<a href="${pageContext.request.contextPath}/product/${p.id}" class="btn btn-sm btn-info">修改</a>
          	
          	<%-- <a href="${pageContext.request.contextPath}/productDel/${p.id}" class="btn btn-sm btn-info">删除</a> --%>
           <a href="javascript:delFun('${p.id }')" 
          		class="btn btn-sm btn-info">删除</a>
          </td>
          
        </tr>
		</c:forEach>
       
      </tbody>
    </table>
   <form action="" id="myForm" method="POST">
   		<input type="hidden" name="_method" value="DELETE"/>
   </form>
  </div>
  
  </form>
  <script type="text/javascript">
  	function delFun(id) {
  		var _form = $("#myForm");
  		_form.attr("action","${pageContext.request.contextPath}/product/"+id);
  		_form.get(0).submit();
  	}
  </script>
</body>
</html>