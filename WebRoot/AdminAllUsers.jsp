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

    <title>My JSP 'AdminAllGoods.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="css/bootstrap.css"/>
    <script src="js/jquery-3.5.1.min.js"></script>
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <script type="text/javascript">

        function ChangeUser(uid){

            var xhr=new XMLHttpRequest;
            xhr.onreadystatechange=function(){
                if(xhr.readyState==4&xhr.status==200){
                    var result=xhr.responseText;
                    if(result==1){

                        window.location.reload();
                    }else if(result==-1){
                        alert("暂无权限");
                    }else{
                        alert("禁用失败");
                    }
                }
            }
            xhr.open("get","ChangeUserStatus?uid="+uid,true);
            xhr.send();
        }
    </script>
    <style type="text/css">
        ul li{
            float:left;
            list-style:none;
            margin-left:10px;
        }
        #pagination{
            width:30%;
            margin:0 auto;
        }
        a:hover{
            text-decoration:none;
            color: #fff;
        }
        a{
            text-decoration:none;
            color: #fff;
        }
        img{
            width:50px;
            height:50px;
        }
    </style>
</head>

<body>
<table class="table table-hover">
    <thead>

    <tr>
        <th>用户账号</th>
        <th>用户电话</th>
    </tr>
    </thead>
    <tbody >
    <c:forEach items="${userList}" var="userItem"   varStatus="status" >

        <tr>
            <td>${userItem.uid}</td>
            <td>${userItem.uphone}</td>
            <td>
                <c:if test="${userItem.ustatus==1}">
                    <button type="button" onclick="ChangeUser('${userItem.uid}')" class="btn btn-danger">解冻</button>
                </c:if>
                <c:if test="${userItem.ustatus==0}">
                    <button type="button" onclick="ChangeUser('${userItem.uid}')" class="btn btn-success">冻结</button>
                </c:if>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div id="pagination">
    <ul>
        <c:if test="${pageNo!=1}"><li><a href="AdminAllUsers?pageNo=${pageNo-1}" style="color:black">上一页</a></li></c:if>
        <c:if test="${pageNo<Count}"><li><a href="AdminAllUsers?pageNo=${pageNo+1}" style="color:black">下一页</a></li></c:if>
    </ul>
</div>
</body>
</html>
