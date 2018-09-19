<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>角色管理</title>
		<link type="text/css" rel="stylesheet" href="css/common.css" />
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="js/table.js"></script>
		<script type="text/javascript" src="js/openwindow.js"></script>
		<script type="text/javascript">
function page(currentPage){
	$("#pageId").val(currentPage);
	document.pageForm.submit();
}
function clearInfo(){
	$("#name").val("");
	document.searchForm.submit();
}	

function initadd(){
	var url="role_add.action";
	openWindow(url,520,150);
}	
function checkAll(){
	var all=$("#all");
	var checks=$("input[name='ids']");
	if(all.attr("checked")){
		checks.attr("checked","checked");
	}else{
		checks.attr("checked","");
	}
}

function deleteRole(){
	var arry="";
	var count=0;
	var checks=$("input[name='ids']");
	for(var i=0;i<checks.length;i++){
		if(checks[i].checked){
			if(arry==''){
			arry+="ids="+checks[i].value;
			}else{
			arry+="&ids="+checks[i].value;
			}
			count++;
		}
	}
	if(count==0){
		alert("请选择要删除的数据！");
		return;
	}
	if(confirm("确定要删除？")){
		$.post("deleteRole.action",arry,function(data){
			if(data=="success"){
				alert("删除数据成功！");
				var currentPage=$("#currentPage").val();
				page(currentPage);
			}else{
				alert("删除数据失败！");
			}
		});
	}
}

function updateRole(id){
var currentPage=$("#currentPage").val();
	var url="getRoleObj.action?id="+id+"&currentPage="+currentPage;
	openWindow(url,520,150);
}

function userRole(id){
	var url="userRoleYes.action?id="+id;
	openWindow(url,800,700);
}

function roleMenu(id){
	var url="initRoleMenu.action?id="+id;
	openWindow(url,350,420);
}
</script>
	</head>

	<body>
		<form action="getRoleManage.action" method="post" name="searchForm">
			<div id="search" class="search" style="height: 30px;">
				角色名称：
				<input type="text" id="name" name="name" value="${name}" />
				&nbsp;
				<input type="submit" value="立即查找" class="button_04" />
				&nbsp;
				<input type="button" onclick="clearInfo();" value="清除"
					class="button_02" />
			</div>
		</form>
		<table id="table" align="center" border="0" cellpadding="0"
			cellspacing="0" width="100%">
			<tr>
				<td height="30">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="12" height="30" class="table_box_1">
							</td>
							<td class="table_box_2">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="46%" valign="middle">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="5%">
														<div align="center">
															<img src="images/tb.gif" width="16" height="16" />
														</div>
													</td>
													<td width="95%" style="font-size: 12px;">
														<span style="font-size: 12px; font-weight: bold;">当前位置</span>：角色管理
													</td>
												</tr>
											</table>
										</td>
										<td width="54%" align="right">
											<input type="button" onclick="initadd()" value="添加"
												class="button_02" />
											<input type="button" onclick="deleteRole()" value="删除"
												class="button_02" />
										</td>
									</tr>
								</table>
							</td>
							<td width="16" class="table_box_3">
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="8" class="table_box_4">
								&nbsp;
							</td>
							<td>
								<table class="table_list" cellspacing="1" cellpadding="0"
									width="100%" border="0">
									<tr id="rows_title">
										<td width="3%">
											<input type="checkbox" onclick="checkAll()" name="all"
												id="all">
										</td>
										<td width="5%">
											序号
										</td>
										<td>
											角色名称
										</td>
										<td width="20%">
											操作
										</td>
									</tr>

									<c:if test="${empty roleList}">
										<tr id="rows">
											<td colspan="4">
												没有相关记录！
											</td>
										</tr>
									</c:if>
									<c:forEach items="${roleList}" var="role">
										<tr id="rows" onmouseover="overStyle(this)"
											onmouseout="outStyle(this)">
											<td align="center">
												<input type="checkbox" name="ids" value="${role.id}">
											</td>
											<td>
												${role.id}
											</td>
											<td>
												${role.name}
											</td>
											<td align="center">
												<img alt="修改" onclick="updateRole('${role.id}')"
													src="images/edit.gif" style="cursor: pointer">
												&nbsp;&nbsp;
												<a href="javascript:roleMenu('${role.id}')"
													style="color: #FF6600; font-weight: bold">角色授权</a>
											</td>
										</tr>
									</c:forEach>
								</table>
							</td>
							<td width="8" class="table_box_5">
								&nbsp;
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="48">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="12" height="48" class="table_box_6">
							</td>
							<td class="table_box_7">
								<form action="getRoleManage.action" method="post" name="pageForm">
									<input type="hidden" name="name" value="${name}">
									<input type="hidden" id="pageId" name="currentPage">
									<%@include file="../../jsp/page.jsp"%>
								</form>
							</td>
							<td width="16" class="table_box_8">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>