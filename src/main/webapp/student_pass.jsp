<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="img.*"%>

<html>
<head>
  
 <link rel="stylesheet" type="text/css" href="style.css">  
   <style>
      /* CSS to style the form */
      .form-container {
        width: 500px;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        margin: 0 auto;
        background: white;
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

    

      input[type="submit"] {
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        background-color: #25c481;
        color: white;
        cursor: pointer;
        margin-top: 20px;
      }

      input[type="submit"]:hover {
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

  
    function validateAdharNo() {
      var adharNo = document.forms["form"]["ID"].value;
      if (adharNo.length != 12) {
        alert("Enter 12 digits of Adhar Number");
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
  <form name="form" action="student_pass_action"  method="post"  onsubmit="return validateAdharNo()" enctype="multipart/form-data">
 
   
         <label>Adhar No</label>
     <input type="text" name="ID" placeholder="Enter Adhar Id" required="required">
        <br>
        <label>Student Name</label>
     <input type="text" name="name" placeholder="Enter Your Name" required="required">
        <br>
        <label>Collge/School Name</label>
     <input type="text" name="college" placeholder="Enter School/College Name" required="required">
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
        <label for="photo">Bonafide Certificate:</label>
          <input type="file" id="bonafide" name="bonafide" accept="image/*">
       <br>
         <label for="photo">Adhar Card Photo:</label>
          <input type="file" id="aadhar" name="aadhar" accept="image/*">
       <br>
        <label for="photo">Passport size photo:</label>
          <input type="file" id="photo" name="photo" accept="image/*">
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
        <center> <input type="submit" value="Verify"></center>
          <center><h5><a href="my_pass.jsp">Back</a></h5></center>
       

        	
        
        
  
      














</form>

	

 
    </div>
  </form>
</body>
</html>
