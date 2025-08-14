<%@ page import="java.io.*,java.lang.*, java.util.*, java.sql.*, com.itextpdf.text.*, com.itextpdf.text.pdf.* , com.itextpdf.text.pdf.PdfWriter , com.itextpdf.text.Image" %>
<%@page import="project.ConnectionProvider"%>

<%
java.util.Date date = new java.util.Date();
java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd/MM/yyyy");
String currentDate = sdf.format(date);
%>

<%
try {
    // Get form data from request
    String adhar = request.getParameter("ID");
    String driver_name = request.getParameter("name");
    String email = request.getParameter("email");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String birthdate = request.getParameter("birthdate");
    String address = request.getParameter("address");
    String mobile = request.getParameter("mobile");
    String gender = request.getParameter("gender");

    // Connect to database
    Connection con = ConnectionProvider.getCon();

    // Insert form data into database
    PreparedStatement ps = con.prepareStatement("INSERT INTO conductor (adhar, name, email,username,password, birthdate, address, mobile, gender, joining_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?,?,?)", Statement.RETURN_GENERATED_KEYS);
    ps.setString(1, adhar);
    ps.setString(2, driver_name);
    ps.setString(3, email);
    ps.setString(4, username);
    ps.setString(5, password);
    ps.setString(6, birthdate);
    ps.setString(7, address);
    ps.setString(8, mobile);
    ps.setString(9, gender);
    ps.setString(10, currentDate);
    ps.executeUpdate();

    ResultSet rs = ps.getGeneratedKeys();
    int id = -1;
    if (rs.next()) {
        id = rs.getInt(1);
    }
    ps.close();
    con.close();
    response.sendRedirect("Manage_Conductor.jsp");

    // Retrieve data from database
   
} catch (Exception e) {
    out.println(e.getMessage());
}
%>