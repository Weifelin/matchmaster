<%--
  Created by IntelliJ IDEA.
  User: Red
  Date: 4/30/18
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Matchmaster - Dashboard</title>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="dashboard-container">
        <div class="userinfo-container">
            <h3>${user.getUserName()}</h3>
            ${user.getEmail()} ${user.getPhone()} <br>
            ${user.getStreet()} ${user.getCity()} <br>
            ${user.getState()} ${user.getZip()}
        </div>
        <div class="profiles-container">
            ${}
        </div>
    </div>

</body>
</html>