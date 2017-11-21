<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>商家詳情页面</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="css/bootstrap.css" rel="stylesheet">
</head>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
function cardBlur(){
	var card = $("#card").val();
	//alert(card);
	var reg = /^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
	//alert(reg.test(card));
	if(!(reg.test(card))){
		alert("身份证不符合规范");
		$("#card").val("");
		//兼容火狐 IE 浏览器不能聚焦问题
		setTimeout(function(){
			$('#card').focus();
		},0);
	}
}
function phoneBlur(){
	var phone = $("#phone").val();
	//alert(card);
	var reg = /^1[34578]\d{9}$/;
	//alert(reg.test(card));
	if(!reg.test(phone)){
		alert("手机号不符合规范");
		$("#phone").val("");
		//兼容火狐 IE 浏览器不能聚焦问题
		setTimeout(function(){
			$('#phone').focus();
		},0);
	}
}

function mysubmit(){
	if(!($('#username').val()!='' && $('#password').val()!='' && $('#trueName').val()!='' && $('#card').val()!='' && $('#phone').val()!='')){
		alert('信息不能为空');
		return false;
	}else{
		if(!confirm("确认要修改？")){
			return false;
		}
	}
	
}
</script>
<body>
	<ol class="breadcrumb">
		管理員：
		<li><a href="index/mainFrame.jsp">首頁</a></li>
		<li class="active">商家管理</li>
		<li><a href="mainFrame/userManager/user_list.jsp">商家列表</a></li>
		<li class="active">詳情</li>
	</ol>
	<table class="table">
		<thead>
			<tr>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<form class="form-horizontal" role="form" action="user/update" target="mainFrame" onsubmit="return mysubmit()" method="POST">
			<input type="hidden" value="${user.id}" name="id"/>
			<tr>
				<th class="col-sm-3 text-center">登錄名</th>
				<td class="col-sm-9 text-center"><input type="text" name="userName"
					class="form-control" value="${user.userName}" id="username"
					style="width: 220px; margin-left: 30%" readonly="readonly"></td>
			</tr>
			<tr>
				<th class="col-sm-3 text-center">密碼</th>
				<td class="col-sm-9 text-center"><input type="text" name="pwd" id="pwd"
					class="form-control" value="${user.pwd}"
					style="width: 220px; margin-left: 30%"></td>
			</tr>
			<tr>
				<th class="col-sm-3 text-center">真實姓名</th>
				<td class="col-sm-9 text-center"><input type="text" name="trueName" id="trueName"
					class="form-control" value="${user.trueName}"
					style="width: 220px; margin-left: 30%"></td>
			</tr>
			<tr>
				<th class="col-sm-3 text-center">身份證號</th>
				<td class="col-sm-9 text-center"><input type="text" name="card" id="card"
					class="form-control" value="${user.card}" onchange="cardBlur()"
					style="width: 220px; margin-left: 30%"></td>
			</tr>
			<tr>
				<th class="col-sm-3 text-center">手機號碼</th>
				<td class="col-sm-9 text-center"><input type="text" name="phone" id="phone"
					class="form-control" value="${user.phone}" onchange="phoneBlur()"
					style="width: 220px; margin-left: 30%"></td>
			</tr>
			<tr>
				<th class="col-sm-3 text-center">創建時間</th>
				<td class="col-sm-9 text-center"><input type="text"
					class="form-control" value="${user.createDate}"
					style="width: 220px; margin-left: 30%" disabled="disabled"></td>
			</tr>
			<tfoot>
				<tr>
					<th colspan="2" class="text-center"><input type="submit"
						class="btn btn-success" value="修改"> <a
						class="btn btn-danger" href="user/delete?id=${user.id}" target="mainFrame"
						onclick="return confirm('确定要删除改商家？')">刪除該商家</a> <a class="btn btn-info"
						href="javascript:history.back(-1)" target="mainFrame">返回列表</a></th>
				</tr>
			</tfoot>
		</form>
	</table>
</body>

</html>