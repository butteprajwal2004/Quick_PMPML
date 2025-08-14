<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String rowId = request.getParameter("id");

Connection con = ConnectionProvider.getCon();
PreparedStatement ps = con.prepareStatement("DELETE FROM add_driver WHERE id = ?");
ps.setString(1, rowId);
int result = ps.executeUpdate();

if (result == 1) {
    out.println("Row deleted successfully.");
} else {
    out.println("Error deleting row.");
}

ps.close();
con.close();
%>
