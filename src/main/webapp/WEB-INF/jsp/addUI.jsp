<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
   <link href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
   <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.fr.js"></script>
</head>
<body>
	<form class="form-horizontal" method="POST" 
		action="${pageContext.request.contextPath}/product">
	  <div class="form-group">
	    <label for="inputEmail3" class="col-sm-2 control-label">标题</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" name="title" id="inputEmail3" placeholder="请输入标题">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">价格</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" name="price" id="inputPassword3" placeholder="请输入价格">
	    </div>
	  </div>
	  
	  <div class="form-group">
                <label for="dtp_input1" class="col-sm-2 control-label">上架时间</label>
                <div class="input-group date form_datetime col-sm-6" data-date="" data-date-format="yyyy-mm-dd hh:ii:ss" data-link-field="dtp_input1">
                    <input class="form-control" name="shelftime" size="16" type="text" value="" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                </div>
				<input type="hidden" id="dtp_input1" value="" /><br/>
            </div>
	  
	   <div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">描述</label>
	    <div class="col-sm-10">
	      <textarea class="form-control" name="descs" rows="3" id="inputPassword3"></textarea>
	    </div>
	  </div>
	  <div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	      <div class="checkbox">
	        <label>
	          <input type="checkbox" name="isshelf" value="1"> 是否下架
	        </label>
	      </div>
	    </div>
	  </div>
	  <div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	      <div class="checkbox">
	        <label>
	          <input type="checkbox" name="iscount" value="1"> 是否折扣
	        </label>
	      </div>
	    </div>
	  </div>
	  <div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	      <button type="submit" class="btn btn-default">新增</button>
	    </div>
	  </div>
	</form>
	
	<script type="text/javascript">
	  $('.form_datetime').datetimepicker({
	        //language:  'fr',
	        weekStart: 1,
	        todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			forceParse: 0,
	        showMeridian: 1
	    });
	</script>
</body>
</html>