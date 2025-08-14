<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Good Feedback</title>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
	  <link rel="stylesheet" type="text/css" href="style.css">  
	<style>
	  .form-container {
        width: 500px;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        margin: 0 auto;
        background: white;
        text-align: center;
      }

      .form-group {
        margin-bottom: 15px;
      }
       label {
        font-weight: bold;
        display: block;
        margin-bottom: 10px;
      }
      input[type="radio"] {
        margin-right: 10px;
      }
		.stars {
			display: inline-block;
		}

		.fa-star {
			color: #25c481;
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
	<form action="Submit_Ratings.jsp" method="post">
	
		<label for="rating">GOOD FEEDBACK:</label>
		<div class="stars">
			<input type="radio" id="star5" name="rating" value="5 Star" />
			<label for="star5" class="fa fa-star"></label>
			<input type="radio" id="star4" name="rating" value="4 Star" />
			<label for="star4" class="fa fa-star"></label>
			<input type="radio" id="star3" name="rating" value="3 Star" />
			<label for="star3" class="fa fa-star"></label>
			<input type="radio" id="star2" name="rating" value="2 Star" />
			<label for="star2" class="fa fa-star"></label>
			<input type="radio" id="star1" name="rating" value="1 Star" />
			<label for="star1" class="fa fa-star"></label>
		</div>
		
		<br/><br/>
		<input type="submit" value="SUBMIT RATINGS"/>
		<center><h5><a href="Feedback.jsp"><b>Back</b></a></h5></center>
		</div>
		
	</form>
</body>
</html>
