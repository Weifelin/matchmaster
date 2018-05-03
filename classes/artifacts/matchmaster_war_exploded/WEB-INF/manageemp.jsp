<%--
  Created by IntelliJ IDEA.
  User: Ian
  Date: 5/2/2018
  Time: 7:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Manager - employees</title>
</head>
<body>
<div class = "search-result-container">
    <h2>Employees:</h2>
    <c:forEach var = "emp" items ="${emplist}">
        <div class = "emp-box">
            <ul>
                <li><c:out value = "${emp.getFirst()}" /> <c:out value = "${emp.getLast()}" /></li>
                <li>Hourly Rate: $ <c:out value = "${emp.getRate()}" /></li>
                <li>Start Date: <c:out value = "${emp.getStartDate()}" /></li>
            </ul>

        </div>


    </c:forEach>

</div>
<div>
    <p>Add a new employee:</p>
    <form action = "addemp" method = post>
        <input type = "submit" value = "add">
    </form>
</div>
</body>
</html>
