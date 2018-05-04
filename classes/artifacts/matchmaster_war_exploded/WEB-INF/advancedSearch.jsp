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
<style>
    .page-container{
        font-family: "Roboto", sans-serif;
        width: 90%;
        padding: 8% 0 0;
        margin: auto;
    }

    .search-container {
        position: relative;
        background: #FFFFFF;
        width: 80%;
        margin: 0 auto 15px;
        padding: 15px;
        text-align: center;
        font-size: 14px;
        box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
    }

    .search-container input{
        outline: 0;
        background: #f2f2f2;
        width: 40%;
        border: 0;
        margin: 0 0 15px;
        padding: 15px;
        box-sizing: border-box;
        font-size: 14px;
    }

    .search-container button{
        outline: 0;
        background: #4CAF50;
        width: 70px;
        border: 0;
        padding: 15px;
        color: #FFFFFF;
        font-size: 14px;
        cursor: pointer;
        text-align: center;
        alignment: center;
    }

    .search-container button:hover,.form button:active,.form button:focus {
        background: #43A047;
    }

    .search-result-container {
        position: relative;
        z-index: 1;
        background: #FFFFFF;
        max-width: 90%;
        margin: 0 auto 100px;
        padding: 15px;
        text-align: center;
        box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
    }

    .profile-box button{
        outline: 0;
        background: #4CAF50;
        width: 70px;
        border: 0;
        padding: 15px;
        color: #FFFFFF;
        font-size: 14px;
        cursor: pointer;
        text-align: center;
        height: fit-content;
        alignment: bottom;
    }

    .profile-box button:hover,.form button:active,.form button:focus {
        background: #43A047;
    }

    .profile-box{
        position: relative;
        z-index: 2;
        background: #FFFFFF;
        width: 200px;
        height: 200px;

        padding: 15px;
        text-align: left;
        float: left;
        margin-right: 15px;
        margin-bottom: 15px;
        box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
    }

</style>
<body>
<jsp:include page="views/header.jsp"></jsp:include>

<div class="page-container">
    <div class="search-container">
        <form class="searchCriteria" method="post" action="search">

                 <input type="text" name="profileID" placeholder="ProfileID.."><br>
                 <div class="height-weight-c" style="text-align: center">
                     Height: <input type="text" name="minHeight" placeholder="Min Height"> - <input type="text" name="maxHeight" placeholder="Max Height" style="alignment: right"><br>
                     Weight: <input type="text" name="minWeight" placeholder="Min Weight"> - <input type="text" name="maxWeight" placeholder="Max Weight" style="alignment: right"><br>
                 </div>
                <select style="text-align: center" name="state" id="state">
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
                </select><br>
                <button>Search</button>

            </ul>
        </form>
    </div>
    <br>
    <%--<section class="search-result-container">--%>
        <c:forEach var="profile" items="${resultProfileList}">
            <div class="profile-box">
                <form class="profile" method="post" action="newDateServlet">
                    <input type="hidden" name="thisProfile" value="${profile}">

                        <c:out value="${profile.getID()}" /> <c:out value="${profile.getGender()}" /> <br>
                        Hair Color: <c:out value="${profile.getHairColor()}"/> <br>
                        Height: <c:out value="${profile.getHeight()}" />  Weight: <c:out value="${profile.getWeight()}"/> <br>
                        Hobbies: <c:out value="${profile.getHobbies()}"/><br>
                        <button>Date</button>
                </form>
            </div>
        </c:forEach>
    <%--</section>--%>
</div>
</body>
</html>
