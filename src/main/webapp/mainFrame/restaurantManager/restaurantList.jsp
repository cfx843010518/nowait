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
    <title>餐廳門店列表頁面</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <!-- jQuery文件 -->
    <script src="js/jquery.js"></script>

</head>

<body>
<ol class="breadcrumb">
    管理員：
    <li><a href="index/mainFrame.html">首頁</a></li>
    <li class="active">餐廳信息管理</li>
    <li class="active">餐廳列表</li>
</ol>
<form action="successOfResManager.html" target="mainFrame" >
    <table class="table table-hover">
        <thead>
        <tr>
            <th><input type="checkbox" id="checkAll" name="checkAll" />全選</th>
            <th class="text-center">餐厅名</th>
            <th class="text-center">价格简介</th>
           
            <th class="text-center">客服电话</th>
            <th class="text-center">营业时间</th>
			 <th class="text-center">查看该餐厅排队情况</th>
            <th class="text-center">單行操作</th>
        </tr>
        </thead>
        <tr>
            <td><input type="checkbox" name="checkBox"/></td>
            <td class="text-center">旺角餐廳</td>
            <td class="text-center">人均30元</td>
            
            <td class="text-center">10086</td>
            <td class="text-center">9:00至23:00</td>
			<td class="text-center"><a href="orderList.html">查看<a></td>
            <td class="text-center">
                <div class="btn-group">
                    <a class="btn btn-default" href="restaurantDetail.html" target="mainFrame" >詳情</a>
                    <a class="btn btn-default" href="successOfResManager.html" target="mainFrame" onclick="onedelete()">刪除</a>
                </div>
            </td>
        </tr>
        <tr>
            <td><input type="checkbox" name="checkBox"/></td>
            <td class="text-center">旺角餐廳</td>
            <td class="text-center">人均30元</td>
           
            <td class="text-center">10086</td>
            <td class="text-center">9:00至23:00</td>
			 <td class="text-center"><a href="orderList.html">查看<a></td>
            <td class="text-center">
                <div class="btn-group">
                    <a class="btn btn-default" href="restaurantDetail.html" target="mainFrame" >詳情</a>
                    <a class="btn btn-default" href="successOfResManager.html" target="mainFrame" onclick="onedelete()">刪除</a>
                </div>
            </td>
        </tr>
        <tr>
            <td><input type="checkbox" name="checkBox"/></td>
            <td class="text-center">旺角餐廳</td>
            <td class="text-center">人均30元</td>
           
            <td class="text-center">10086</td>
            <td class="text-center">9:00至23:00</td>
			 <td class="text-center"><a href="orderList.html">查看<a></td>
            <td class="text-center">
                <div class="btn-group">
                    <a class="btn btn-default" href="restaurantDetail.html" target="mainFrame" >詳情</a>
                    <a class="btn btn-default" href="successOfResManager.html" target="mainFrame" onclick="onedelete()">刪除</a>
                </div>
            </td>
        </tr>
        <tfoot>
        <tr>
            <th colspan="7" class="text-center">
                <input type="submit" class="btn btn-danger" value="批量删除" onclick="checkdelete()" >
                <a class="btn btn-info" href="mainFrame/restaurantManager/addRestaurant.jsp" target="mainFrame">添加餐廳</a>
            </th>
        </tr>
        </tfoot>
    </table>
</form>
</body>
<script>
    $(function(){
        function initTableCheckbox() {
            var $thr = $('table thead tr');
            /*“全选/反选”复选框*/
            var $checkAll = $thr.find('input');
            $checkAll.click(function(event){
                /*将所有行的选中状态设成全选框的选中状态*/
                $tbr.find('input').prop('checked',$(this).prop('checked'));
                /*并调整所有选中行的CSS样式*/
                if ($(this).prop('checked')) {
                    $tbr.find('input').parent().parent().addClass('warning');
                } else{
                    $tbr.find('input').parent().parent().removeClass('warning');
                }
                /*阻止向上冒泡，以防再次触发点击操作*/
                event.stopPropagation();
            });
            /*点击全选框所在单元格时也触发全选框的点击操作*/
            $('#checkAll').click(function(){
                $(this).find('input').click();
            });
            var $tbr = $('table tbody tr');
            /*点击每一行的选中复选框时*/
            $tbr.find('input').click(function(event){
                /*调整选中行的CSS样式*/
                $(this).parent().parent().toggleClass('warning');
                /*如果已经被选中行的行数等于表格的数据行数，将全选框设为选中状态，否则设为未选中状态*/
                $checkAll.prop('checked',$tbr.find('input:checked').length == $tbr.length ? true : false);
                /*阻止向上冒泡，以防再次触发点击操作*/
                event.stopPropagation();
            });
            /*点击每一行时也触发该行的选中操作*/
            $tbr.click(function(){
                $(this).find('input').click();
            });
            /*点击按钮 不选中复选框*/
            var $a = $('table tr td a');
            $a.click(function(){
                $(this).parent().parent().parent().find('input').click();
            });
        }
        initTableCheckbox();
        /* 按钮删除操作 */
    });
    function onedelete(){
        if (!confirm("確定要刪除？")) {  window.event.returnValue = false;  }
    }

    function checkdelete(){
        if (!confirm("確認刪除所有被選項？")) {
            window.event.returnValue = false;
        }
        else{
            var checkflag = false; //false:未选中复选框  true:选中至少一个
            var checkboxs = document.getElementsByName("checkBox");
            for(var i=0;i<checkboxs.length;i++){
                if(checkboxs[i].checked == true){
                    checkflag = true;
                    break;
                }
            }
            if(!checkflag){
                alert("未選中用戶,請選擇後再執行批量刪除");
                window.event.returnValue = false;
            }
        }
    }
</script>
</html>