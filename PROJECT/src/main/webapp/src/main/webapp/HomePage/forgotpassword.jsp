<%@ page import="java.util.*, forgotpass.jdbc.connect.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/forgotpassword.css">
    <title>Forgot Password</title>
</head>
<body>
	
	<jsp:include page="../navbar.jsp"/>
	
	<div class="box">
        <h3 style="color: rgb(13, 107, 107);text-align: center;">ENTER YOUR EMAIL</h3><br>
        <p style="color:red;"><%if(request.getParameter("error")!=null) { out.println(request.getParameter("error"));};%></p>
        <form action="../forgotpasswordController" method="POST">
            <label for="email">Email</label><br>
            <input type="email" name="email" required><br>
            <button type="submit" style="text-decoration: none;color:white" class="btn btn-info">
                Submit</button>
        </form>
    </div>
</body>
</html>