<%--
  Created by IntelliJ IDEA.
  User: Red
  Date: 5/2/18
  Time: 21:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Matchmaster - Edit User Account</title>
</head>
<body>
    <jsp:include page="views/header.jsp"></jsp:include>
    <div class="user-container">
        <div class="userinfo-container">
            <form class="user-info-container" method="post" action="editUserInfoServlet">
                <input type="hidden" name="thisUser" value="${user}">
                <h3>${user.getUserName()}</h3>
                ${user.email} ${user.phone} <br>
                ${user.street} ${user.city} <br>
                ${user.state} ${user.zip} <br>
                <button>Edit</button>
            </form>
        </div>
    </div>
</body>
</html>
