<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Bus Timetable</title>
      <link rel="stylesheet" type="text/css" href="style.css">  
    <style>
      table {
        border-collapse: collapse;
        width: 100%;
      }

      th, td {
       
        border: 1px solid black;
        
        text-align: left;
        padding: 8px;
      }
      h1 {
  text-align: center;
   
   color: black;
}
td{

        color: black;
}

      th {
        
        color: black;
      }
.time-column {
  display: table-cell;
  border: 1px solid black; /* add border */
  padding: 0;
  text-align: center;
  vertical-align: middle;
  width: 16%; /* make all columns same width */
}

.time-column:not(:last-child) {
  margin-right: 20px; /* add spacing between columns */
}


    </style>
  </head>
  <body>
    <table>
    <h1>TIMETABLE</h1>
      <thead>
        <tr>
          <th>BUS_NO</th>
          <th>SOURCE</th>
          <th>DESTINATION</th>
          <th>ROUTE_NO</th>
          <th>TIME</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>01</td>
          <td>Manchar</td>
          <td>Bhosari</td>
          <td>361</td>
          <td>
             <div class="time-column">09.00 am</div>
            <div class="time-column">11.00 am</div>
            <div class="time-column">01.00 pm</div>
            <div class="time-column">03.00 pm</div>
            <div class="time-column">05.00 pm</div>
          </td>
        </tr>
        <tr>
          <td>02</td>
          <td>Manchar</td>
          <td>Bhosari</td>
          <td>361</td>
          <td>
             <div class="time-column">10.00 am</div>
            <div class="time-column">12.00 pm</div>
            <div class="time-column">02.00 pm</div>
            <div class="time-column">04.00 pm</div>
            <div class="time-column">06.00 pm</div>
          </td>
        </tr>
       <tr>
          <td>03</td>
          <td>Manchar</td>
          <td>Bhosari</td>
          <td>361</td>
          <td>
            <div class="time-column">07.00 am</div>
            <div class="time-column">07.30 am</div>
            <div class="time-column">08.00 am</div>
            <div class="time-column">08.30 am</div>
            <div class="time-column">07.00 pm</div>
          </td>
        </tr>
      </tbody>
    </table>
    <center><h5><a href="Userhome.jsp">Back</a></h5></center>
  </body>
  
</html>

