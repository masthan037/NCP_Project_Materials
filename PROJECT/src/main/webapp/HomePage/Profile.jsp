<%@ page import="java.util.*, Login.account.jdbc.connect.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<%
	// get the students from the request object (sent by servlet)
	String userinfo = String.valueOf(request.getAttribute("userinfo"));
	String[] temp = userinfo.split("\\+");
	%>
	
<meta charset="ISO-8859-1">
<link rel = "stylesheet" href = "css/Profile.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<title><%= temp[1] %>'s Profile</title>
</head>
<body>
	
<h1><%= temp[1] %></h1>
<h1><%= temp[2] %></h1>
<h1><%= temp[3] %></h1>
<h1><%= temp[4] %></h1>
<h1><%= temp[5] %></h1>
</body>
</html>