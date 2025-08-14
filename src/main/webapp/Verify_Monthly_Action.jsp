<%@ page import="java.io.*, java.util.*, com.itextpdf.text.*, com.itextpdf.text.pdf.* , com.itextpdf.text.pdf.PdfWriter , com.itextpdf.text.Image" %>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String id=request.getParameter("pass_id");
int id1=Integer.parseInt(id);

		
Connection con = ConnectionProvider.getCon();
int pass_id=0;
String aadhar=null;
try 
{
    Statement stmt;
    String query="select * from monthly_pass";
    stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery(query);

    while(rs.next())
    {
        if(rs.getInt("pass_id")==id1)
        {
            pass_id=rs.getInt("pass_id");
            aadhar=rs.getString("aadhar");
        }
    }

}
catch (Exception e)
{
    out.println(e.getMessage());
}

request.setAttribute("pass_id",String.valueOf(pass_id));
request.setAttribute("aadhar",aadhar);
RequestDispatcher rd=request.getRequestDispatcher("Verify_Monthly.jsp");
rd.forward(request, response);

	
%>
