<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
     <link rel="stylesheet" href="css/bootstrap.css"/>
    <title>My JSP 'userorder.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<style>
a, a:hover {
    text-decoration: none;
}
a {
    background-color: rgba(0,0,0,0);
}
	ul li{
	float:left;
	list-style:none;
	margin-left:10px;
	}
	#pagination{
	width:30%;
	margin:0 auto;
	}

   img{
   width:50px;
   height:50px;
   }
</style>
  </head>
  
  <body>
     <table class="table table-hover">
    <tr>
    <th>订单号</th>
    <th>收货信息</th>
    <th>商品信息</th>
    <th>价格</th>
    <th>数量</th>
	<th><select id="sel" >	
	<option value="-1">全部订单</option>
	<option value="0">待支付</option>
	<option value="1">待发货</option>
	<option value="2">待签收</option>
	<option value="3">已完成</option>
	</select></th>
    </tr>
     <c:forEach items="${orderlist}" var="olist" >
     <tr>
     <td> ${olist.oid}</td>
     <td> ${olist.uname}<br>${olist.ophone}<br>${olist.oaddress}</td>
     <td> ${olist.oname}</td>
     <td> ${olist.oprice}</td>
     <td> ${olist.onum}</td>
     <c:if test="${olist.status==1}">
         <th><a href="javascript:void(0)" onclick="deliver('${olist.oid}')">发货</a>
    </c:if>
     <c:if test="${olist.status==0}"><th>待支付</th></c:if>
      <c:if test="${olist.status==2}"><th>已发货</th></c:if>
      <c:if test="${olist.status==3}"><th>已完成</th></c:if>
     </tr>
    
     </c:forEach>
      </table>
      <div id="pagination">
  <ul>
   <c:if test="${pageNo!=1}"><li><a href="adminGetAllOrder?pageNo=${pageNo-1}&type=${type}" style="color:black">上一页</a></li></c:if>
   <c:if test="${pageNo<Count}"><li><a href="adminGetAllOrder?pageNo=${pageNo+1}&type=${type}" style="color:black">下一页</a></li></c:if>
  </ul>
</div>
  </body>
  <script>
  	function deliver(oid){
  		var sid=prompt("请输入快递单号");
  		var xhr=new XMLHttpRequest;
				xhr.onreadystatechange=function(){
					if(xhr.readyState==4&xhr.status==200){
						var result=xhr.responseText;
						if(result==1){
						  window.location.reload();
						}
					}
				}
				xhr.open("get","ChangeOrder?oid="+oid+"&type=1&sid="+sid,true)
				xhr.send();
  	}
  	$("#sel").change(function(){
  			window.location.href="adminGetAllOrder?pageNo=1&type="+$("#sel option:selected").val();
  	})
  </script>
</html>
