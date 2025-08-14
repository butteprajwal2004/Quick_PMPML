<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*, com.itextpdf.text.*, com.itextpdf.text.pdf.* , com.itextpdf.text.pdf.PdfWriter , com.itextpdf.text.Image" %>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String badFeedback = request.getParameter("bad_feedback");
int id=-1;
Connection con = ConnectionProvider.getCon();
try {
    // Connect to the database


    // Insert the feedback into the database
    PreparedStatement ps = con.prepareStatement("INSERT INTO bad_feedback (name, email, bad_feedback) VALUES (?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
    ps.setString(1, name);
    ps.setString(2, email );
    ps.setString(3, badFeedback);
    ps.executeUpdate();
   
	ResultSet rs = ps.getGeneratedKeys();
	  if (rs.next()) {
	    id = rs.getInt(1);
	  }
	
	
	// Display a success message
	out.println("<h1>Thank you for submitting your Feedback and Sorry For Inconvinience!</h1>");
    ps.close();
    con.close();
} catch (Exception e) {
	out.println("<h1>Error submitting feedback:</h1>");
	out.println("<p>" + e.getMessage() + "</p>");
}
%>

