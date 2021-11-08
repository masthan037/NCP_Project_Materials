<%@ page import="java.util.*, create.account.jdbc.connect.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel = "stylesheet" href = "css/signup.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<title>SignUp</title>

<script>
	function validate_details(){
		var UserName = document.account_form.UserName.value;
		var Password = document.account_form.Password.value;
		var ConfirmPassword = document.account_form.ConfirmPassword.value;
		if(UserName==""){
			alert("Please Enter a vaild Username");
			document.account_form.UserName.focus();
			return false;
		}
		if(Password==ConfirmPassword && Password<10){
			alert("Please Enter a Strong Password");
			document.account_form.Password.focus();
			return false;
		}
		
		if(Password!=ConfirmPassword){
			alert("Please Enter the same Confirm Password");
			document.account_form.ConfirmPassword.focus();
			return false;
		}
  } 

</script>

</head>

<body>

	<jsp:include page="../navbar.jsp"/>
	 
	 <section class="signup">
	 	<div class="signupCont">
	 	<h1>Placement Preparation Guiders</h1>
		<h4>Practice, Prepare and ace in your Placements</h4>
		<div class="Fbox">
	 		<img src="signinlogo.png" alt="logo"/>
	 		<h2>Sign Up</h2>
	 		<p style="color:red;">
		<%if(request.getParameter("errors")!=null) { out.println(request.getParameter("errors"));};%>
		</p>
	 		<form name="account_form" action="../StudentAccController" method="POST">
		 		<div class="container">
				    <label for="UserName"><b>Username</b></label><br/>
				    <input type="text" placeholder="Enter Username" name="UserName" required><br/>
				    <label for="Firstname"><b>First Name</b></label><br/>
				    <input type="text" placeholder="" name="Firstname" required>
				    <label for="Lastname"><b>Last Name</b></label><br/>
				    <input type="text" placeholder="" name="Lastname" required>
				    <label for="Email"><b>EmailId</b></label><br/>
				    <input type="email" placeholder="Enter EmailId" name="Email" required>
				    <label for="Date"><b>Date of Birth</b></label><br/>
				    <input type="date" placeholder="dd-mm-yyyy" name="Date" required>
				    <label for="gender"><b>Gender</b></label><br/>
				    <select name="gender">
				    	<option value="Male" selected>Male</option>
				    	<option value="female">Female</option>
				    </select>
				    <br>
				    <label for="Password"><b>Password</b></label><br/>
				    <input type="password" placeholder="*********" name="Password" required>
				    <label for="Password"><b>Confirm Password</b></label><br/>
				    <input type="password" placeholder="*********" name="ConfirmPassword" required>
				    <br/><br/>
				    <button type="submit">Create Account</button>
		  		</div>
	 		</form>
	 		</div>
	 	</div>
	 </section>
	 
	 <jsp:include page="../footer.jsp"/>   
</body>
</html>