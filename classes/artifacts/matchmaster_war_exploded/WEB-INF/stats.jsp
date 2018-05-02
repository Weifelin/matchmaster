<%--
  Created by IntelliJ IDEA.
  User: ajaff
  Date: 4/30/2018
  Time: 8:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<style>
    .column {
        float: left;
        width: 33.33%;
    }
    .row:after {
        content: "";
        display: table;
        clear: both;
    }
</style>
<head>
    <title>Matchmaster Statistics</title>
</head>
<body>
    <div class="column">
        <h2>Most Active Profiles</h2>
        <table border="1" cellpadding="5" cellspacing="1">
            <tr>
                <th>Profile</th>
            </tr>
            <c:forEach items="${mostActiveProfiles}" var="profile">
                <tr>${profile}</tr>
            </c:forEach>
        </table>
    </div>
    <div class="column"></div>
    <div class="column"></div>
</body>
</html>
