<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String user_id=request.getParameter("user_id");
String email_id=request.getParameter("email_id");
String password=request.getParameter("password");


try{
	Connection con=ConnectionProvider.getCon();
	 Statement st=con.createStatement();
     st.executeUpdate("insert into signup values('"+user_id+"','"+email_id+"','"+password+"')");
	response.sendRedirect("UserLogin.jsp?msg1=valid");
}
catch(Exception e){
	 out.println(e.getMessage());
	
	
}


%>
