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
    <div class="SiteName" style="float: left">
        Hello ${user.getUserName()}
        <a href="logoutProcess.jsp">Log Out</a>
        <a href="dashboard.jsp">Dashboard</a>
    </div>
    <div class="search-container" style="float: right; padding: 10px; text-align: right;">
       <form action="searchServlet">
           <input type="text" placeholder="Enter ProfileID to Search..." name="profileID">
           <button type="submit"><i class="fa fa-search"></i></button>
       </form>
    </div>
</div>
