<%--
  Created by IntelliJ IDEA.
  User: Ian
  Date: 5/2/2018
  Time: 8:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Matchmaster - login</title>
</head>



<style>

    .login-page {
        width: 360px;
        padding: 8% 0 0;
        margin: auto;
    }
    .form {
        position: relative;
        z-index: 1;
        background: #FFFFFF;
        max-width: 360px;
        margin: 0 auto 100px;
        padding: 45px;
        text-align: center;
        box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
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
    .form .message {
        font-family: "Roboto", sans-serif;
        margin: 15px 0 0;
        color: #b3b3b3;
        font-size: 12px;
    }
    .form .message a {
        font-family: "Roboto", sans-serif;
        color: #4CAF50;
        text-decoration: none;
    }

    .form .register-form {
        display: none;
    }

</style>
<body>
<div class="login-page">
    <div class="form">
        <form class="login-form" action="login" method="post">
            <input type="text" name="user" placeholder="Username">
            <input type="password" name="pwd" placeholder="Password"><br>

            <%String msg = (String)request.getAttribute("err");%>

            <% if(!msg.equals("")){ %>
            <p style = "color:red"> <%= msg %></p>
            <% }%>

            <button>Login</button>
            <p class="message">Not Registered? <a href="register">Create an Account</a></p>
        </form>
    </div>
</div>
<!-- <script src='//static.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script><script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
 <script >$('.message a').click(function(){
     $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
 });
 //# sourceURL=pen.js
 </script>-->
</body>
</html>
