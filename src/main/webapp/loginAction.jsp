<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String user_id=request.getParameter("user_id");
String password=request.getParameter("password");


try{
	Connection con=ConnectionProvider.getCon();
	 Statement st=con.createStatement();
	  ResultSet rs=st.executeQuery("Select * from signup where user_id='"+user_id+"'and password='"+password+"'");
	  if(rs.next()){
		  response.sendRedirect("Userhome.jsp?msg=valid"); 
	  }
	  else{
		  response.sendRedirect("UserLogin.jsp?msg=invalid");
	  }
	
}
catch(Exception e){
	
	response.sendRedirect("UserLogin.jsp?msg=invalid");
	
     
}


%>
