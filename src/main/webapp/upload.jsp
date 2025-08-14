<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<%@page import="project.ConnectionProvider"%>

<%
   // Get a connection to the database
   Connection con=ConnectionProvider.getCon();

   // Prepare a statement to insert the image into the database
   String sql = "INSERT INTO images (image) VALUES (?)";
   PreparedStatement statement = con.prepareStatement(sql);

   // Retrieve image from request parameter
   Part filePart = request.getPart("image");
   if (filePart != null) {
       // set input stream from file part
       InputStream inputStream = filePart.getInputStream();
       statement.setBlob(1, inputStream);
   }

   // Execute the statement to insert the image into the database
   int rowsInserted = statement.executeUpdate();
   if (rowsInserted > 0) {
       out.println("Image uploaded successfully!");
   } else {
       out.println("Failed to upload image.");
   }

   // Close the database resources
   if (statement != null) {
       statement.close();
   }
   if (con != null) {
       con.close();
   }
%>
