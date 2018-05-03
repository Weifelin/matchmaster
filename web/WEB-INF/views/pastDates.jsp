<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Red
  Date: 5/3/18
  Time: 04:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Matchmaster - Past Dates</title>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="passed-dates-container">
        <c:forEach var="date" items="${pastDateList}">
            <div class="date-box">
                <ul>
                    <li><c:out value="${date.profile1.profileID}"/> with <c:out value="${date.profile2.profileID}"/></li>
                    <li>Time: <c:out value="${date.time}"/></li>
                    <li>Location: <c:out value="${date.location}"/></li>
                    <li>Customer Representative: <c:out value="${date.custRep}"/></li>
                    <li>Comment: <c:out value="${date.getComment()}"/></li>
                    <li><button>Add Comment</button></li>
                </ul>
            </div>
        </c:forEach>
    </div>

</body>
</html>
