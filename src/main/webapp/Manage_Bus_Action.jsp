<%@ page import="java.io.*,java.lang.*, java.util.*, java.sql.*, com.itextpdf.text.*, com.itextpdf.text.pdf.* , com.itextpdf.text.pdf.PdfWriter , com.itextpdf.text.Image" %>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>



<%
try {
    // Get form data from request
    
    String route_no = request.getParameter("route_no");
    String bus_no = request.getParameter("bus_no");
    String source = request.getParameter("source");
    String destination = request.getParameter("destination");
    String amount = request.getParameter("amount");
    String driver = request.getParameter("driver");
    String conductor = request.getParameter("conductor");
   
    int bus_id = -1;
    // Connect to database
    Connection con = ConnectionProvider.getCon();

    // Insert form data into database
    PreparedStatement ps = con.prepareStatement("INSERT INTO manage_bus (route_no,bus_no, source, destination,amount,driver, conductor) VALUES (?, ?, ?, ?, ?, ?,?)", Statement.RETURN_GENERATED_KEYS);
    ps.setString(1, route_no);
    ps.setString(2, bus_no);
    ps.setString(3, source);
    ps.setString(4, destination);
    ps.setString(5, amount);
    ps.setString(6, driver);
    ps.setString(7, conductor);
  
    ps.executeUpdate();

    ResultSet rs = ps.getGeneratedKeys();
 
    if (rs.next()) {
        bus_id = rs.getInt(1);
    }
    ps.close();
    con.close();
    response.sendRedirect("Manage_Bus.jsp");

    // Retrieve data from database
   
} catch (Exception e) {
    out.println(e.getMessage());
}
%>