
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
        text-align: center;
        background: white;
      }
      input[type="text"],
      input[type="number"],
      input[type="radio"] {
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
  </style>
   
  <script>

  
    function validateAdharNo() {
      var adharNo = document.forms["form"]["ID"].value;
      if (adharNo.length != 4) {
        alert("Enter Only Last 4 digit of Adhar Number");
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
  <form name="form" action="dailyAction.jsp "  method="post"  onsubmit="return validateAdharNo()">
 
      <label>Adhar No</label>
     <input type="number" name="ID" placeholder="Enter Adhar Id" required="required">
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
        <label for="amount">Amount:</label>
        <input type="text" id="amount_1" name="amount" value="Rs. 50" disabled>
        <br>
       

        	
        
        
  
      
      <script src="https://code.jquery.com/jquery-3.5.0.js"></script>




<form  method="POST">

<script
src="https://checkout.razorpay.com/v1/checkout.js"
data-key="rzp_test_0pA4Zub0LxMf4O"
data-amount="5000"
data-currency= "INR"
data-id=""
data-buttontext="PAY"
data-name="PMPML"
data-description="Pune Mahanagar Parivahan Mahamandal Limited "
data-image="logo3.jpg"
data-prefill.name="  "
data-theme.color="#4CAF50"

>



</script>
<input type="hidden custom="Hidden Element" name="hidden">








</form>

	

   <center><h5><a href="my_pass.jsp">Back</a></h5></center>
 
    </div>
  </form>
</body>
</html>
