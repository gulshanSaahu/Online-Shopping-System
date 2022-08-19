<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<link rel="stylesheet" href="css/signup-style.css">
</head>
<body>
<div id='container'>
<div class='signup'>
<form action="loginAction.jsp" method="post">
<input type="email" name="email" placeholder="Enter Email" required>
<input type="password" name="password" placeholder="Enter Password" required>
<input type="submit" value="login">


</form>
<h2><a href="signup.jsp">SignUp</a></h2>
<h2><a href="forgotPassword.jsp">Forgot Password</a></h2>
</div>
<div class='whysignLogin'>
<%
String msg=request.getParameter("msg");
if("notexits".equals(msg))
{

%>
<h1>Incorrect Username or Password</h1>
<%} %>

<%
if("invalid".equals(msg))
{

%>
<h1>Some thing Went Wrong! Try Again !</h1>
<%} %>
    <h2 >Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
     <img src="super.jpg"  width="300" height="100">
</div>

</div>
</body>
</html>