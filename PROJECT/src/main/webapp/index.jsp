<%@ page import="java.util.*, test.jdbc.connection.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel = "stylesheet" href = "index.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">


<title>Placement Preparation</title>

<script>
  function myFun(checkbox) {
    var checkboxes = document.getElementsByName('LikeorUnlike')
    checkboxes.forEach((item) => {
      if (item !== checkbox) item.checked =  false
    })
</script>

</head>
<body>
	<%
	// get the students from the request object (sent by servlet)
	List<Feedbacks> thefeeds = (List<Feedbacks>) request.getAttribute("FEEDS_LIST");
	%>
	
	<navbar class="navbars">
        <div class="links">
            <p class="logo">Placement Preparation Guiders</p>
            <ul>
                <li><a href="HomePage/HomePage.jsp">LogIn/SignUp</a></li>
                <li><a href="DoubtClearance/questions.jsp">Doubt Assistance</a></li>
                <li><a href="#prepresource">Preparation Resources</a></li>
                <li><a href="#header">Home</a></li>
            </ul>
        </div>
    </navbar>

    
    <section class="homepage">
    <div class="row align-items-start" id="rowcol">
        <div class="col-md-8">
        <div class="headersec" id="header">
            <h1>Placement Preparation Guiders</h1>
            </br>
            <div class="img_trans">
            
            </div>
            </br>
            <h5><i>"There are no secrets to success. It is the result of preparation, hard work, and learning from failure."- Colin Powell</i></h5>
        </div>
        </div>
        <div class="col-md-4">
        <div class="resource" id="prepresource">
            <h3>Quick Links</h3>
            <br/>
            <ul>
                <li><a href="Resources/resume.jsp" class="res"><p>Resume</p></a></li>
                <li><a href="Resources/apptitude.jsp" class="res"><p>Apptitude</p></a></li>
                <li><a href="Resources/verbal.jsp" class="res"><p>Verbal</p></a></li>
                <li><a href="Resources/DSA.jsp" class="res"><p>Data Structure and Algorithms</p></a></li>
                <li><a href="Resources/OperatingSystem.jsp" class="res"><p>Operating System</p></a></li>
                <li><a href="Resources/ComputerNetworks.jsp" class="res"><p>Computer Networks</p></a></li>
                <li><a href="Resources/DBMS.jsp" class="res"><p>Database Management System</p></a></li>
            </ul>
        </div>
        </div>
     </div>
     
     <div class="empty_space">
     	
     </div>
     
     <div class="mid">
     
     		<div class="row align-items-start" id="mid_IMG">
        		<div class="col-md-7"><iframe src="https://www.youtube.com/embed/PihtA9D-IlE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>
	     		<div class="col-md-5"><img src="FAANG.jpg" alt="FAANG"/></div>
	     	</div>
	     	
	     	<div class="comment_sec"><img src="commentsIMG.jpg" alt="IMG"/></div>
	     	<table class="comments">
	     	
	     	<% for (Feedbacks tempfeeds : thefeeds) { %>
	     		<tr>
	     			<td class="tb_left_bg"></td>
	     			<td class="tb_left"><img src="profileIMG.png" alt="user_logo"/></td>
	     			<td class="tb_right">
	     				<h5><%= tempfeeds.getName() %>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <i><%= tempfeeds.getDate() %></i></h5></br>
	     				<h3><%= tempfeeds.getHeader() %></h3></br>
	     				<p><%= tempfeeds.getContent() %></p>
	     				<hr>
	     			</td>
	     			
	     			
	     		</tr>
	     		
	     		<% } %>
	     	</table>
	     
     </div>
        
        <div class="feedback">
        	<img src="feedback.png" alt="img"/>
            <h3>Feedback</h3>
            
            <form action="FeedbackControllerServlet" method="POST" class="fform">
				<div class="container">
                    <label for="Name"><b>Your Name:</b></label><br/>
                    <input type="text" name="realname"><br>
                    <br>
                    
                    <label for="Email"><b>Your Email:</b></label><br/>
                    <input type="text" name="email"><br>
                    <br>
                    
                    <label><b>Like or Unlike?</b></label><br><br>
                    <input type="radio" id="like" name="LikeorUnlike" value="like" onclick="myFun(this)">
  					<label for="like"><img src="likeimg.png" alt="likeIMG" style="width:4rem; height:4rem;"/></label>
  					<span>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</span>
  					<input type="radio" id="unlike" name="LikeorUnlike" value="unlike" onclick="myFun(this)">
                    <label for="unlike"><img src="unlikeimg.png" alt="unlikeIMG" style="width:4rem; height:4rem;"/></label>
                    
                    <br><br>
                    <label for="heading"><b>One Line Heading:</b></label><br/>
                    <input type="text" name="heading"><br>
                    <br>
                    
                    <label for="comments"><b>Your Comments:</b></label><br/>
                    <textarea name="comments" rows="10" cols="60"></textarea><br><br>
                    
                    <button type="submit">Submit</button>
                  </div>   
            </form>
        </div>
    </section>
    
    <jsp:include page="footer.jsp"/>
</body>
</html>