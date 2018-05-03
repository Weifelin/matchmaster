<%--
  Created by IntelliJ IDEA.
  User: Red
  Date: 5/3/18
  Time: 03:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Matchmaster - Edit UserInfo</title>
</head>
<body>
<jsp:include page="views/header.jsp"></jsp:include>
<div class="userinfo-container">
    <form class="user-info-container" method="post" action="UpdateUserInfo">
        <input type="hidden" name="thisUser" value="${user}">
        <h3>${user.getUserName()}</h3>
        <input type="password" name="pwd" placeholder="Enter new password">
        <input type="text" name="email" placeholder="${user.getEmail()}">
        <input type="text" name="street" placeholder="${user.getStreet()}">
        <input type="text" name="city" placeholder="${user.getCity()}">
        <input type="text" name="state" placeholder="${user.getState()}">
        <input type="text" name="zip" placeholder="${user.getZip()}">
        <input type="text" name="zip" placeholder="${user.getPhone()}">
        <button>Submit</button>
    </form>
</div>
</body>
</html>
