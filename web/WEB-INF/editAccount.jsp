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
        <form class="update-account-form" method="post" action="editAccount">
            ${account.getAcctNum()}<br>
            <input type="hidden" name="acctNum" value="${thisAccount.getAcctNum()}">
                <input type="hidden" name="ssn" value="${thisAccount.getSsn()}">
            <input type="text" name="cardNum" Placeholder="Enter new card number..">
            <button>Submit</button>
        </form>
        <form class="delete-account-form" method="post" action="editAccount">
            <input type="hidden" name="acctNum" value="${thisAccount.getAcctNum()}">
            <input type="hidden" name="ssn" value="${thisAccount.getSsn()}">
            <input type="hidden" name="cardNum" value="${thisAccount.getCardNum()}">
            <input type="hidden" name="verb" value="delete">
            <button>Delete</button>
        </form>
    </div>
</body>
</html>
