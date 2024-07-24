<%@ page import="com.example.lixiaomai.backend.entity.Deliverman" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/7/24
  Time: 1:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Deliverman deliverman=(Deliverman)session.getAttribute("deliverman"); 
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/index.css" type = "text/css">
</head>
<body>
<h1>骑手主页管理</h1>
<div class="container">
    <h1>欢迎，<%= deliverman.getName() %>!</h1>
    <h3>个人信息：</h3>
    <div class="account">
        <p>用户类型：${userType} 用户姓名：${name}</p>
    </div>
    <div class="deliverman-info">
        <p>车牌ID: <%= deliverman.getVId()%></p>
        <p>车辆品牌: <%= deliverman.getVBrand() %></p>
        <p>车辆类型:<%=deliverman.getVType() %></p>
        <p>联系方式: <%= deliverman.getTelephone() %></p>
        <p>当前状态:<%=deliverman.getStatus()%></p>
    </div>
    <a href="delivermanManage">管理商品</a>
    <a href="delivermanOrderHistory">商家的历史订单详情</a>
    <a href="login.jsp">退出登录</a>
</div>
</body>
</html>