<%@ page import="java.io.*,java.lang.*, java.util.*, com.itextpdf.text.*, com.itextpdf.text.pdf.* , com.itextpdf.text.pdf.PdfWriter , com.itextpdf.text.Image" %>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
try{
// Get form data from request
String name = request.getParameter("name");
String email = request.getParameter("email");
String mobile = request.getParameter("mobile");
String paymentId = request.getParameter("payment_id");
String paymentDate = request.getParameter("date");
String payment_time = request.getParameter("time");
int id=-1;

// Connect to database
Connection con = ConnectionProvider.getCon();

// Insert form data into database
PreparedStatement ps = con.prepareStatement("INSERT INTO refund_complaint (name, email, mobile, payment_id, payment_date, payment_time) VALUES (?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
ps.setString(1, name);
ps.setString(2, email);
ps.setString(3, mobile);
ps.setString(4, paymentId);
ps.setString(5, paymentDate);
ps.setString(6, payment_time);


ps.executeUpdate();
ResultSet rs = ps.getGeneratedKeys();
if (rs.next()) {
id = rs.getInt(1);
}

out.println("<h1>Your Complaint Is registered </h1>");
ps.close();
con.close();
} catch (Exception e) {
out.println(e.getMessage());
}
%>