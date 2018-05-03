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
    <h1 align="center">General Statistics</h1>
    <div class="column">
        <h2 align="center">Most Active Profiles</h2>
            <ol>
            <c:forEach items="${mostActiveProfiles}" var="profile">
               <li><c:out value="${profile}"/></li>
            </c:forEach>
            </ol>
    </div>
    <div class="column"></div>
    <div class="column"></div>
</body>
</html>
