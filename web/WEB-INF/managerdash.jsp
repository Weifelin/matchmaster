<%--
  Created by IntelliJ IDEA.
  User: Ian
  Date: 5/2/2018
  Time: 5:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>


    </style>
    <title>Manager - dashboard</title>
</head>
<body>
    <div>
        <form action = "manageemployees" method = post>
            <button>Manage Employees</button>
        </form>
    </div>
    <div>
        <p>Select a report to print:</p>

    </div>

    <form action = "managereports" method = post>
        <select>
            <option value = "1">Monthly sales report (please enter month + year)</option>
            <option value = "2">User list</option>
            <option value = "3">List dates by customer</option>
            <option value = "4">List dates by calender date</option>

            <option value = "5">Revenue report for a customer</option>
            <option value = "6">Revenue report for a calender date</option>
            <option value = "7">Customer Representative sales report</option>
            <option value = "8">Customer revenue report</option>

            <option value = "9">List most active customers</option>
            <option value = "10">List customers by common date partner (provide customer ssn)</option>
            <option value = "11">List highest-rated customers</option>
            <option value = "12">List highest-rated calender dates</option>
        </select><br />
        <input name = "date" type = "date" class = "date"><br />
        <input name = "ssn" type = "text" class = "userssn" placeholder="User ssn"><br />
        <input name = "month" type = "month" class = "month"><br />
        <input type = "submit">
    </form>
</body>
</html>
