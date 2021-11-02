<%@ page import="java.util.*, Login.account.jdbc.connect.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<%
	// get the students from the request object (sent by servlet)
	String userinfo = String.valueOf(session.getAttribute("userinfo"));
	String[] temp = userinfo.split("\\+");
	%>
	
<meta charset="ISO-8859-1">
<link rel = "stylesheet" href = "css/Profile.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<title><%= temp[1] %>'s Profile</title>

<style>
.box {
  margin-top: 50px;
  margin-left: auto;
  margin-right: auto;
  padding: 10px;
  box-shadow: 5px 10px 20px 1px rgba(0, 0, 0, 0.2);
}

html {
  scroll-behavior: smooth;
}

* {
  margin: 0px;
  padding: 0px;
}

body {
  width: 100%;
  height: 100%;
}

.navabrs {
  width: 100%;
  padding: 0px;
}

.logo {
  color: white;
  padding: 14px 16px;
  float: left;
}

.links {
  background-color: #333;
  width: 100%;
}

.links ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
}

.links ul li {
  float: right;
}

.links ul li:hover {
  background-color: rgb(77, 77, 77);
}

.links ul li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.signup {
  width: 100%;
  height: max-content;
  background-image: linear-gradient(
    to bottom,
    #f3ffff,
    #edfcff,
    #e9f8ff,
    #e9f3ff,
    #ecedff,
    #ebedff,
    #e9ecff,
    #e8ecff,
    #e0f1ff,
    #d8f7ff,
    #d5fbff,
    #d7fff8
  );
}

.Fbox img {
  width: 10rem;
  height: 9rem;
  display: block;
  margin-left: auto;
  margin-right: auto;
}

.signupCont {
  padding-top: 5rem;
  padding-bottom: 10rem;
  width: 50%;
  margin: auto;
  height: max-content;
}

.signupCont h1,
h4 {
  width: 100%;
  text-align: center;
}

.signupCont h4 {
  padding-bottom: 2rem;
}

.signupCont h2 {
  width: 100%;
  text-align: center;
  padding-bottom: 2rem;
}

.Fbox {
  padding-top: 4rem;
  padding-bottom: 8rem;
  padding-left: 5rem;
  padding-right: 5rem;
  width: 80%;
  margin: auto;
  height: max-content;
  border-style: solid;
  border-color: #0b4141;
  border-radius: 2rem;
  background-color: white;
}

/* Full-width inputs */
input[type="text"],
input[type="email"],
input[type="date"],
input[type="password"] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
button {
  background-color: #04aa6d;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

/* Add a hover effect for buttons */
button:hover {
  opacity: 0.8;
}

a{
	text-decoration:none
}

.edit{
	display:block;
	margin:auto;
	width:10rem;
}

/* Extra style for the cancel button (red) */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

/* Center the avatar image inside this container */
.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
}

/* Avatar image */
img.avatar {
  width: 40%;
  border-radius: 50%;
}

/* Add padding to containers */
.container {
  padding: 16px;
}

.container p {
  width: 100%;
  text-align: right;
}
/* The "Forgot password" text */
span.psw {
  float: right;
  padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
    display: block;
    float: none;
  }
  .cancelbtn {
    width: 10%;
  }
}

.footer {
  height: 10rem;
  width: 100%;
  background-color: #333;
}
.footer h6 {
  color: white;
  text-align: center;
  padding-top: 8rem;
}


</style>

</head>
<body>
	<%
		// get the students from the request object (sent by servlet)
		String error = String.valueOf(request.getAttribute("error"));
	%>
	
	
	<jsp:include page="../navbar.jsp"/>
	
    <div class="box">
        <h1 style="color: rgb(38, 177, 38);margin-left: 60px;">Welcome to profile page</h1>
    </div>
    <p style="color:red;">
		<%if(error.equals("Update Success...")) { out.println(error);}%>
		</p>
		
    <table class="table my-5" style="width: 1000px;
    margin-right: auto;
    margin-left: auto;">
        <thead class="thead-dark">
            <tr>
                <th scope="col">Username</th>
                <th scope="col">Firstname</th>
                <th scope="col">Lastname</th>
                <th scope="col">Email</th>
                <th scope="col">Dob</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><%= temp[1] %></td>
                <td><%= temp[2] %></td>
                <td><%= temp[3] %></td>
                <td><%= temp[4] %></td>
                <td><%= temp[5] %></td>
            </tr>
        </tbody>
       </table>
        <a href="http://localhost:8080/Placement_Preparation_Portal/HomePage/updateprofile.jsp"><button class="edit">Edit profile</button></a>
        <br>
        <a href="http://localhost:8080/Placement_Preparation_Portal/HomePage/resetpassword.jsp"><button class="edit">Reset Password</button></a>

</body>
</html>