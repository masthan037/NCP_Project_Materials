<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel = "stylesheet" href = "navbar.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
</head>
<body>
	<navbar class="navbars">
        <div class="links">
            <p class="logo">Placement Preparation Guiders</p>
            <ul>
            	<% 
            	String userinfo = String.valueOf(session.getAttribute("userinfo"));
            	if(userinfo.length()==4){
            		out.print("<li><a href='http://localhost:8080/Placement_Preparation_Portal/HomePage/HomePage.jsp'>LogIn/SignUp</a></li>");
            		
            	}
            	else{
            		out.print("<li><a href='http://localhost:8080/Placement_Preparation_Portal/Logout'>Logout</a></li>");
            		out.print("<li><a href='http://localhost:8080/Placement_Preparation_Portal/HomePage/Profile.jsp'>Profile</a></li>");
            	}
            	
            	%>
                
                <li><a href="http://localhost:8080/Placement_Preparation_Portal/QuestionController">Doubt Assistance</a></li>
                <li><a href="http://localhost:8080/Placement_Preparation_Portal/#prepresource">Preparation Resources</a></li>
                <li><a href="http://localhost:8080/Placement_Preparation_Portal/#header">Home</a></li>
            </ul>
        </div>
    </navbar>
</body>
</html>