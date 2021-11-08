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

.main {
width:200px;
border:1px solid black;

}

.month {
background-color:black;
font:bold 12px verdana;
color:white;
}

.daysofweek {
background-color:gray;
font:bold 12px verdana;
color:white;
}

.days {
font-size: 12px;
font-family:verdana;
color:black;
background-color: lightyellow;
padding: 2px;
}

.days #today{
font-weight: bold;
color: red;
}

</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
 // Load Charts and the corechart package.
    google.charts.load('current', {'packages':['corechart']});

    // Draw the pie chart for Sarah's pizza when Charts is loaded.
    google.charts.setOnLoadCallback(drawReplyChart);

    // Draw the pie chart for the Anthony's pizza when Charts is loaded.
    google.charts.setOnLoadCallback(drawQuestionChart);

    function drawReplyChart() {
      var data = new google.visualization.DataTable();
      data.addColumn('string', 'Column 1');
      data.addColumn('number', 'Replies Count');
      data.addRows([
        ['Total Replies', <%= temp[9] %>],
        ['Your Replies', <%= temp[8] %>]
      ]);

      var options = {title:'Your Contribution to Valuable Answers',
                     width:500,
                     height:300};

      var chart = new google.visualization.PieChart(document.getElementById('Reply_chart_div'));
      chart.draw(data, options);
    }

    function drawQuestionChart() {
      var data = new google.visualization.DataTable();
      data.addColumn('string', 'Column 1');
      data.addColumn('number', 'Question Count');
      data.addRows([
        ['Total Questions', <%= temp[11] %>],
        ['Your Questions', <%= temp[10] %>]
      ]);

      var options = {title:'Your Contribution in posting helpful Questions',
                     width:500,
                     height:300};

      var chart = new google.visualization.PieChart(document.getElementById('Question_chart_div'));
      chart.draw(data, options);
    }
    </script>
<script type="text/javascript" src="basiccalender.js"></script> 

</head>
<body>
	<%
		// get the students from the request object (sent by servlet)
		String error = String.valueOf(request.getAttribute("error"));
	%>
	
	
	<jsp:include page="../navbar.jsp"/>
	
     <p style="color:red;  width: 100%; height: max-content; font-weight: 900; text-align: center; margin-top:2rem;">
	    <%if(error.equals("Update Success!!.")) { out.println(error);};%> 
		<%if(request.getParameter("errors")!=null) { out.println(request.getParameter("errors"));};%>
	</p>
	
    <div class="box">
        <h1 style="color: rgb(38, 177, 38);margin-left: 60px;">Welcome <%= temp[1] %></h1>
    </div>
   
		
    <table class="table my-5" style=" width: 1000px;margin-right: auto;margin-left: auto;">
        <thead class="thead-dark">
        	<tr>
        	<th colspan="1" style="width:50%; height:10rem;">
        	<% if(temp[7].equals("Male")){
        	
        	out.print("<img style='width:10rem; height:10rem; display: block; margin-right:auto;' src='https://img.freepik.com/free-vector/portrait-shy-teenager-format-clothing-isolated-circle-icon-personage-with-blush-cheeks-student-school-college-university-unsure-brunette-face-relaxed-guy-photo-vector_87689-2396.jpg?size=338&ext=jpg'/>");
        	}
        	else{
        	out.print("<img style='width:10rem; height:10rem; display: block; margin-right:auto;' src='https://img.freepik.com/free-vector/female-character-portrait-isolated-circle-icon-avatar-personage-with-long-hair-blush-cheeks-timid-teenage-girl-cute-teenager-photo-media-girlfriend-vector-flat-style_87689-2395.jpg?size=338&ext=jpg'/>");
        	}%>
        	</th>
        	<th colspan="2" style="width:50%; height:10rem;">
        		<script type="text/javascript" >
				var todaydate = new Date();
				var curmonth = todaydate.getMonth()+1; //get current month (1-12)
				var curyear=todaydate.getFullYear(); //get current year
				
				document.write(buildCal(curmonth ,curyear, "main", "month", "daysofweek", "days", 1));
				</script>
			</th>	
			<th colspan="2" style="width:50%; height:10rem;">
				<iframe src="https://free.timeanddate.com/clock/i826lzlh/n553/szw110/szh110/cf100/hnce1ead6" frameborder="0" width="150" height="150"></iframe>
				
			
			</th>
        	</tr>
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
        <br>
        <table class="columns" style=" width: 1000px;margin-right: auto;margin-left: auto;">
      	<tr>
        <td><div id="Reply_chart_div" style="border: 1px solid #ccc"></div></td>
        <td><div id="Question_chart_div" style="border: 1px solid #ccc"></div></td>
      	</tr>
    	</table>
        <br>
        <a href="http://localhost:8080/Placement_Preparation_Portal/HomePage/updateprofile.jsp"><button class="edit">Edit profile</button></a>
        <br>
        
		<br>
        <a href="http://localhost:8080/Placement_Preparation_Portal/HomePage/resetpassword.jsp"><button class="edit">Reset Password</button></a>
		<br>
		
		<br>
</body>
</html>