<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Help Line</title>
     <link rel="stylesheet" type="text/css" href="style.css">  
    <style>
       
        h1 {
            text-align: center;
            margin-top: 50px;
            font-size: 30px;
            color: #000000;
        }
        .container {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            margin-top: 50px;
        }
        .card {
            background-color: #ffffff;
            border: 1px solid #cccccc;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            width: 250px;
            height: 250px;
            margin-bottom: 30px;
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color: #000000;
           
        }
        .card:hover {
            box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
        }
        .card h2 {
            font-size: 20px;
            margin-top: 10px;
        }
        .card p {
            font-size: 16px;
            margin-top: 20px;
        }
        .card a {
            text-decoration: none;
            color: #ffffff;
            font-size: 16px;
            margin-top: 10px;
            background-color:  #25c481;
            padding: 10px 20px;
            border-radius: 20px;
            transition: background-color 0.2s ease;
        }
        .card a:hover {
            background-color: #005ea6;
        }
    </style>
</head>
<body>
    <h1>HELPLINE</h1>
    <div class="container">
        <div class="card">
            <h2>PMPML Emergency</h2>
            <a href="tel:8767935847">Call Now</a>
        </div>
        <div class="card">
            <h2>Police</h2>
            
            <a href="tel:9322668336">Call Now</a>
        </div>
        <div class="card">
            <h2>Fire Department</h2>
            
            <a href="tel:7385297043">Call Now</a>
        </div>
        <div class="card">

            <h2>Medical</h2>
           
            <a href="tel:9322854094">Call Now</a>
        </div>
        
    </div>
    <center><h5><a href="Userhome.jsp">Back</a></h5></center>
</body>
</html>
