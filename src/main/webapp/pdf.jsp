<!DOCTYPE html>
<html>
<head>
	<title>Upload PDF</title>
	<style>
		body {
			font-family: Arial, sans-serif;
		}
		form {
			display: flex;
			flex-direction: column;
			align-items: center;
			margin-top: 50px;
		}
		input[type=file] {
			margin-bottom: 20px;
		}
		input[type=submit] {
			background-color: #4CAF50;
			color: white;
			padding: 10px 20px;
			border: none;
			border-radius: 5px;
			cursor: pointer;
			font-size: 16px;
			font-weight: bold;
			transition: background-color 0.3s ease;
		}
		input[type=submit]:hover {
			background-color: #3e8e41;
		}
	</style>
</head>
<body>
	<form action="upload1.jsp" method="post" enctype="multipart/form-data">
		<h1>Upload PDF</h1>
		<input type="file" name="pdf" accept=".pdf">
		<input type="submit" value="Upload">
	</form>
</body>
</html>
