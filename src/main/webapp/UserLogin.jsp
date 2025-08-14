<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">   
  <link rel="stylesheet" type="text/css" href="style1.css">  
  </head>
<body>
<div class="hero">
<div class="form-box">
<div class="button-box">
<div id="btn"></div>
<button type="button" class="toggle-btn" onclick="login()">Login</button>
<button type="button" class="toggle-btn" onclick="SignUp()">SignUp</button>
</div>
<div class="social-icons">
<img src="fac.png">
<img src="google.png">
<img src="twit.png">
</div>
<form id="login" action="loginAction.jsp"  class="input-group">
<%
  String msg=request.getParameter("msg");
  if("valid".equals(msg))
  {
	  %>
	  <center><font color="#25b7c4" size="2">LOGIN SUCCESSFULLY</font></center>
	  <% 
	  
  }
  %>
  <% 
   if("invalid".equals(msg))
  {
	  %>
	  <center><font color="#25b7c4" size="2">INVALID USERNAME AND PASSWORD</font></center>
	  <% 
	  
  }
  %>
<input type="text" name="user_id"  class="input-field"  placeholder="User Id" required>
<input type="password" name="password"  class="input-field"  placeholder="Enter Password" required>
<input type="checkbox" class="check-box"><span>Remember Password</span>
<button type="submit" class="submit-btn">Login</button>
<center><h5><a href="index.html">Back</a></h5></center>


</form>
<form id="SignUp" action="SignupAction.jsp" class="input-group">
<%
  String msg1=request.getParameter("msg1");
  if("valid".equals(msg1))
  {
	  %>
	  <center><font color="black" size="5"><b>SIGNUP SUCCESSFULLY</b></font></center>
	  <% 
	  
  }
  %>

<input type="text" name="user_id" class="input-field"  placeholder="User Id" required>
<input type="email" name="email_id" class="input-field"  placeholder="Email Id" required>
<input type="password" name="password" class="input-field"  placeholder="Enter Password" required>
<input type="checkbox" class="check-box" required><span>I agree to the terms & conditions </span>
<button type="submit" class="submit-btn">SignUp</button>
</form>
</div>
</div>
<script>
var x=document.getElementById("login");
var y=document.getElementById("SignUp");
var z=document.getElementById("btn");
function SignUp(){
	x.style.left="-400px";
	y.style.left="50px";
	z.style.left="110px";
}
function login(){
	x.style.left="50px";
	y.style.left="450px";
	z.style.left="0";
}
</script>

</body>
</html>
  