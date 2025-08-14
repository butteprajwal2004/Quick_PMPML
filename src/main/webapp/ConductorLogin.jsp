<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">   
  <link rel="stylesheet" type="text/css" href="style.css">  
  <style>
  .login-box{
    height: 380px;
}
h3
{
	color:black;
}</style>
</head>
<body>
 <%
  String msg=request.getParameter("msg");
  if("invalid".equals(msg))
  {
	  %>
	  <center><font color="black" size="5">INVALID USERNAME OR PASSWORD</font></center>
	  <% 
	  
  }
  %>
    <form method="post" action="Conductor_Login_Action.jsp">
    <div class="login-box">
    <img src="user.png" class="avatar">
        
            <p>Username</p>
            <input type="text" name="username" placeholder="Enter Username" required="required">
            <p>Password</p>
            <input type="password" name="password" placeholder="Enter Password" required="required">
            <input type="submit" name="submit" value="Login">
            </form>
             <center><h1><a href="index.html">Back</a></h1></center>
        </div>   
    </body>
</html>
