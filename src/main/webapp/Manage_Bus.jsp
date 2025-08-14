<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="img.*"%>
    <%@ page import="java.io.*,java.lang.*, java.util.*, com.itextpdf.text.*, com.itextpdf.text.pdf.* , com.itextpdf.text.pdf.PdfWriter , com.itextpdf.text.Image" %>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="style.css">  

   <style>
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

</head>
<body>
  <div class="social-icons">
    <img src="logo3.jpg">
    <img src="logo3.jpg">
    <img src="logo3.jpg">
  </div>
  <div class="form-container">
  <form name="form" action="Manage_Bus_Action.jsp"  method="post"  >



<label>Route No</label>
     <input type="text" name="route_no" placeholder="Enter Route No" required="required">
        <br>
        <label>Bus NO</label>
     <input type="text" name="bus_no" placeholder="Enter Bus No" required="required">
        <br>
      <label>Source</label>
      <select name="source">
        <option value="Manchar">Manchar</option>
        <option value="Rajgurunagar">Rajgurunagar</option>
        <option value="Chakan">Chakan</option>
        <option value="Moshi">Moshi</option>
        <option value="Bhosari">Bhosari</option>
      </select><br>
      <label>Destination</label>
      <select name="destination">
        <option value="Manchar">Manchar</option>
        <option value="Rajgurunagar">Rajgurunagar</option>
        <option value="Chakan">Chakan</option>
        <option value="Moshi">Moshi</option>
        <option value="Bhosari">Bhosari</option>
      </select><br>
      <label>Amount</label>
<input type="number" name="amount" placeholder="Enter amount" required="required"><br>
      <label>Driver</label>
      <select name="driver">
      <% try{
    	  Connection con = ConnectionProvider.getCon();
        Statement stmt=con.createStatement();
        ResultSet rs=stmt.executeQuery("select name from add_driver");
        while(rs.next()){
          String name=rs.getString("name");
          out.println("<option value='"+name+"'>"+name+"</option>");
        }
        con.close();
        }catch(Exception e){out.println(e);}
        %>
      </select><br>
      <label>Conductor</label>
      <select name="conductor">
      <% try{
    	  Connection con = ConnectionProvider.getCon();
        Statement stmt=con.createStatement();
        ResultSet rs=stmt.executeQuery("select name from conductor");
        while(rs.next()){
          String name=rs.getString("name");
          out.println("<option value='"+name+"'>"+name+"</option>");
        }
        con.close();
        }catch(Exception e){out.println(e);}
        %>
      </select><br>
      <center><input type="submit" value="Add Bus"></center>
          <center><h5><a href="adminhome.jsp">Back</a></h5></center>
          </div>
       

        	
        
        
  
      














</form>

	<div class="table">
<% 
Connection con = ConnectionProvider.getCon();
 PreparedStatement  ps = con.prepareStatement("SELECT * FROM manage_bus");
 ResultSet rs = ps.executeQuery();

    // Create table to display data
    out.println("<table border='1'>");
    out.println("<tr>");
    
    out.println("<th>Bus Id</th>");
    out.println("<th>Route No</th>");
    out.println("<th>Bus No</th>");
    out.println("<th>Source</th>");
    out.println("<th>Destination</th>");
    out.println("<th>Amount</th>");
    out.println("<th>Driver</th>");
    out.println("<th>Conductor</th>");
    out.println("<th>Update Bus</th>");
    out.println("<th>Delete Bus</th>");
    out.println("</tr>");
    while (rs.next()) {
        out.println("<tr>");
        out.println("<td>" + rs.getString("bus_id") + "</td>");
        out.println("<td>" + rs.getString("route_no") + "</td>");
        out.println("<td>" + rs.getString("bus_no") + "</td>");
        out.println("<td>" + rs.getString("source") + "</td>");
        out.println("<td>" + rs.getString("destination") + "</td>");
        out.println("<td>" + rs.getString("amount") + "</td>");
        out.println("<td>" + rs.getString("driver") + "</td>");
        out.println("<td>" + rs.getString("conductor") + "</td>");
        out.println("<td><button onclick=\"updateRow('" + rs.getString("bus_id") + "')\">Update</button></td>");
        out.println("<td><button onclick=\"deleteRow('" + rs.getString("bus_id") + "')\">Delete</button></td>");
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
            url: "delete_bus.jsp",
            type: "POST",
            data: { bus_id: rowId },
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
function updateRow(rowId) {
    // Get the row data to pre-fill the form
    var busId = rowId;
    var routeNo = $("td:nth-child(2)", $(event.target).closest("tr")).text().trim();
    var bus_no = $("td:nth-child(3)", $(event.target).closest("tr")).text().trim();
    var source = $("td:nth-child(4)", $(event.target).closest("tr")).text().trim();
    var destination = $("td:nth-child(5)", $(event.target).closest("tr")).text().trim();
    var amount = $("td:nth-child(6)", $(event.target).closest("tr")).text().trim();
    var driver = $("td:nth-child(7)", $(event.target).closest("tr")).text().trim();
    var conductor = $("td:nth-child(8)", $(event.target).closest("tr")).text().trim();

    // Create a form to edit the row data
    var form = "<form method='post' action='Update_Bus_Action.jsp'>";
    form += "<input type='hidden' name='bus_id' value='" + busId + "'>";
    form += "<table>";
    form += "<tr><td>Route No:</td><td>" + routeNo + "</td></tr>";
    form += "<tr><td>Source:</td><td>" + bus_no + "</td></tr>";
    form += "<tr><td>Source:</td><td>" + source + "</td></tr>";
    form += "<tr><td>Destination:</td><td>" + destination + "</td></tr>";
    form += "<tr><td>Amount:</td><td><input type='text' name='amount' value='" + amount + "'></td></tr>";
    form += "<tr><td>Driver:</td><td><input type='text' name='driver' value='" + driver + "'></td></tr>";
    form += "<tr><td>Conductor:</td><td><input type='text' name='conductor' value='" + conductor + "'></td></tr>";
    form += "<input type='submit'  value='Update'>";
    
    $(event.target).closest("tr").replaceWith("<tr>" +
        "<td colspan='8'>" + form + "</td>" +
        "</tr>");
    
}
</script>

 </div>
</body>
</html>
