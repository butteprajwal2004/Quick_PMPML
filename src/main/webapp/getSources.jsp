<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String routeNo = request.getParameter("route_no");
StringBuffer sb = new StringBuffer();
try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps=con.prepareStatement("SELECT DISTINCT source FROM manage_bus WHERE route_no = ?");
    ps.setString(1, routeNo);
    ResultSet rs=ps.executeQuery();
    while(rs.next()) {
    	
        sb.append("<option value=\"");
        sb.append(rs.getString("source"));
        sb.append("\">");
        sb.append(rs.getString("source"));
        sb.append("</option>");
    }
} catch(Exception e) {
    out.println(e);
}
out.print(sb.toString());
%>
