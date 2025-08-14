  <%@ page import="java.io.*,java.lang.*, java.util.*, com.itextpdf.text.*, com.itextpdf.text.pdf.* , com.itextpdf.text.pdf.PdfWriter , com.itextpdf.text.Image" %>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<html>
<head>
   <link rel="stylesheet" type="text/css" href="style.css">  

  <style>
     .form-container {
        border: 1px solid #ccc;
        border-radius: 10px;
        box-shadow: 0 0 10px #ccc;
        margin: auto;
        max-width: 500px;
        padding: 20px;
        background: white;
        
      
      }
      input[type="text"],
      input[type="number"],
      select
       {
        padding: 10px;
        margin: 10px 0;
        width: 100%;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
      }
      input[type="radio"] {
  display: inline-block;
  margin-right: 10px;
}
      
      input[type="submit"],
      input[type="reset"] {
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
      input[type="reset"] {
        background-color: #f44336;
      }
      label {
        font-weight: bold;
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
      .gender-container {
        display: flex;
        align-items: center;
        justify-content: center;
      }
      .gender-container input[type="radio"] {
        margin-right: 10px;
      }
      .payment-options-container {
  display: flex;
  justify-content: center;
  align-items: center;
}
      
  </style>

  <script>

  
    function validateMobileNo() {
      var MobileNo = document.forms["form"]["ID"].value;
      if (MobileNo.length != 10) {
        alert("Enter Only 10 digit Mobile Number");
        return false;
      }
      return true;
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
  <form name="form" action="Book_My_Ticket_Action.jsp" method="post" onsubmit="return validateMobileNo()">
    <label>Mobile No</label>
    <input type="number" name="ID" placeholder="Enter Mobile No" required="required">
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
                 <label for="Bus">Route_No:</label>
    <select name="route_no" id="route_no" onchange="getSources(); getDestinations()">

        <%
        try{
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps=con.prepareStatement("SELECT route_no FROM manage_bus");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
        %>
            <option value="<%=rs.getInt("route_no")%>"><%=rs.getInt("route_no")%></option>
        <%
            }
        }catch(Exception e){out.println(e);}
        %>
    </select>
    <br>
    <label for="source">Source:</label>
     <select name="source" id="source" onchange="updateFareAmount();updateBusId()">
</select>



  
    <br>
     <label for="destination">Destination:</label>
     <select name="destination" id="destination" onchange="updateFareAmount();updateBusId()">
</select>
    <br>
    
<br>
 <label for="bus_id">Bus_Id:</label>
 <input type="text" id="bus_id" name="bus_id" >

        <br>
 <label for="amount">Amount:</label>
<input type="text" id="amount" name="amount" >
<br>
    <br>
    <label>Payment Option:</label>
<div class="payment-options-container">
  <input type="radio" id="cash" name="payment-option" value="cash" checked>
  <label for="cash">Pay by Cash</label>
  <input type="radio" id="online" name="payment-option" value="online">
  <label for="online">Pay Online</label>
</div>
    
    <br>
    <input type="submit" value="Done" id="done-button" style="display:none">
       <script>
       var paymentOptions = document.getElementsByName("payment-option");
    for (var i = 0; i < paymentOptions.length; i++) {
  paymentOptions[i].addEventListener("click", function() {
    if (this.value === "cash") {
      document.getElementById("done-button").style.display = "block";
    } else {
      document.getElementById("done-button").style.display = "none";
    }
  });
}
</script>
  </form>
  
</div>

<script>
function updateBusId() {
    var source = document.getElementById("source").value;
    var destination = document.getElementById("destination").value;
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("bus_id").value = this.responseText;
        }
    };
    xhttp.open("GET", "getBusId.jsp?source=" + source + "&destination=" + destination, true);
    xhttp.send();
}

function updateFareAmount() {
    var source = document.getElementById("source").value;
    var destination = document.getElementById("destination").value;
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("amount").value = this.responseText;
        }
    };
    xhttp.open("GET", "getFareAmount.jsp?source=" + source + "&destination=" + destination, true);
    xhttp.send();
}


</script>
<script>
function getSources() {
    var routeNo = document.getElementById("route_no").value;
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        document.getElementById("source").innerHTML = this.responseText;
        updateFareAmount();
      }
    };
    xhttp.open("GET", "getSources.jsp?route_no=" + routeNo, true);
    xhttp.send();
  }
function getDestinations() {
    var routeNo = document.getElementById("route_no").value;
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        document.getElementById("destination").innerHTML = this.responseText;
        updateFareAmount();
      }
    };
    xhttp.open("GET", "getDestinations.jsp?route_no=" + routeNo, true);
    xhttp.send();
  }


</script>
 <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <script>
        $(function() {
            $('#online').on('click', function() {
                var options = {
                    "key": "rzp_test_0pA4Zub0LxMf4O",
                    "amount": "5000",
                    "currency": "INR",
                    "name": "PMPML",
                    "description": "Pune Mahanagar Parivahan Mahamandal Limited",
                    "image": "logo3.jpg",
                    "prefill": {
                        "name": ""
                    },
                    "theme": {
                        "color": "#4CAF50"
                    },
                    "handler": function(response) {
                    	  // handle successful payment response
                    	  console.log(response);
                    	  // make post request to Book_My_Ticket_Action.jsp with payment details
                    	  var data = {
                    	    payment_id: response.razorpay_payment_id,
                    	    order_id: response.razorpay_order_id,
                    	    signature: response.razorpay_signature
                    	  };
                    	  $.post("Book_My_Ticket_Action.jsp", data, function() {
                    	    // redirect to Book_My_Ticket_Action.jsp
                    	    window.location.href = "Book_My_Ticket_Action.jsp";
                    	  });
                    	},
                    "modal": {
                        "ondismiss": function() {
                            // handle modal dismiss event
                        }
                    }
                };
                var rzp = new Razorpay(options);
                rzp.open();
            });
        });
    </script>
    <input type="hidden custom="Hidden Element" name="hidden" >
    <center><h5><a href="Conductor_Home.jsp">Back</a></h5></center>
</form>
   

	

   
 
    </div>
  </form>
</body>
</html>
