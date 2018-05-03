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
    <div class="edit-account-container">
        <form class="update-account-form" method="post" action="updateAccountServlet">
            ${account.getAcctNum()}<br>
            <input type="hidden" name="thisAccount" value="${account}">
            <input type="text" name="cardNum" Placeholder="Enter new card number..">
            <button>Submit</button>
        </form>
        <form class="delete-account-form" method="post" action="deleteAccountServlet">
            <input type="hidden" name="thisAccount" value="${account}">
            <button>Delete</button>
        </form>
    </div>
</body>
</html>
