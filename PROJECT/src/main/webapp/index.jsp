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
	<%
	// get the students from the request object (sent by servlet)
	List<Feedbacks> thefeeds = (List<Feedbacks>) request.getAttribute("FEEDS_LIST");
	List<Integer> feedcount = (List<Integer>) request.getAttribute("FEEDS_COUNT");
	%>
<script>
  function myFun(checkbox) {
    var checkboxes = document.getElementsByName('LikeorUnlike')
    checkboxes.forEach((item) => {
      if (item !== checkbox) item.checked =  false
    })
    
    }
  
  function validate_feedback(){
	var checkbox = document.feed_form.LikeorUnlike.value;
	var heading = document.feed_form.heading.value;
	var comments = document.feed_form.comments.value;
	if(checkbox===null){
		alert("This Field is required!");
		document.feed_form.LikeorUnlike.focus();
		return false;
	}
	if(heading==""){
		alert("Please Enter a vaild Heading for Feedback");
		document.feed_form.heading.focus();
		return false;
	}
	if(comments.length<10){
		alert("Please Enter a vaild Comments for Feedback");
		document.feed_form.comments.focus();
		return false;
	}
  } 
</script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
 // Load Charts and the corechart package.
    google.charts.load('current', {'packages':['corechart','geochart']});

    // Draw the pie chart for Sarah's pizza when Charts is loaded.
    google.charts.setOnLoadCallback(drawSarahChart);

    function drawSarahChart() {
      var data = new google.visualization.DataTable();
      data.addColumn('string', 'Column 1');
      data.addColumn('number', 'Feedback count');
      data.addRows([
        ['Like', <%= feedcount.get(1) %>],
        ['Unlike', <%= feedcount.get(2) %>]
      ]);

      var options = {title:'Likes Vs Unlikes',
                     width:600,
                     height:500,
                     };

      var chart = new google.visualization.PieChart(document.getElementById('Sarah_chart_div'));
      chart.draw(data, options);
    }
    
    google.charts.setOnLoadCallback(drawRegionsMap);

    function drawRegionsMap() {
      var data = google.visualization.arrayToDataTable([
        ['Country', 'Team size'],
        ['India', 4],
        
      ]);

      var options = {};

      var chart = new google.visualization.GeoChart(document.getElementById('regions_div'));

      chart.draw(data, options);
    }

    
 </script>
</head>
<body>
	
	<jsp:include page="navbar.jsp"/>

    
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
                <li><a href="http://localhost:8080/Placement_Preparation_Portal/apptitudeServletController" class="res"><p>Apptitude</p></a></li>
                <li><a href="http://localhost:8080/Placement_Preparation_Portal/verbalServletController" class="res"><p>Verbal</p></a></li>
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
	     			<td class="tb_left"><img src="profileIMG.png" style="height:50px;width:50px;" alt="user_logo"/></td>
	     			<td class="tb_right">
	     				<p><%= tempfeeds.getName() %>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <i><b><%= tempfeeds.getDate() %></b></i></p></br>
	     				<h5><b><%= tempfeeds.getHeader() %></b></h5>
	     				<p><%= tempfeeds.getContent() %></p>
	     				<hr>
	     			</td>
	     		</tr>
	     		<% } %>
	     	</table>
	     
     </div>
     
     <div class="divider"></div>
     
     <div class="thumbs_percent">
     	<div class="row align-items-start" id="thumbsrow">
	     	<div class="col-md-8">
	     		<img src="feedqoute.png" class="feedqoute"/>
	     	</div>
	     	<div class="col-md-4">
	     		<table class="thumbs_tb">
		     	<tr>
		     		<td><img src="smile.jpg"/></td>
		     		<td><img src="sad.jpg"/></td>
		     	</tr>
		     	<tr>
		     		<td><h3 style="color:green;"><%= feedcount.get(1)%></h3></td>
		     		<td><h3 style="color:red;"><%= feedcount.get(2)%></h3></td>
		     	</tr>
		     	
	     		</table>
	     	</div>
	     </div>	
     </div>
     
     <div>
	     <table class="columns" style=" width:100%;margin-right: auto;margin-left: auto;">
	      	<tr style="width:100%; height:max-content;">
	        <td style="width:max-content;height:max-content; display:block; margin-left:auto;margin-right:auto;"><div id="Sarah_chart_div" style="border: 1px solid #ccc; display: inline-block; margin:auto;"></div></td>
	      	</tr>
	    </table>
     </div>
        
        <div class="feedback">
        	<img src="feedback.png" alt="img"/>
            <h3>Feedback</h3>
            
            <form name="feed_form" action="FeedbackControllerServlet" method="POST" class="fform">
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
                    
                    <button type="submit" onClick="return validate_feedback();">Submit</button>
                  </div>   
            </form>
            <br>
            <div id="regions_div" style="width: 90%; height: 500px; margin:auto; display:block;"></div>
            <br>
        </div>
    </section>
    
    <jsp:include page="footer.jsp"/>
</body>
</html>