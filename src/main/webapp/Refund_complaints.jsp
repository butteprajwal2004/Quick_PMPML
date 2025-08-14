<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
<head>
<title>Refund Complaint Form</title>
</head>
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
      input[type="email"],
      input[type="radio"],
      input[type="date"],
      input[type="time"]
       {
        padding: 10px;
        margin: 10px 0;
        width: 100%;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
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
     
      </style>
<body>
<div class="social-icons">
    <img src="logo3.jpg">
    <img src="logo3.jpg">
    <img src="logo3.jpg">
  </div>
  <div class="form-container">


<form method="post" action="Refund_Complaint_Action.jsp">
<labeL>Name:</labeL> <input type="text" name="name" required><br><br>
<labeL>Email:</labeL> <input type="email" name="email" required><br><br>
<labeL>Mobile No:</labeL> <input type="number" name="mobile" required><br><br>
<labeL>Payment Id:</labeL> <input type="text" name="payment_id" required><br><br>
<labeL>Payment date:</labeL> <input type="date" name="date" required><br><br>
<labeL>Payment Time :</labeL> <input type="time" name="time" required><br><br>




<input type="submit" value="Submit Refund Complaint">
<center><h5><a href="Feedback.jsp"><b>Back</b></a></h5></center>
</div>
</form>

</body>
</html>
