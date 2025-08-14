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
font-size: 12px;
}


table, th, td {
  border: 1px solid black;
  padding: 5px;
font-size: 12px;
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
  
   <div class="table">
<table border="1">
<tr>
<th>Pass_Id</th>
<th>Adhar_ID</th>
<th>Name</th>
<th>Email</th>
<th>Birthdate</th>
<th>Address</th>
<th>Aadhar</th>
<th>Photo</th>
<th>Mobile</th>
<th>Gender</th>
<th>Start Date</th>
<th>End Date</th>
 <th>Accept</th>
  <th>Decline</th>
</tr>
<%
Connection con = ConnectionProvider.getCon();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from monthly_pass");
while(rs.next()){
String pass_id = rs.getString("pass_id");
String adharId = rs.getString("adhar_id");
String name = rs.getString("name");
String email = rs.getString("email");
String birthdate = rs.getString("birthdate");
String address = rs.getString("address");
String aadharFilename = rs.getString("aadhar");
String photoFilename = rs.getString("photo");
String mobile = rs.getString("mobile");
String gender = rs.getString("gender");
String startDate = rs.getString("start_date");
String endDate = rs.getString("end_date");
%>
<tr>
<td><%=pass_id%></td>
<td><%=adharId%></td>
<td><%=name%></td>
<td><%=email%></td>
<td><%=birthdate%></td>
<td><%=address%></td>
<td><%= "<a href='http://localhost:8080/PMPML_MANAGEMENT/" + aadharFilename + "'>" + aadharFilename + "</a>" %></td>
<td><%= "<a href='http://localhost:8080/PMPML_MANAGEMENT/" + photoFilename + "'>" + photoFilename + "</a>" %></td>
<td><%=mobile%></td>
<td><%=gender%></td>
<td><%=startDate%></td>
<td><%=endDate%></td>
<td><button>Accept</button></td>
  <td><button>Decline</button></td>
</tr>
<%
}
rs.close();
st.close();
con.close();
%>
</table>
</body>
</html>
