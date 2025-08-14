<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.lang.*, java.util.*, com.itextpdf.text.*, com.itextpdf.text.pdf.* , com.itextpdf.text.pdf.PdfWriter , com.itextpdf.text.Image" %>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<html>
<head>
  <link rel="stylesheet" type="text/css" href="style.css">  

   <style>
      /* CSS to style the form */
      /* CSS to style the form */
.form-container {
  width: 500px;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 5px;
  margin: 0 auto;
  background: white;
}

/* CSS to style the table */
table {
  border-collapse: collapse;
  margin: 20px auto; /* set left and right margins to "auto" to center the table horizontally */
  background: white;
}


table, th, td {
  border: 1px solid #25c481;
  padding: 5px;

}


      .form-group {
        margin-bottom: 15px;
      }

      label {
        font-weight: bold;
        display: block;
        margin-bottom: 10px;
      }

      input[type="text"],
      input[type="file"],
       input[type="number"],
        input[type="email"],
         input[type="address"],
          input[type="date"],
      select {
        width: 100%;
        padding: 10px;
        font-size: 14px;
        border-radius: 5px;
        border: 1px solid #ccc;
        margin-bottom: 20px;
      }

    

      input[type="submit"],
      button {
         padding: 10px 20px;
        border: none;
        border-radius: 5px;
        background-color: #25c481;
        color: white;
        cursor: pointer;
        margin-top: 20px;
        display: block;
        margin: 0 auto;
        
      }
      

      input[type="submit"]:hover {
        background-color: #25b7c4;
      }
      
      button:hover {
        background-color: #25b7c4;
      }
      .gender-container {
        display: flex;
        align-items: center;
        justify-content: center;
      }
      .gender-container input[type="radio"] {
        margin-right: 10px;
      }
      .social-icons {
      margin: 30px auto;
      text-align: center;
    }
    .social-icons img {
      width: 70px;
      margin: 0 12px;
      box-shadow: 0 0 20px 0 #ffffff;
      cursor: pointer;
      border-radius: 50%;
    }
    </style>
   
  <script>

  

    }
  </script>
</head>
<body>
  <div class="social-icons">
    <img src="logo3.jpg">
    <img src="logo3.jpg">
    <img src="logo3.jpg">
  </div>
  <div class="form-container">
  <form name="form" action="add_driver.jsp"  method="post"  >
 
   
         <label>Adhar No</label>
     <input type="text" name="ID" placeholder="Enter Adhar Id" required="required">
        <br>
        <label>Driver Name</label>
     <input type="text" name="name" placeholder="Enter Your Name" required="required">
        <br>
         <label>Email</label>
     <input type="email" name="email" placeholder="Enter Your Email" required="required">
        <br>
         <label>Birthdate</label>
     <input type="date" name="birthdate" required="required">
        <br>
         <label>Address</label>
     <input type="address" name="address" placeholder="Enter Your Address" row="5" required="required">
        <br>
       
          <label>Mobile</label>
     <input type="text" name="mobile" placeholder="Enter Your Mobile No" required="required">
        <br>
          
    <label for="gender">Gender:</label>
        <div class="gender-container">
        <br>
          <input type="radio" id="male" name="gender" value="male">
          <label for="male">Male</label>
          <input type="radio" id="female" name="gender" value="female">
          <label for="female">Female</label>
          <input type="radio" id="other" name="gender" value="other">
          <label for="other">Other</label>
           
        </div>
        <br>
        <center> <input type="submit" value="Add Driver"></center>
        <br>
        
          <center><h5><a href="adminhome.jsp">Back</a></h5></center>
       

        	
        
        
  
      














</form>

    </div>
  </form>
   <div class="table">
<% 
Connection con = ConnectionProvider.getCon();
 PreparedStatement  ps = con.prepareStatement("SELECT * FROM add_driver");
 ResultSet rs = ps.executeQuery();

    // Create table to display data
    out.println("<table border='1'>");
    out.println("<tr>");
    
    out.println("<th>id</th>");
    out.println("<th>Adhar No</th>");
    out.println("<th>Driver Name</th>");
    out.println("<th>Email</th>");
    out.println("<th>Birthdate</th>");
    out.println("<th>Address</th>");
    out.println("<th>Mobile</th>");
    out.println("<th>Gender</th>");
    out.println("<th>Delete Driver</th>");
    out.println("</tr>");
    while (rs.next()) {
        out.println("<tr>");
        out.println("<td>" + rs.getString("id") + "</td>");
        out.println("<td>" + rs.getString("adhar") + "</td>");
        out.println("<td>" + rs.getString("name") + "</td>");
        out.println("<td>" + rs.getString("email") + "</td>");
        out.println("<td>" + rs.getString("birthdate") + "</td>");
        out.println("<td>" + rs.getString("address") + "</td>");
        out.println("<td>" + rs.getString("mobile") + "</td>");
        out.println("<td>" + rs.getString("gender") + "</td>");
        out.println("<td><button onclick=\"deleteRow('" + rs.getString("id") + "')\">Delete</button></td>");
        out.println("</tr>");
    }
    out.println("</table>");

    ps.close();
    con.close();

	%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function deleteRow(rowId) {
    if (confirm("Are you sure you want to delete this row?")) {
        $.ajax({
            url: "delete_driver.jsp",
            type: "POST",
            data: { id: rowId },
            success: function(response) {
                alert("Row deleted successfully.");
                location.reload();
            },
            error: function(xhr, status, error) {
                alert("Error deleting row.");
            }
        });
    }
}
</script>
	

 </div>
</body>
</html>
