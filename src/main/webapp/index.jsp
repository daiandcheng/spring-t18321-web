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
	 			<button class="btn btn-info" id="addEmpUI" data-toggle="modal">新增</button>
	 			<button class="btn btn-primary" id="batchDelete">批量删除按钮</button>
	 		</div>
	 	</div>
	 	<div class="row">
	 		<div class="col-md-12">
	 			<table class="table table-bordered">
			      <thead>
			        <tr>
			          <th><input type="checkbox" id="ckAll" onclick="$('input[name=empId]').prop('checked',this.checked);"></th>
			          <th>empName</th>
			          <th>department</th>
			          <th>empEmail</th>
			          <th>empSex</th>
			          <th>empBirthday</th>
			          <th>操作</th>
			        </tr>
			      </thead>
			      <tbody id="empData">
			      
			      </tbody>
			    </table>
	 		</div>
	 	</div>
	 	<div class="row">
	 		 <div class="col-md-6" id="empPageInfo">
	 		 	
	 		 </div>
	 		 <div class="col-md-6" id="empPages">
	 		 	
				  
	 		 </div>
	 	</div>
	</div>
	
	<!-- 这是新增窗口 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">员工新增</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal" id="myEmpData">
			  <div class="form-group">
			    <label for="input_empName" class="col-sm-2 control-label">empName</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="empName" id="input_empName" placeholder="empName">
			      <span id="helpBlock2" class="help-block"></span>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="input_empEmail" class="col-sm-2 control-label">empEmail</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="empEmail" id="input_empEmail" placeholder="empEmail">
			      <span id="helpBlock3" class="help-block"></span>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="input_empBirthday" class="col-sm-2 control-label">empBirthday</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="empBirthday" id="input_empBirthday" placeholder="empBirthday">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="col-sm-2 control-label">empSex</label>
			    <div class="col-sm-10">
			     	<label class="radio-inline">
					  <input type="radio" name="empSex" id="inlineRadio1" value="M" checked="checked"> 男
					</label>
					<label class="radio-inline">
					  <input type="radio" name="empSex" id="inlineRadio2" value="F"> 女
					</label>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="col-sm-2 control-label">department</label>
			    <div class="col-sm-4">
			     	<select class="form-control" name="deptId" id="selectDept">
					  
					</select>
			    </div>
			  </div>
			 
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="btnEmpSave">保存</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 这是修改窗口 -->
	<div class="modal fade" id="myEditModal" tabindex="-1" role="dialog" aria-labelledby="myEditModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myEditModalLabel">员工修改</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal" id="myEditEmpData">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">empName</label>
			    <div class="col-sm-10">
			      <p class="form-control-static" id="input_edit_empName"></p>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="input_edit_empEmail" class="col-sm-2 control-label">empEmail</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="empEmail" id="input_edit_empEmail" placeholder="empEmail">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="input_edit_empBirthday" class="col-sm-2 control-label">empBirthday</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="empBirthday" id="input_edit_empBirthday" placeholder="empBirthday">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="col-sm-2 control-label">empSex</label>
			    <div class="col-sm-10">
			     	<label class="radio-inline">
					  <input type="radio" name="empSex"  value="M" checked="checked"> 男
					</label>
					<label class="radio-inline">
					  <input type="radio" name="empSex"  value="F"> 女
					</label>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="col-sm-2 control-label">department</label>
			    <div class="col-sm-4">
			     	<select class="form-control" name="deptId" id="selectEditDept">
					  
					</select>
			    </div>
			  </div>
			 
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="btnEditEmpSave">修改</button>
	      </div>
	    </div>
	  </div>
	</div>
	<script type="text/javascript">
		var rowNumber,currentPage ;// 数据的总行数
		$(function(){
			gotoPage(1);
		});
		function gotoPage(pg) {
			$.ajax({
			   type: "GET",
			   url: "${pageContext.request.contextPath}/emp/list",
			   data: "pg="+pg,
			   dataType: "json",
			   success: function(data){
				   // 准备页面显示的数据
				   addEmpsData(data);
				   // 准备分详情
				   addPageInfo(data);
				   // 准备页码数据
				   addPages(data);
			   }
			});
		}
		// 给批量删除按钮绑定一个点击事情
		$("#batchDelete").click(function(){
			var _emps = $("input[name=empId]:checked") ;
			var _len = _emps.length ;
			if(_len>0) {
				// 定义一个空数组
				var _empNames = [] ;
				var _empIds =[] ;
				// 要获取你选择行的empName做提示信息
				$.each(_emps,function(index,item){
					_empNames.push($(this).parent().next().text());
					_empIds.push($(this).val());
				});
				
				// 给一个提示信息，你确认要删除的提示信息
				var _empJoinNames = _empNames.join(',') ;
				
				if(window.confirm("你确认要删除【"+_empJoinNames+"】吗?")) {
					var _empIdsStr = _empIds.join(",");
					// 发送ajax请求
					$.ajax({
					   type: "DELETE",
					   url: "${pageContext.request.contextPath}/emp/edit/"+_empIdsStr,
					   dataType: "json",
					   success: function(data){
						  if(data.code == 200) {
							  gotoPage(currentPage);
						  }
					   }
					});
				}
			} else {
				alert("你至少要选择一行");
			}
		});
		// 给所有的复选框绑定一个点击事件
	
		$(document).on("click",'input[name=empId]',function(){
			var _num = $("input[name=empId]:checked").length ;
			var _len = $("input[name=empId]").length ;
			if(_num == _len) {
				$("#ckAll").prop("checked",true);
			} else {
				$("#ckAll").prop("checked",false);
			}
		})
	
		$(document).on("click",".btn-editDelete",function(){
			var _empId = $(this).attr("btn-editId");
			// 一定要有提示信息
			
			var _tr = $(this).parents("tr").find("td:eq(0)");
			var flag = window.confirm("你确定【"+_tr.text()+"】要删除吗?");
			if(flag) {
				// 发送ajax
				$.ajax({
				   type: "DELETE",
				   url: "${pageContext.request.contextPath}/emp/edit/"+_empId,
				   dataType: "json",
				   success: function(data){
					 // 成功之后，跳转到当前页
					   gotoPage(currentPage);
				   }
				});
			}
		});
		
		$("#btnEditEmpSave").click(function(){
			var _empId = $(this).attr("emp_id");
			// 发送ajax请求
			// <form ><input type="hidden" name="_method" value="PUT"></form>
			$.ajax({
			   type: "PUT",
			   url: "${pageContext.request.contextPath}/emp/edit/"+_empId,
			   data: $("#myEditEmpData").serialize(),
			   dataType: "json",
			   success: function(data){
				  if(data.code == 200) {
					  // 成功之后，关闭当前的窗口
					  $("#myEditModal").modal("hide");
					  // 跳转到当前的页面
					  gotoPage(currentPage);
				  }
			   }
			});
		});
		//给所有的修改按钮绑定一个点击事件 on代表活着
		$(document).on("click",".btn-editUI",function(){
			// 获取部门
			addDeptDatas("#selectEditDept");
			var _empId = $(this).attr("btn-editId");
			// 根据id去查询部门的信息
			addEmpById(_empId);
			// 把员工的唯一标识，传递给修改的表单
			$("#btnEditEmpSave").attr("emp_id",_empId);
			// 打开修改对话框
			$("#myEditModal").modal({
				backdrop: "static"
			});
			
		});
		// 根据id去查询员工的信息
		function addEmpById(_empId) {
			$.ajax({
			   type: "GET",
			   url: "${pageContext.request.contextPath}/emp/edit/"+_empId,
			   dataType: "json",
			   success: function(data){
				   var _employee = data.maps.employee;
				   console.log(_employee);
				   // 拿到了数据，进行数据的回显
				   $("#input_edit_empName").text(_employee.empName);
				   $("#input_edit_empEmail").val(_employee.empEmail);
				   $("#input_edit_empBirthday").val(_employee.empBirthday);
				   $("#myEditEmpData input[name='empSex']").val([_employee.empSex]);
				   $("#selectEditDept").val([_employee.deptId]);
				   
			   }
			});
		}
		// 提取提示信息的代码
		function common_validate(el,state,msg) {
			if(state =="success") {
				$(el).parent().removeClass("has-error").addClass("has-success");
				$(el).next().text(msg);
			} else {
				$(el).parent().removeClass("has-success").addClass("has-error");
				$(el).next().text(msg);
			}
		}
	
		// 表单校验函数
		function validateForm() {
			// 校验 用户名是否符合规范
			var _regusername = /(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,6}$)/ ;
			// 找到我们用户名
			var _empName = $("#input_empName").val();
			if(_regusername.test(_empName)) {
				common_validate("#input_empName","success","");
			} else {
				common_validate("#input_empName","error","请输入字母数字或者下划线中划线3到16位,或者输入2到6为的中文");
				return false ;
			}
			// 校验 email是否符合规范
			var _regemail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			var _email = $("#input_empEmail").val();
			if(_regemail.test(_email)) {
				common_validate("#input_empEmail","success","");
			} else {
				common_validate("#input_empEmail","error","请输入正确的邮箱格式");
				return false ;
			}
			return true ;
		}
		// 2. 做用户名唯一校验,我们要给用户名的input框架绑定内容改变事件
		$("#input_empName").change(function(){
			// 1.获取当前文本框的值
			var _empName = $(this).val();
			// 2.把这个值通过ajax的方式传递到后台
			$.ajax({
			   type: "GET",
			   url: "${pageContext.request.contextPath}/emp/checkUserName",
			   data: "empName="+_empName,
			   dataType: "json",
			   success: function(data){
				  console.log(data);
				  if(data.code == 500) {
					  common_validate("#input_empName","error",data.maps.msg);
					  $("#btnEmpSave").attr("validate-state","error");
					  return ;
				  } else {
					  common_validate("#input_empName","success","");
				  }
				  if(!data.maps.flag) {
					  // 就可以使用
					  common_validate("#input_empName","success","当前用户名可以使用");
					  $("#btnEmpSave").attr("validate-state","success");
				  } else {
					  // 就不能使用
					  common_validate("#input_empName","error","当前用户名已经存在");
					  $("#btnEmpSave").attr("validate-state","error");
				  }
				   
			   }
			});
		});
		// 给新增对话框上面的保存按钮添加点击事件
		$("#btnEmpSave").click(function(){
			// 1. 做表单校验
			var flag = validateForm() ;
			if(!flag) {
				return false;
			}
			var _state = $(this).attr("validate-state");
			//alert(_state);
			if(_state == "error") {
				common_validate("#input_empName","error","当前用户名已经存在");
				return false ;
			}
			// 2. 做用户名唯一校验,我们要给用户名的input框架绑定内容改变事件
			//return false ;
			// 发送一个ajax请求，把表单中的数据带到控制器中
			$.ajax({
			   type: "POST",
			   url: "${pageContext.request.contextPath}/emp/edit",
			   data: $("#myEmpData").serialize() ,
			   dataType: "json",
			   success: function(data){
				  if(data.code == 200) {
					  // 保存成功，我们要关闭当前的对话框
					 $("#myModal").modal("hide");
					  // 关闭之后跳转到最后一页
					 gotoPage(rowNumber);
				  }
			   }
			});
		});
		function clearAll() {
			// 清空form表单中的内容,清空提示信息，清空样式
			$("#myEmpData").get(0).reset();
			$("#myEmpData").find("*").removeClass("has-success has-error");
			$(".help-block").text("");
		}
		// 给新增按钮绑定一个点击事件
		$("#addEmpUI").click(function(){
			// 清空form表单中的内容,清空提示信息，清空样式
			clearAll();
			// 1.动态的去添加部门信息
			addDeptDatas("#selectDept");
			// 2.打开我们新增对话框
			$("#myModal").modal({
				backdrop: "static"
			})
			
		});
		// 添加部门信息的函数
		function addDeptDatas(el){
			var _selectDept = $(el);
			// 每次添加之前把下拉框中的option清空
			_selectDept.empty();
			// 发送请求
			$.ajax({
			   type: "GET",
			   url: "${pageContext.request.contextPath}/dept/list",
			   dataType: "json",
			   async: false,
			   success: function(data){
				 var _departmentList = data.maps.departmentList;
				 // 迭代数据
				 $.each(_departmentList,function(index,item) {
					 $("<option></option>").attr("value",item.deptId).append(item.deptName).appendTo(_selectDept);
				 });
			   }
			});
		}
		// 准备页码数据
		function addPages(data) {
			var _pgInfo = data.maps.pageInfo ;
			var _empPages = $("#empPages");
			_empPages.empty();
			// <nav aria-label="Page navigation">
			var _nav = $("<nav></nav>").attr("aria-label","Page navigation");
			// <ul class="pagination">
			var _ul = $("<ul></ul>").addClass("pagination");
			var _isFirstPage =$("<li></li>");
			if(_pgInfo.isFirstPage) {
				_isFirstPage.addClass("disabled").append($("<a></a>").attr("href","javascript:void(0);").append("首页"));
			} else {
				//<a href="${pageContext.request.contextPath}/emp/list?pg=1">首页</a>
				_isFirstPage.append($("<a></a>").attr("href","javascript:gotoPage(1);").append("首页"));
			}
			var _hasPreviousPage =$("<li></li>");
		    
			if(_pgInfo.hasPreviousPage) {
				var p = _pgInfo.pageNum-1 ;
				_hasPreviousPage.append($("<a></a>").attr("href","javascript:gotoPage("+p+");").attr("aria-label","Previous")
						.append($("<span></span>").attr("aria-hidden","true").append("&laquo;")));
			} else {
				_hasPreviousPage.addClass("disabled").append($("<a></a>").attr("href","javascript:void(0);").attr("aria-label","Previous")
						.append($("<span></span>").attr("aria-hidden","true").append("&laquo;")));
			}
			_ul.append(_isFirstPage).append(_hasPreviousPage);
			$.each(_pgInfo.navigatepageNums,function(index,item) {
				var _li = $("<li></li>");
				if(item == _pgInfo.pageNum) {
					_li.addClass("active").append($("<a></a>").attr("href","javascript:void(0);")
							.append(item).append($("<span></span>").addClass("sr-only").append("(current)")));
				} else {
					_li.append($("<a></a>").attr("href","javascript:gotoPage("+item+");").append(item));
				}
				_ul.append(_li);
			});
			
			var _hasNextPage =$("<li></li>");
			if(_pgInfo.hasNextPage) {
				var p = _pgInfo.pageNum+1 ;
				_hasNextPage.append($("<a></a>").attr("href","javascript:gotoPage("+p+");").attr("aria-label","Next")
						.append($("<span></span>").attr("aria-hidden","true").append("&raquo;")));
			} else {
				_hasNextPage.addClass("disabled").append($("<a></a>").attr("href","javascript:void(0);").attr("aria-label","Next")
						.append($("<span></span>").attr("aria-hidden","true").append("&raquo;")));
			}
			var _isLastPage =$("<li></li>");
			if(_pgInfo.isLastPage) {
				//<li class="disabled"><a href="javascript:void(0);">未页</a></li>
				_isLastPage.addClass("disabled").append($("<a></a>").attr("href","javascript:void(0);").append("未页"));
			} else {
				_isLastPage.append($("<a></a>").attr("href","javascript:gotoPage("+_pgInfo.pages+");").append("未页"));
			}
			_ul.append(_hasNextPage).append(_isLastPage);
			_nav.append(_ul);
			_empPages.append(_nav);
			
		}
		// 准备分页详情
		function addPageInfo(data) {
			var _empPageInfo = $("#empPageInfo");
			_empPageInfo.empty();
			var _pageInfo = data.maps.pageInfo ;
			_empPageInfo.append("当前第"+_pageInfo.pageNum+"页/总共"
					+_pageInfo.pages+"页，每页显示"
					+_pageInfo.pageSize+"条数据,总共"
					+_pageInfo.total+"条数据");
			rowNumber = _pageInfo.total ;
			currentPage = _pageInfo.pageNum;
		}
		// 添加员工数据
		function addEmpsData(data) {
			var _tbody = $("#empData");
			_tbody.empty();
			var _list = data.maps.pageInfo.list ;
			$.each(_list,function(index,item){
				// tr
				var _tr = $("<tr></tr>"); // item.empId
				var _empId = $("<th></th>").attr("scope","row").append($("<input type='checkbox' name='empId' value='"+item.empId+"'>"));
				// <td>${emp.empName }</td>
				var _empName= $("<td></td>").append(item.empName);
				// <td>${emp.department.deptName }</td>
				var _deptName = $("<td></td>").append(item.department.deptName);
				// <td>${emp.empEmail }</td>
				var _empEmail = $("<td></td>").append(item.empEmail);
				// <td>${emp.empSex=="F"?"男":"女" }</td>
				var _empSex = $("<td></td>").append(item.empSex=="M"?"男":"女");
				// <td>${emp.empBirthday }</td>
				var _empBirthday = $("<td></td>").append(item.empBirthday);
	          	var _td = $("<td></td>");
	          	var _btnEdit = $("<button></button>").addClass("btn btn-info btn-editUI").attr("btn-editId",item.empId).append("修改");
	          	var _btnDelete = $("<button></button>").addClass("btn btn-primary btn-editDelete").attr("btn-editId",item.empId).append("删除");
	          	_td.append(_btnEdit).append(" ").append(_btnDelete);
	          	_tr.append(_empId).append(_empName).append(_deptName)
	          	.append(_empEmail).append(_empSex).append(_empBirthday).append(_td);
	          	_tbody.append(_tr);
			});
		}
	</script>
</body>
</html>