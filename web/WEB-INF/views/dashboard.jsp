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
<style>

    .dashboard-container{
        font-family: "Roboto", sans-serif;
        width: 90%;
        padding: 8% 0 0;
        margin: auto;
    }

    .user-info-container {
        position: relative;
        top: 10px;
        left:10px;
        z-index: 1;
        background: #FFFFFF;
        width: 40%;
        margin: 0 auto 15px;
        padding: 15px;
        text-align: center;
        font-size: 14px;
        box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
    }

    .user-info-container button {
        ont-family: "Roboto", sans-serif;
        text-transform: uppercase;
        outline: 0;
        background: #4CAF50;
        border: 0;
        padding: 15px;
        color: #FFFFFF;
        font-size: 12px;
    //-webkit-transition: all 0.3 ease;
    //transition: all 0.3 ease;
        cursor: pointer;
    }

    .user-info-container button:hover,.form button:active,.form button:focus {
        background: #43A047;
    }

    .accounts-container {
        position: relative;
        z-index: 1;
        background: #FFFFFF;
        max-width: 90%;
        margin: 0 auto 100px;
        padding: 15px;
        text-align: center;
        box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
    }

    .account-box{
        position: relative;
        z-index: 2;
        background: #FFFFFF;
        max-width: 90%;
        margin: 0 auto 10px;
        padding: 15px;
        text-align: center;
        box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
    }

    .accounts-container button {
        font-family: "Roboto", sans-serif;
        text-transform: uppercase;
        outline: 0;
        background: #4CAF50;
        width: 100%;
        border: 0;
        padding: 15px;
        color: #FFFFFF;
        font-size: 14px;
    //-webkit-transition: all 0.3 ease;
    //transition: all 0.3 ease;
        cursor: pointer;
    }

    .account-box button:hover,.form button:active,.form button:focus {
        background: #43A047;
    }

    .profiles-container {
        position: relative;
        z-index: 1;
        background: #FFFFFF;
        max-width: 90%;
        margin: 0 auto 100px;
        padding: 15px;
        text-align: center;
        box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
    }

    .profile-box{
        position: relative;
        z-index: 2;
        background: #FFFFFF;
        max-width: 200px;

        padding: 15px;
        text-align: center;
        float: left;
        margin-right: 15px;
        box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
    }

    .profiles-container button {
        font-family: "Roboto", sans-serif;
        text-transform: uppercase;
        outline: 0;
        background: #4CAF50;
        width: 100%;
        border: 0;
        padding: 15px;
        color: #FFFFFF;
        font-size: 14px;
        margin-top: 10px;
    //-webkit-transition: all 0.3 ease;
    //transition: all 0.3 ease;
        cursor: pointer;

    }

    .profiles-container button:hover,.form button:active,.form button:focus {
        background: #43A047;
    }

    /*Now start dates containers*/
    .dates-container {
        position: relative;
        z-index: 1;
        background: #FFFFFF;
        max-width: 90%;
        margin: 0 auto 100px;
        padding: 15px;
        text-align: center;
        box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
    }

    .date-box{
        position: relative;
        z-index: 2;
        background: #FFFFFF;
        max-width: 200px;
        margin: 0 auto 10px;
        padding: 15px;
        text-align: center;
        box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
    }

    .dates-container input {
        font-family: "Roboto", sans-serif;
        outline: 0;
        background: #f2f2f2;
        width: 100%;
        border: 0;
        margin: 0 0 15px;
        padding: 15px;
        box-sizing: border-box;
        font-size: 14px;
    }


    .dates-container button {
        font-family: "Roboto", sans-serif;
        text-transform: uppercase;
        outline: 0;
        background: #4CAF50;
        width: 100%;
        border: 0;
        padding: 15px;
        color: #FFFFFF;
        font-size: 14px;
    //-webkit-transition: all 0.3 ease;
    //transition: all 0.3 ease;
        cursor: pointer;
    }

    .dates-container button:hover,.form button:active,.form button:focus {
        background: #43A047;
    }

    /* Suggested container*/

    .suggested-container {
        position: relative;
        z-index: 1;
        background: #FFFFFF;
        max-width: 90%;
        margin: 0 auto 100px;
        padding: 15px;
        text-align: center;
        box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
    }



    .suggested-container button {
        font-family: "Roboto", sans-serif;
        text-transform: uppercase;
        outline: 0;
        background: #4CAF50;
        width: 100%;
        border: 0;
        padding: 15px;
        color: #FFFFFF;
        font-size: 14px;
    //-webkit-transition: all 0.3 ease;
    //transition: all 0.3 ease;
        cursor: pointer;
    }

    .suggested-container button:hover,.form button:active,.form button:focus {
        background: #43A047;
    }




    .form input {
        font-family: "Roboto", sans-serif;
        outline: 0;
        background: #f2f2f2;
        width: 100%;
        border: 0;
        margin: 0 0 15px;
        padding: 15px;
        box-sizing: border-box;
        font-size: 14px;
    }

    .form button {
        font-family: "Roboto", sans-serif;
        text-transform: uppercase;
        outline: 0;
        background: #4CAF50;
        width: 100%;
        border: 0;
        padding: 15px;
        color: #FFFFFF;
        font-size: 14px;
    //-webkit-transition: all 0.3 ease;
    //transition: all 0.3 ease;
        cursor: pointer;
    }

    .form button:hover,.form button:active,.form button:focus {
        background: #43A047;
    }



