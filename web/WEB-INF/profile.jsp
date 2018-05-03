<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: ajaff
  Date: 5/3/2018
  Time: 2:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Matchmaster - Profile: ${pid}</title>
</head>
<style>
    .profile-container {
        width: 360px;
        padding: 8% 0 0;
        margin: auto;

        font-family: "Roboto", sans-serif;
        position: relative;
        z-index: 1;
        background: #FFFFFF;
        max-width: 360px;
        margin: 0 auto 100px;
        padding: 45px;
        text-align: center;
        box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
    }

    .profile-container input {
        outline: 0;
        background: #f2f2f2;
        width: 100%;
        border: 0;
        margin: 0 0 15px;
        padding: 15px;
        box-sizing: border-box;
        font-size: 14px;
    }

    .profile-container button{
        outline: 0;
        background: #4CAF50;
        width: 100%;
        border: 0;
        padding: 15px;
        color: #FFFFFF;
        font-size: 14px;
        cursor: pointer;
    }

    .profile-container button:hover,.form button:active,.form button:focus {
        background: #43A047;
    }

    fieldset{
        border: 0px;
    }

</style>
<body>
    <div class="profile-container" align="center">
        <h3>Profile: ${pid}</h3>
        <form method="post" action="profile?pid=${pid}">
            <fieldset <c:if test="${!profile.getSSN().equals(user.getSsn())}">disabled</c:if>>
                Profile ID     : <input type="text" name="newpid" value="${profile.getID()}"> <br>
                Age            : <input type="text" name="age" value="${profile.getAge()}"> <br>
                Age Range Lower: <input type="text" name="ageRangeStart" value="${profile.getAgeRangeStart()}"> <br>
                Age Range Upper: <input type="text" name="ageRangeEnd" value="${profile.getAgeRangeEnd()}"> <br>
                Geo Range      : <input type="text" name="geoRange" value="${profile.getGeoRange()}"> <br>
                Gender         : <select name="gender">
                                    <option value="Male" ${profile.getGender().toString().equals("Male") ? 'selected' : ''}>Male</option>
                                    <option value="Female" ${profile.getGender().toString().equals("Female") ? 'selected' : ''}>Female</option>
                                    <option value="Other" ${profile.getGender().toString().equals("Other") ? 'selected' : ''}>Other</option>
                                 </select> <br>
                Hobbies        : <input type="text" name="hobbies" value="${String.join(", ", profile.getHobbies())}"> <br>
                Height(inches) : <input type="text" name="height" value="${profile.getHeight()}"> <br>
                Weight(lbs)    : <input type="text" name="weight" value="${profile.getWeight()}"> <br>
                Hair Color     : <select name="hairColor">
                                    <option value="Blonde" ${profile.getHairColor().toString().equals("Blonde") ? 'selected' : ''}>Blonds</option>
                                    <option value="Brown" ${profile.getHairColor().toString().equals("Brown") ? 'selected' : ''}>Brown</option>
                                    <option value="Black" ${profile.getHairColor().toString().equals("Black") ? 'selected' : ''}>Black</option>
                                    <option value="Red" ${profile.getHairColor().toString().equals("Red") ? 'selected' : ''}>Red</option>
                                 </select>
                <input type="hidden" name="creationDate" value="${profile.getCreationDate().toString()}">
                <c:out value="${err}"/>
                ${profile.getSSN().equals(user.getSsn()) ? "<button>Submit</button>" : ""}

            </fieldset>

        </form>
    </div>
</body>
</html>
