<%@page import="java.sql.*"%>
<%@page import="project.ConnectionProvider"%>
<%
String source = request.getParameter("source");
String destination = request.getParameter("destination");
String bus_id="";
try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("SELECT bus_id FROM manage_bus WHERE source = ? AND destination = ?");
    ps.setString(1, source);
    ps.setString(2, destination);
    ResultSet rs = ps.executeQuery();
    if (rs.next()) {
        bus_id = rs.getString("bus_id");
    }
} catch(Exception e) {
    out.println(e);
}
%><% 
out.println(bus_id);
%>