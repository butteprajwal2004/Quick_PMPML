<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bus Details</title>
</head>
<body>
<h1>Bus Details</h1>

<%-- Search Form --%>
<form action="search.jsp" method="post">
    <label for="busNo">Bus Number:</label>
    <input type="text" id="busNo" name="busNo">
    <button type="submit">Search</button>
</form>

<%-- Display Bus Details --%>
<% if(request.getAttribute("busDetails") != null) {
    Map<String, String> busDetails = (Map<String, String>) request.getAttribute("busDetails");
%>
<h2>Bus Number: <%= busDetails.get("busNo") %></h2>
<form action="update.jsp" method="post">
    <input type="hidden" name="busNo" value="<%= busDetails.get("busNo") %>">
    <label for="source">Source:</label>
    <input type="text" id="source" name="source" value="<%= busDetails.get("source") %>">
    <br>
    <label for="destination">Destination:</label>
    <input type="text" id="destination" name="destination" value="<%= busDetails.get("destination") %>">
    <br>
    <label for="routeNo">Route Number:</label>
    <input type="text" id="routeNo" name="routeNo" value="<%= busDetails.get("routeNo") %>">
    <br>
    <label for="time">Time:</label>
    <input type="text" id="time" name="time" value="<%= busDetails.get("time") %>">
    <br>
    <button type="submit">Update</button>
    <button type="button" onclick="deleteBus('<%= busDetails.get("busNo") %>')">Delete</button>
</form>
<% } %>

<%-- Add Bus Form --%>
<h2>Add Bus</h2>
<form action="add.jsp" method="post">
    <label for="newBusNo">Bus Number:</label>
    <input type="text" id="newBusNo" name="busNo">
    <br>
    <label for="newSource">Source:</label>
    <input type="text" id="newSource" name="source">
    <br>
    <label for="newDestination">Destination:</label>
    <input type="text" id="newDestination" name="destination">
    <br>
    <label for="newRouteNo">Route Number:</label>
    <input type="text" id="newRouteNo" name="routeNo">
    <br>
    <label for="newTime">Time:</label>
    <input type="text" id="newTime" name="time">
    <br>
    <button type="submit">Add</button>
</form>

<script>
    function deleteBus(busNo) {
        if(confirm("Are you sure you want to delete this bus?")) {
            location.href = "delete.jsp?busNo=" + busNo;
        }
    }
</script>

</body>
</html>
