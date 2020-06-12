<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    
	<h1 align="center">火山小视频登录</h1>
	<p align="center" style="color:red;">
		<c:if test="${not empty msg}">${msg }</c:if>
	</p>
	<form action="${pageContext.request.contextPath}/login" style="text-align: center;" method="post">
		用户名:<input type="text" name="userName"><br/>
		密码:<input type="text" name="userPwd"><br/>
		<input type="submit" value="登录"/>
	</form>
	<p align="center">	
	  <a>拍视频能赚钱火山小视频</a>
	</p>
</body>
</html>