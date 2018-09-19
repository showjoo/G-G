<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>添加商品</title>
		<link type="text/css" rel="stylesheet" href="css/window.css">
		<link rel="stylesheet" href="css/uploadify.css" type="text/css"></link>
		<link rel="stylesheet" href="js/kindeditor/plugins/code/prettify.css" />
		<link rel="stylesheet" href="js/kindeditor/themes/default/default.css" />
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="js/jquery.uploadify.v2.0.3.js"></script>
  		<script type="text/javascript" src="js/swfobject.js"></script>
  		<script type="text/javascript" src="js/kindeditor/kindeditor.js"></script>
		<script type="text/javascript" src="js/kindeditor/lang/zh_CN.js"></script>
		<script type="text/javascript" src="js/kindeditor/plugins/code/prettify.js"></script>
		<script type="text/javascript">
		var editor;
			KindEditor.ready(function (K) {
				editor = K.create('textarea[name="product.content"]', {cssPath:"js/kindeditor/plugins/code/prettify.css", uploadJson:"js/kindeditor/jsp/upload_json.jsp", fileManagerJson:"js/kindeditor/jsp/file_manager_json.jsp", allowFileManager:true, afterCreate:function () {
					var self = this;
					K.ctrl(document, 13, function () {
						self.sync();
						document.forms["form"].submit();
					});
					K.ctrl(self.edit.doc, 13, function () {
						self.sync();
						document.forms["form"].submit();
					});
				}});
				prettyPrint();
			});
		
		$(document).ready(function() {
   $("#uploadify").uploadify({
       'uploader': 'swf/uploadify.swf', //flash文件的相对路径
       'script': 'upload.action',  //后台处理程序的相对路径
       'fileDataName':'file', //设置上传文件名称,默认为Filedata
       'cancelImg': 'images/cancel.png', //每一个文件上的关闭按钮图标
       'queueID': 'div_progress', //文件队列的ID，该ID与存放文件队列的div的ID一致
       'queueSizeLimit':3, //当允许多文件生成时，设置选择文件的个数，默认值：999
       'fileDesc' : 'jpg、gif、jpeg、png文件', //用来设置选择文件对话框中的提示文本        
       'fileExt' : '*.jpg;*.gif;*.png;*.jpeg', //设置可以选择的文件的类型
       'auto' : true, //设置为true当选择文件后就直接上传了，为false需要点击上传按钮才上传
       'multi' : false, //设置为true时可以上传多个文件
       'simUploadLimit' : 1, //允许同时上传的个数 默认值：1 
       'sizeLimit':10240000, //上传文件的大小限制
       'buttonText': '选择图片', //浏览按钮的文本，默认值：BROWSE
       'displayData': 'percentage',//上传队列显示的数据类型，percentage是百分比，speed是上传速度
        //回调函数
       'onComplete': function (evt, queueID, fileObj, response, data){
   			$("#image").val(response);
        	$("#img").attr("src",response);
       },
       'onError' : function(event, queueID, fileObj,errorObj){
    	   if(errorObj.type === "File Size"){
    		  alert("文件最大为1M");
    		  $("#uploadify").uploadifyClearQueue();
    	   }
	   },
	   'onQueueFull':function(event,queueSizeLimit){
			alert("最多同时上传"+queueSizeLimit+"张图片");
		    return false;
	   }
    }); 
});
		
		
			function saveProduct(){
				var title=$("#title").val();
				var iamge=$("#image").val();
				var size=$("#size").val();
				var type=$("#type").val();
				var oldPrice=$("#oldPrice").val();
				var newPrice=$("#newPrice").val();
				var reg=/^[1-9]d*.d*|0.d*[1-9]d*$/;
				if($.trim(title)==''||$.trim(title)=='null'){
					alert("名称不能为空！");
					return;
				}
				if($.trim(iamge)==''||$.trim(iamge)=='null'){
					alert("图片不能为空！");
					return;
				}
				if($.trim(size)==''||$.trim(size)=='null'){
					alert("尺寸不能为空！");
					return;
				}
				if($.trim(type)==''||$.trim(type)=='null'){
					alert("分类不能为空！");
					return;
				}
				if($.trim(oldPrice)==''||$.trim(oldPrice)=='null'){
					alert("原价不能为空！");
					return;
				}else if(!reg.test(oldPrice)){
					alert("价格不合法！");
					return;
				}
				if($.trim(newPrice)==''||$.trim(newPrice)=='null'){
					alert("现价不能为空！");
					return;
				}else if(!reg.test(newPrice)){
					alert("价格不合法！");
					return;
				}
				$("#content").val(editor.html());
			   $.post("addProduct.action",$("form").serialize(),function(data){
				if(data=='success'){
					alert("保存成功！");
					window.close();
					window.opener.location.href="getProductManage.action";
				}else{
					alert("保存失败！");
				}
			});	
			}
			
		</script>
	</head>

	<body class="openWinPage">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td class="AvidmTitleName">
					<div class="imgdiv">
						<img src="images/add.gif">
					</div>
					<div class="namediv">
						添加商品
					</div>
				</td>
			</tr>
		</table>
		<form id='form' name="form" style="margin: 0px;">
			<table width="100%" class="avidmTable">
				<tr class="left_col">
					<td align="right">
						<span>*</span>名称：
					</td>
					<td align="left">
						<input type="text" id="title" name="product.title" maxlength="15"
							class='AvidmW250' />
					</td>
					</tr>
					<tr class="left_col">
					<td align="right">
						<span>*</span>图片：
					</td>
					<td align="left">
						<input type="hidden" id="image" name='product.image' value="${product.image}"/>
						 <img  src="images/zwtp1.jpg" width="150" height="130" id="img"/><br/>
					    <input type="file" name="uploadify" id="uploadify" /> 
					    <div id="div_progress"></div> 
					</td>
				</tr>
				<tr class="left_col">
					<td align="right">
						区域：
					</td>
					<td align="left">
					<select id="size" name="product.size">
						<option value="A">A校区</option>
						<option value="B">B校区</option>
					</select>
					<!-- <input type="text" id="size" name="product.size" maxlength="30"
							class='AvidmW250' value="big" /><font color="red" size="2">(* 多尺寸用,分割)</font> -->					
				</td>
				</tr>
				<tr class="left_col">
					<td align="right">
						库存：
					</td>
					<td align="left">
					<input type="text" id="kucun" name="product.stock" maxlength="30"
							class='AvidmW150' />			
				</td>
				</tr>
				<tr class="left_col">
					<td align="right">
						所属分类：
					</td>
					<td align="left">
						<s:select id="type" list="proTypeList" listKey="id" listValue="name" name="product.proType.id" value="product.proType.id" theme="simple"></s:select>
					</td>
				</tr>
				<tr class="left_col">
					<td align="right">
						原价：
					</td>
					<td align="left">
						<input   type="text"  
							name="product.oldPrice" id="oldPrice" class='AvidmW150' />
					</td>
				</tr>
				<tr class="left_col">
					<td align="right">
						现价：
					</td>
					<td align="left">
						<input   type="text"  
							name="product.newPrice" id="newPrice" class='AvidmW150' />
					</td>
				</tr>
				<tr class="left_col">
					<td align="right">
						描述：
					</td>
					<td align="left">
						<textarea name="product.content" id="content" style="width:480px;height:200px"></textarea>
					</td>
				</tr>
			</table>
		</form>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 20px;">
			<tr>
				<td class="exegesis" style="width: 220px;">
					<span>*</span> 为必选/必填项
				</td>
				<td>
					<input class="button_02" onclick="saveProduct()" type="button"
						value="确定" />
					&nbsp;&nbsp;
					<input class="button_02" onclick="window.close()" type="button"
						value="关闭" />
				</td>
			</tr>
		</table>
	</body>
</html>