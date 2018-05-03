<%--
  Created by IntelliJ IDEA.
  User: Red
  Date: 4/30/18
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Matchmaster - Advanced Search</title>
</head>
<body>
<jsp:include page="views/header.jsp"></jsp:include>
<div class="search-container">
    <form class="searchCriteria" method="post" action="search">
        <ul>
            <li> <input type="text" name="profileID" placeholder="ProfileID.."></li>
            <li> Height: <input type="text" name="minHeight" placeholder="Min Height"> - <input type="text" name="maxHeight" placeholder="Max Height"></li>
            <li> Weight: <input type="text" name="minWeight" placeholder="Min Weight"> - <input type="text" name="maxWeight" placeholder="Max Weight"></li>
            <li> <select name="state" id="state">
                <option value="" selected="selected">Select a State</option>
                <option value="AL">Alabama</option>
                <option value="AK">Alaska</option>
                <option value="AZ">Arizona</option>
                <option value="AR">Arkansas</option>
                <option value="CA">California</option>
                <option value="CO">Colorado</option>
                <option value="CT">Connecticut</option>
                <option value="DE">Delaware</option>
                <option value="DC">District Of Columbia</option>
                <option value="FL">Florida</option>
                <option value="GA">Georgia</option>
                <option value="HI">Hawaii</option>
                <option value="ID">Idaho</option>
                <option value="IL">Illinois</option>
                <option value="IN">Indiana</option>
                <option value="IA">Iowa</option>
                <option value="KS">Kansas</option>
                <option value="KY">Kentucky</option>
                <option value="LA">Louisiana</option>
                <option value="ME">Maine</option>
                <option value="MD">Maryland</option>
                <option value="MA">Massachusetts</option>
                <option value="MI">Michigan</option>
                <option value="MN">Minnesota</option>
                <option value="MS">Mississippi</option>
                <option value="MO">Missouri</option>
                <option value="MT">Montana</option>
                <option value="NE">Nebraska</option>
                <option value="NV">Nevada</option>
                <option value="NH">New Hampshire</option>
                <option value="NJ">New Jersey</option>
                <option value="NM">New Mexico</option>
                <option value="NY">New York</option>
                <option value="NC">North Carolina</option>
                <option value="ND">North Dakota</option>
                <option value="OH">Ohio</option>
                <option value="OK">Oklahoma</option>
                <option value="OR">Oregon</option>
                <option value="PA">Pennsylvania</option>
                <option value="RI">Rhode Island</option>
                <option value="SC">South Carolina</option>
                <option value="SD">South Dakota</option>
                <option value="TN">Tennessee</option>
                <option value="TX">Texas</option>
                <option value="UT">Utah</option>
                <option value="VT">Vermont</option>
                <option value="VA">Virginia</option>
                <option value="WA">Washington</option>
                <option value="WV">West Virginia</option>
                <option value="WI">Wisconsin</option>
                <option value="WY">Wyoming</option>
            </select></li>
            <button>Search</button>

        </ul>
    </form>
</div>
<br>
<div class="search-result-container">
    <c:forEach var="profile" items="${resultProfileList}">
        <div class="profile-box">
            <form class="profile" method="post" action="newDateServlet">
                <input type="hidden" name="thisProfile" value="${profile}">
                <ul>
                    <li><c:out value="${profile.getID()}" /> <c:out value="${profile.getGender()}" /> </li>
                    <li>Hair Color: <c:out value="${profile.getColor()}"/></li>
                    <li>Height: <c:out value="${profile.getHeight()}" />  Weight: <c:out value="${profile.getWeight()}"/></li>
                    <li>Hobbies: <c:out value="${profile.getHobbies()}"/></li>
                    <li><button>Date</button></li>
                </ul>
            </form>
        </div>
    </c:forEach>
</div>
</body>
</html>
