<%@ page import="java.io.*, java.sql.*, java.util.*, javax.servlet.*,javax.servlet.http.Part.*"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%
if (!ServletFileUpload.isMultipartContent(request)) {
    throw new IllegalArgumentException("Request is not multipart, please check your form");
}
%>

<%
Part filePart = request.getPart("image");
InputStream inputStream = filePart.getInputStream();

// create a byte array to hold the contents of the input stream
ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
byte[] buffer = new byte[4096];
int bytesRead = -1;
while ((bytesRead = inputStream.read(buffer)) != -1) {
    outputStream.write(buffer, 0, bytesRead);
}
byte[] photo1 = outputStream.toByteArray();

// insert the image into the database
Connection con = ConnectionProvider.getCon();
PreparedStatement ps = null;
ResultSet rs = null;
try {
    
    ps = con.prepareStatement("INSERT INTO images (image) VALUES (?)", Statement.RETURN_GENERATED_KEYS);
    ps.setBlob(1, new ByteArrayInputStream(photo1));
    ps.executeUpdate();
    rs = ps.getGeneratedKeys();
    if (rs.next()) {
        int passId = rs.getInt(1);
        // do something with the passId if needed
    }
} catch (SQLException e) {
    // handle the exception
} finally {
    try {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    } catch (SQLException e) {
        // handle the exception
    }
}
%>
