<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Matchmaster - Register</title>
</head>

<style>

    .register-page {
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

    .form .login-form {
        display: none;
    }

</style>

<body>
<div class="register-page">
    <div class="form">
        <form class="register-form" action="register" method="post">
        	<%String msg = (String)request.getAttribute("err");%>
        	       	
        	<% if(!msg.equals("")){ %>
        		<p style = "color:red"> <%= msg %></p>
        	<% }%> 
        	
        	
            <input type="text" name="firstname" placeholder="First Name"> 
            <input type="text" name="lastname" placeholder="Last Name"><br>
            <input type="text" name="email" placeholder="Email"><br>
            <input type="password" name="pwd" placeholder="Password"><br>
            <input type="text" name="SSN" placeholder="SSN"> 
            <input type="text" name="phone" placeholder="Phone Number"><br>
            <input type="text" name="street" placeholder="Street"><br>
            <input type="text" name="city" placeholder="City"><br>
            <input type="text" name="state" placeholder="State"> 
            <input type="text" name="zip" placeholder="Zip Code"><br>
            <input type="text" name="credit" placeholder="Credit Card #"><br>
            <select name = "ppp">
            	<option value = "0">User-user(free)</option>
            	<option value = "50">Good-User($50/yr)</option>
            	<option value = "100">Super-User($100/yr)</option>
            </select>
            <button>create</button>
            <p class="message">Already registered? <a href="login">Sign In</a></p>
        </form>
    </div>
</div>
</body>
</html>