<%--
  Created by IntelliJ IDEA.
  User: Red
  Date: 4/30/18
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header" style="background: #E0E0E0; height: 55px; padding: 5px;">
    <div class="SiteName" style="float: left">
        Hello ${user.getUserName()}
        <a href="logoutProcess.jsp">Log Out</a>
    </div>
    <div class="search-container" style="float: right; padding: 10px; text-align: right;">
       <form action="/WEB-INF/advancedSearch.jsp">
           <input type="text" placeholder="Search.." name="search">
           <button type="submit"><i class="fa fa-search"></i></button>
       </form>
    </div>
</div>
