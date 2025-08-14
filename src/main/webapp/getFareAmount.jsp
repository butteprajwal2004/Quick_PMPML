<%@page import="java.sql.*"%>
<%@page import="project.ConnectionProvider"%>
<%
String source = request.getParameter("source");
String destination = request.getParameter("destination");
int fare = 0;
try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("SELECT amount FROM manage_bus WHERE source = ? AND destination = ?");
    ps.setString(1, source);
    ps.setString(2, destination);
    ResultSet rs = ps.executeQuery();
    if (rs.next()) {
        fare = rs.getInt("amount");
    }
} catch(Exception e) {
    out.println(e);
}
%><% 
out.println(fare);
%>