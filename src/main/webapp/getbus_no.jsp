<%@page import="java.sql.*"%>
<%@page import="project.ConnectionProvider"%>
<%
String bus_id = request.getParameter("bus_id");
String bus_no="";
try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("SELECT bus_no FROM manage_bus WHERE bus_id=?");
    ps.setString(1, bus_id);
    ResultSet rs = ps.executeQuery();
    if (rs.next()) {
        bus_id = rs.getString("bus_no");
    }
} catch(Exception e) {
    out.println(e);
}
%><% 
out.println(bus_no);
%>