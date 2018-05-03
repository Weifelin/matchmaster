<%--
  Created by IntelliJ IDEA.
  User: Red
  Date: 4/30/18
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Matchmaster - Dashboard</title>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="dashboard-container">
        <div class="userinfo-container">
            <form class="user-info-container" method="post" action="editUserInfoServlet" target="_blank">
                <input type="hidden" name="thisUser" value="${user}">
                <h3>${user.username}</h3>
                ${user.rating} <br>
                ${user.email} ${user.phone} <br>
                ${user.street} ${user.city} <br>
                ${user.state} ${user.zip} <br>
                <button>Edit</button>
            </form>
        </div>
        <div class="accounts-container">
            <c:forEach var="account" items="${accountList}">
                <div class="account-box">
                    <form class="account" method="post" action="EditAccountServlet" target="_blank">
                        <input type="hidden" name="thisAccount" value="${account}">
                        <ul>
                            <li><c:out value="${account.acctNum}"/></li>
                            <li><c:out value="${account.cardNum}"/></li>
                            <li><button>Edit</button></li>
                        </ul>
                    </form>
                </div>
            </c:forEach>
            <form class="addNewAccountButton" method="post" action="addNewAccountServlet" target="_blank">
                <input type="hidden" name="ssn" value="${user.ssn}">
                <button>Add New Account</button>
            </form>
        </div>
        <br>
        <div class="profiles-container">
            <c:forEach var="profile" items="${profileList}">
                <div class="profile-box">
                    <form class="profile" method="post" action="editProfileServlet" target="_blank">
                        <input type="hidden" name="thisProfile" value="${profile}">
                        <ul>
                            <li><c:out value="${profile.profileID}" /> <c:out value="${profile.gender}" /> </li>
                            <li>Height: <c:out value="${profile.height}" />  Weight: <c:out value="profile.weight"/></li>
                            <li><button>Edit</button></li>
                        </ul>
                    </form>
                </div>
            </c:forEach>
            <form class="addProfileButton" method="post" action="addProfileServlet" target="_blank">
                <input type="hidden" name="ssn" value="${user.ssn}">
                <button>Add New Profile</button>
            </form>
        </div>
        <br>
        <div class="dates-container">
            <c:forEach var="date" items="${upcomingDateList}">
                <div class="date-box">
                    <form class="upcoming-date" method="post" action="editDateServlet" target="_blank">
                        <input type="hidden" name="thisDate" value="${date}">
                        <ul>
                            <li><c:out value="${date.profile1.profileID}"/> with <c:out value="${date.profile2.profileID}"/></li>
                            <li>Time: <c:out value="${date.time}"/></li>
                            <li>Location: <c:out value="${date.location}"/></li>
                            <li>Customer Representative: <c:out value="${date.custRep}"/></li>
                            <li><input type="text" name="comment" placeholder="Comment Here.."></li>
                            <li><button>Add Comment</button></li>
                        </ul>
                    </form>
                    <form class="delete-date" method="post" action="deleteDateServlet">
                        <input type="hidden" name="thisDate" value="${date}">
                        <button>Delete Date</button>
                    </form>
                </div>
            </c:forEach>
            <form class="pastDate"  action="pastDateServlet"><%-- pastDateServlet redirect to a new page(open new page, pastDates.jsp) that shows past dates. --%>
                <button>Check Past Date</button>
            </form>
        </div>

        <div class="suggested-container">
            <c:forEach var="profile" items="${suggestedProfileList}">
                <div class="profile-box">
                    <form class="profile" method="post" action="newDateServlet">
                        <input type="hidden" name="thisProfile" value="${profile}">
                        <ul>
                            <li><c:out value="${profile.profileID}" /> <c:out value="${profile.gender}" /> </li>
                            <li>Hair Color: <c:out value="${profile.hairColor}"/></li>
                            <li>Height: <c:out value="${profile.height}" />  Weight: <c:out value="profile.weight"/></li>
                            <li>Hobbies: <c:out value="${profile.hobbies}"/></li>
                            <li><button>Date</button></li>
                        </ul>
                    </form>
                </div>
            </c:forEach>
        </div>
        <br>
        <a class="statistic" href="Statistics">Statistics</a><br>
    </div>

</body>
</html>
