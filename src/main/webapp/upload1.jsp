<%@page import="java.sql.*,java.io.*"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
try {
    // Establishing a database connection
    Connection con = ConnectionProvider.getCon();
    Statement stmt = con.createStatement();
    
    // Retrieving the image from the monthly_pass table
    ResultSet rs = stmt.executeQuery("SELECT image FROM images WHERE id=6");
    
    // Displaying the image on the screen
    if (rs.next()) {
        Blob blob = rs.getBlob("image");
        InputStream inputStream = blob.getBinaryStream();
        int bytesRead = -1;
        byte[] buffer = new byte[4096];
        OutputStream outputStream = response.getOutputStream();
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);
        }
        inputStream.close();
        outputStream.flush();
        outputStream.close();
    }
    stmt.close();
    con.close();
} catch (Exception e) {
    out.println(e.getMessage());
}
%>
