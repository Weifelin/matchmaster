<%--
  Created by IntelliJ IDEA.
  User: Red
  Date: 4/30/18
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="header" style="background: #E0E0E0; height: 55px; padding: 5px;">
    <div class="SiteName" style="float: left; text-align: center; display: block; font-size: 14px;  font-family: sans-serif; " >
        Hello ${user.getUserName()}
        <a href="logout">Log Out</a>
        <a href="userdash">Dashboard</a>
    </div>
    <div class="search-container" style="float: right; padding: 10px; text-align: right;">
       <form action="search">
           <input type="text" placeholder="Enter ProfileID to Search..." name="profileID" style="font-family: sans-serif; outline: 0; background: #f2f2f2; border: 0;  box-sizing: border-box; ">
           <button type="submit" style="font-family: sans-serif; outline: 0; background: #4CAF50; border: 0; color: #FFFFFF; font-size: 14px; cursor: pointer;">Submit</button>
       </form>
    </div>
</div>
