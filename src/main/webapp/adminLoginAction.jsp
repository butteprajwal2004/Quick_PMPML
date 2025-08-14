<%
String username=request.getParameter("username");
String password=request.getParameter("password");
if(username.equals("admin")&& password.equals("root"))
{
	response.sendRedirect("adminhome.jsp");
}
else{
   response.sendRedirect("adminLogin.jsp?msg=invalid");
}
%>