<%@ page import="java.io.*,java.lang.*, java.util.*, java.sql.*, com.itextpdf.text.*, com.itextpdf.text.pdf.* , com.itextpdf.text.pdf.PdfWriter , com.itextpdf.text.Image" %>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// Get the form data
String busId = request.getParameter("bus_id");
String amount = request.getParameter("amount");
String driver = request.getParameter("driver");
String conductor = request.getParameter("conductor");

// Update the database
Connection con = ConnectionProvider.getCon();
PreparedStatement ps = con.prepareStatement("UPDATE manage_bus SET amount=?, driver=?, conductor=? WHERE bus_id=?");
ps.setString(1, amount);
ps.setString(2, driver);
ps.setString(3, conductor);
ps.setString(4, busId);

try {
    int result = ps.executeUpdate();
    if (result > 0) {
        // Show success message in dialog box
        out.println("<script>alert('Bus details updated successfully.'); window.location.href='Manage_Bus.jsp';</script>");
    } else {
        // Show error message in dialog box
        out.println("<script>alert('No bus details updated.');</script>");
    }
} catch (SQLException e) {
    // Show error message in dialog box
    out.println("<script>alert('Error updating bus details: " + e.getMessage() + "');</script>");
}

%>
