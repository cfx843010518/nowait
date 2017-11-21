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
    <title>添加商家頁面</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="css/bootstrap.css" rel="stylesheet">
</head>
<script type="text/javascript" src="js/jquery.js"></script>
<script>
function add(){
    if (confirm("確認添加？")) {
    	if(!($('#username').val()!='' && $('#password').val()!='' && $('#trueName').val()!='' && $('#card').val()!='' && $('#phone').val()!='')){
    		alert('信息不能为空');
    		return false;
    	}
    }
    else{
    	return false;
    }
}
function blurs(){
	var username = $("#username").val();
	 $.get("user/isExist?userName="+username,function(data,status){
		 if(data=="false"){
			 alert("该登录名已存在");
			 $("#username").val("").focus();
		 } 
	 });
}
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
</script>
<style>
    .formBox {
        width: 60%;
        margin-left: 50px;
    }
</style>
<body>
<ol class="breadcrumb">
    管理員：
    <li><a href="index/mainFrame.jsp">首頁</a></li>
    <li class="active">商家管理</li>
    <li><a href="mainFrame/userManager/user_list.jsp">商家列表</a></li>
    <li class="active">添加商家</li>
</ol>
<div class="formBox">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h2>添加商家</h2>
        </div>
        <div class="panel-body">
        <form class="form-horizontal" id="myform" role="form" action="user/add" method="POST">
            <div class="form-group">
                <label for="username" class="col-sm-2 control-label">登錄名</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="username" onblur="blurs()" name="userName" placeholder="請輸入登錄名">
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-2 control-label">密碼</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="password" name="pwd" placeholder="請輸入密碼">
                </div>
            </div>
            <div class="form-group">
                <label for="trueName" class="col-sm-2 control-label">真實姓名</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="trueName" name="trueName" placeholder="請輸入真實姓名">
                </div>
            </div>
            <div class="form-group">
                <label for="card" class="col-sm-2 control-label">身份證號</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="card" name="card" onchange="cardBlur()" placeholder="請輸入身份證號">
                </div>
            </div>
            <div class="form-group">
                <label for="phone" class="col-sm-2 control-label">手機號</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="phone" name="phone" placeholder="請輸入手機號" onchange="phoneBlur()">
                </div>
            </div>

            <div class="form-group text-center">
                <button type="submit" class="btn btn-success" onclick="return add()">添加</button>
            </div>
        </form>
        </div>
    </div>
</div>
</body>
</html>