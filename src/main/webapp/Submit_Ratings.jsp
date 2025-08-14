<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*, com.itextpdf.text.*, com.itextpdf.text.pdf.* , com.itextpdf.text.pdf.PdfWriter , com.itextpdf.text.Image" %>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Submit Ratings</title>
</head>
<body>
	<%
		// Get the rating from the HTTP request
		String ratings = request.getParameter("rating");
		int id=-1;
	Connection con = ConnectionProvider.getCon();
	
		try {
			// Establish the database connection
			
			PreparedStatement st = con.prepareStatement("insert into good_feedback (ratings) values (?)", Statement.RETURN_GENERATED_KEYS);
	
			st.setString(1, ratings);
			
			// Execute the SQL statement
			st.executeUpdate();
			ResultSet rs = st.getGeneratedKeys();
			  if (rs.next()) {
			    id = rs.getInt(1);
			  }
			  st.close();
			  con.close();
			
			// Display a success message
			out.println("<h1>Thank you for submitting your rating!</h1>");
			
		} catch (Exception e) {
			// Display an error message if there was a problem with the database connection or SQL statement
			out.println("<h1>Error submitting rating:</h1>");
			out.println("<p>" + e.getMessage() + "</p>");
		} 
	%>
</body>
</html>
