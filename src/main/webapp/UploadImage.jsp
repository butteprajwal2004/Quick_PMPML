<!DOCTYPE html>
<html>
<head>
	<title>Upload Image</title>
	<style>
		form {
			margin: 50px auto;
			width: 50%;
			padding: 20px;
			background-color: #f1f1f1;
			border-radius: 10px;
			box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.2);
		}

		input[type="file"] {
			margin: 10px 0px;
		}

		input[type="submit"] {
			background-color: #4CAF50;
			color: #fff;
			padding: 10px 20px;
			border: none;
			border-radius: 5px;
			cursor: pointer;
		}
	</style>
</head>
<body>
	<form action="displayImage.jsp" method="post" enctype="multipart/form-data">
		<h1>Upload Image</h1>
		<input type="file" name="image" id="image" accept=".jpg, .jpeg, .png" required>
		<input type="submit" value="Upload Image">
	</form>
</body>
</html>
