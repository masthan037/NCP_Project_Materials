<%-- --%>
<%@ page import="java.util.*, Login.account.jdbc.connect.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel = "stylesheet" href = "css/HomePage.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

<title>LogIn</title>

<script> 
function validate()
{ 
     var UserName = document.form.UserName.value; 
     var Passward = document.form.Passward.value;
 
     if (UserName==null || UserName=="")
     { 
     alert("Username cannot be blank"); 
     return false; 
     }
     else if(Passward==null || Passward=="")
     { 
     alert("Password cannot be blank"); 
     return false; 
     } 
}
</script> 

</head>

<body>
		<%
		// get the students from the request object (sent by servlet)
		String usercount = String.valueOf(request.getAttribute("USER_COUNTS"));
		%>
<spam><h2>${Created}</h2></spam>
	<jsp:include page="../navbar.jsp"/>
	    
    	<section class="login">
    	<div><%if(usercount!="null") { out.println("Placement Preparation Guiders registered COUNT NUMBER:"+ usercount);};%></div>
		<div class = "HomePage">
		<h1>Placement Preparation Guiders</h1>
		<h4>Practice, Prepare and ace in your Placements</h4>
		<div class="Fbox">
		<img src="loginlogo.png" alt="logo"/>
		<h2>LogIn</h2>
		<p style="color:red;">
		<%if(request.getParameter("error")!=null) { out.println(request.getParameter("error"));};%>
		</p>
		<form action="../LoginController" method="post" onsubmit="return validate()">
		  <div class="container">
		    <label for="UserName"><b>Username</b></label><br/>
		    <input type="text" placeholder="Enter Username" name="UserName" required><br/>
		    <label for="Passward"><b>Password</b></label><br/>
		    <input type="password" placeholder="*********" name="Password" required>
		    <p><a href="http://localhost:8080/Placement_Preparation_Portal/HomePage/forgotpassword.jsp">Forgot your Password?</a></p>
		    <button type="submit">Login</button>
		  </div>
		</form>
		<br/>
		<p>Dont Have an Account.. <a href="signUp.jsp">Create one!!</a></p>
		</div>
		</div>
		</section>
		
		<jsp:include page="../footer.jsp"/> 

</body>
</html>