</style>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="dashboard-container">
        <div class="userinfo-container">
            <form class="user-info-container" method="post" action="editUserInfo">
                <input type="hidden" name="thisUser" value="${user}">
                <h3>${user.getUserName()}</h3>
                ${user.getEmail()} <br>
                Phone: ${user.getPhone()} <br>
                ${user.getStreet()}
                <br> ${user.getCity()},
                ${user.getState()} ${user.getZip()} <br>
                <button>Edit</button>
            </form>
        </div>
        <br>
        <div class="accounts-container">
            <c:forEach var="account" items="${accountList}">
                <div class="account-box">
                    <form class="account" method="post" action="editAccountServlet" target="_blank">
                        <input type="hidden" name="thisAccount" value="${account}">

                            <c:out value="${account.getAcctNum()}"/>
                            <c:out value="${account.getCardNum()}"/>
                            <button>Edit</button>

                    </form>
                </div>
            </c:forEach>
            <form class="addAccount" method="post" action="addAccountServLet" target="_blank">
                <input type="hidden" name="ssn" value="${user.ssn}">
                <button>Add New Account</button>
            </form>
        </div>
        <br>
        <section class="profiles-container">
            <c:forEach var="profile" items="${profileList}">
                <div class="profile-box">
                    <form class="profile" method="get" action="profile" target="_blank">
                        <%--<input type="hidden" name="thisProfile" value="${profile}">--%>
                        <input type="hidden" name="pid" value="${profile.getID()}">

                            <c:out value="${profile.getID()}" /> <c:out value="${profile.getGender()}" />
                            Height: <c:out value="${profile.getHeight()}" />  Weight: <c:out value="${profile.getWeight()}"/>
                            <button>Edit</button>

                    </form>
                    <form class="profile" method="post" action="profile">
                        <input type="hidden" name="pid" value="${profile.getID()}">
                        <input type="hidden" name="delete" value="${true}">
                        <button>Delete ${profile.getID()}</button>
                    </form>
                </div>
            </c:forEach>
            <form class="addProfileButton" method="get" action="profile" target="_blank">
                <%--<input type="hidden" name="ssn" value="${user.ssn}">--%>
                <input type="hidden" name="pid" value="">
                <button>Add New Profile</button>
            </form>
        </section>
        <br>
        <div class="dates-container">
            <c:forEach var="date" items="${upcomingDateList}">
                <div class="date-box">
                    <form class="upcoming-date" method="post" action="modDate" target="_blank">
                        <input type="hidden" name="thisDate" value="${date}">

                        <input type="hidden" name="verb" value="addComment">

                            <c:out value="${date.getProfile1.getID()}"/> with <c:out value="${date.getProfile2.getID()}"/>
                            Time: <c:out value="${date.getDateTime()}"/>
                            Location: <c:out value="${date.getLocation()}"/>
                            Customer Representative: <c:out value="${date.getCustRep()}"/>
                            Comments: <c:out value="${date.getComments()}"/>
                            <input type="text" name="comment" placeholder="Comment Here..">
                            <button>Add Comment</button></li>


                    </form>
                    <form class="delete-date" method="post" action="deleteDateServlet">
                        <input type="hidden" name="thisDate" value="${date}">
                        <input type="hidden" name="verb" value="delete">
                        <button>Delete Date</button>
                    </form>
                </div>
            </c:forEach>
            <form class="pastDate"  action="pastDateServlet" target="_blank"><%-- pastDateServlet redirect to a new page(open new page, pastDates.jsp) that shows past dates. --%>
                <input type="text" name="profileID" placeholder="Enter profile id to check past dates">
                <button>Check Past Date</button>
            </form>
        </div>

        <div class="suggested-container">
            <c:forEach var="profile" items="${suggestedProfileList}">
                <div class="profile-box">
                    <form class="profile" method="get" action="newDateServlet">
                        <input type="hidden" name="thisProfile" value="${profile}">

                            <c:out value="${profile.getProfileID()}" /> <c:out value="${profile.getGender()}" />
                            Hair Color: <c:out value="${profile.getHairColor()}"/>
                            Height: <c:out value="${profile.getHeight()}" />  Weight: <c:out value="${profile.Weight()}"/>
                            Hobbies: <c:out value="${profile.getHobbies()}"/>
                            <button>Date</button>

                    </form>
                </div>
            </c:forEach>
        </div>
        <br>
        <a class="statistic" href="http://andrewjaffie.me/matchmaster/stats">Statistics</a><br>
    </div>

</body>
</html>
