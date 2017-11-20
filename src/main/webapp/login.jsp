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
    <title>排隊不用等後台登錄</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
    <!-- jQuery文件 -->
    <script src="js/jquery.min.js"></script>

</head>
<script>
    function login(){
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
        if(username == '' || username ==null){
            alert('用户名不能为空');
            window.event.returnValue = false;
        }else if(password == '' || password ==null){
            alert('密码不能为空');
            window.event.returnValue = false;
        }
       
        $.ajax({
            type:'post',
            url:'user/login',
            data:{"name":$("#username").val(),"pwd":$("#password").val(),
            	"type":$("#usertype").val(),"isReadme":$("#isReadme").val()},
			dataType:"text",
            success:function(data){
            	if(data == 'true'){
            		 location.href ="index.jsp";
		    	  }else{
		    		 alert(data);
		    	 }
            }
        });
    }
</script>
<style>
    .title {
        color: azure;      /*字体颜色*/
        position:absolute;
        font-size: 50px;
        width: 450px;
        left:50%;
        top:100px;
        -webkit-transform: translate(-50%, -50%);
        -moz-transform: translate(-50%, -50%);
        -ms-transform: translate(-50%, -50%);
        -o-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
    }
    .center-in-center {
        position: absolute;
        top: 360px;
        left: 50%;
        -webkit-transform: translate(-50%, -50%);
        -moz-transform: translate(-50%, -50%);
        -ms-transform: translate(-50%, -50%);
        -o-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
    }
    .loginborder {
        width: 380px;
    }
</style>
<body>
<div><h1 class="title">排隊不用等後台管理</h1><img src="images/head.png" width="100%" height="200"></div>
<div class="center-in-center loginborder">
    <form class="form-horizontal" role="form" method="post">
        <div class="col-sm-1"></div>
        <div class="input-group form-group col-sm-10">
            <span class="input-group-addon "><img src="images/user.png" width="12px"></span>
            <input type="text" class="form-control" name="name" id="username" placeholder="請輸入用戶名">
        </div>
        <div class="col-sm-1"></div>

        <div class="input-group form-group col-sm-10">
            <span class="input-group-addon "><img src="images/pwd.png" width="12px"></span>
            <input type="password" class="form-control" name="pwd" id="password"
                   placeholder="請輸入密碼">
        </div>

        <div class="col-sm-1"></div>
        <div class="col-sm-10 text-center input-group form-group">
            <span class="input-group-addon "><img src="images/identity.png" width="12px"></span>
            <select id="usertype" name="type" class="form-control" >
                <option >商家</option>
                <option>管理員</option>
            </select>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-1 col-sm-7">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="isReadme" id="isReadme" />記住我
                    </label>
                </div>
            </div>
            <a class="col-sm-4 checkbox-inline" href="#">忘記密碼</a>
        </div>
        <div class="col-sm-1 form-group"></div>
        <div class="form-group text-center">
            <div class="col-sm-1"></div>
            <input type="button"  class="btn btn-success col-sm-9" onclick="login()" value="登錄" />
            <a class="btn text-center" href="register.jsp">註冊</a>
        </div>
    </form>
</div>
<div class="row footer-bottom">
    <ul class="list-inline text-center navbar-fixed-bottom">
        <li>Copyright ©2017排隊不用等</li>
    </ul>
</div>
</body>
</html>