<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String user_id=request.getParameter("username");
String password=request.getParameter("password");


try{
	Connection con=ConnectionProvider.getCon();
	 Statement st=con.createStatement();
	  ResultSet rs=st.executeQuery("Select * from conductor where username='"+user_id+"'and password='"+password+"'");
	  if(rs.next()){
		  response.sendRedirect("Conductor_Home.jsp?msg=valid"); 
	  }
	  else{
		  response.sendRedirect("ConductorLogin.jsp?msg=invalid");
	  }
	
}
catch(Exception e){
	
	response.sendRedirect("ConductorLogin.jsp?msg=invalid");
	
     
}


%>
