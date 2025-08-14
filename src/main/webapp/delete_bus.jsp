<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String rowId = request.getParameter("bus_id");

Connection con = ConnectionProvider.getCon();
PreparedStatement ps = con.prepareStatement("DELETE FROM manage_bus WHERE bus_id = ?");
ps.setString(1, rowId);
int result = ps.executeUpdate();

if (result == 1) {
	 out.println("<script>alert('Bus details updated successfully.'); window.location.href='Manage_Bus.jsp';</script>");
} else {
	out.println("<script>alert('No bus details updated.');</script>");
}

ps.close();
con.close();
%>
