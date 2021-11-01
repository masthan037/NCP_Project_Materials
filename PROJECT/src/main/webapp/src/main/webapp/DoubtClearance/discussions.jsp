<%@ page import="java.util.*, Reply.jdbc.connect.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Questions</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link rel = "stylesheet" href = "css/discussions.css">

<script>
	function  validate_reply(){
		var ans = document.ans_form.ans_box.value;
		if(ans.length<=10){
			alert("Please Enter a vaild reply");
			document.ans_form.ans_box.focus();
			return false;
		}
	}
</script>

<style>
html {
  scroll-behavior: smooth;
}

* {
  margin: 0px;
  padding: 0px;
  box-sizing: border-box;
}

body{
	width:100%;
	height:100%;
  	background-image: linear-gradient(to bottom, #ffffff, #fbfbfe, #f7f8fc, #f3f4fb, #eef1fa, #ecf0fa, #ebf0fa, #e9effa, #ecf0fb, #eef2fd, #f1f3fe, #f3f5ff);
}

.navabrs{
  width:100%;
  padding: 0px; 
}

.logo{
  color: white;
  padding: 14px 16px;
  float: left;
}

.links{
  background-color: #333;
  width: 100%;
}

.links ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  
}

.links ul  li {
  float: right;
}

.links ul  li:hover{
  background-color:rgb(77, 77, 77);
}

.submit-answer-box {
  height: 50px;
  width: 300px;
}

.links ul li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

a {
  text-decoration: none;
  color: black;
}

#discussion {
  display: flex;
  flex-direction: column;
  width: 100%;
  height: 100%;
  
  
}

.discussion_cont{
	width:100%;
	height:100%;
}

.discussion-heading {
  width:100%;
  height:max-content;
}

.discussion-heading h2{
	width:max-content;
	margin-left:auto;
	margin-right:auto;
	margin-top:5rem;
	margin-bottom:3rem;
}



.submit-container{
	width:100%;
	height:max-content;
	margin-top:1rem;
	margin-bottom:3rem;
	
}

.submit-container form{
	width:max-content;
	margin-left:auto;
	margin-right:auto;
}




.discussion-box {
  width: 70%;
  height:max-content;
  box-shadow: 2px 2px 30px rgba(0, 0, 0, 0.1);
  padding: 2rem;
  margin: auto;
  margin-bottom:9rem;
  margin-top:1rem;
  cursor: pointer;
  display: block;
  border-radius: 15px;
  background-color: white;
}

.discussion-box table{
	width:100%;
	height:max-content;
}

tr{
	width:100%;
	height:max-content;
	
}

td.userINFO{
	width:100%;
	height:max-content;
}

td.userDATE{
	text-align:right;
	width:100%;
	height:max-content;	
}

img{
	width:3rem;
	height:3rem;
}


.ans_row{
	width:100%;
	height:max-content;
	padding-top:1rem;
}

.answer{
	width:100%;
	height:max-content;
	padding-top:1rem;
}


.footer{
  bottom:0;
  height: 10rem;
  width: 100%;
  margin-top:2rem;
  background-color: #333;
}

.footer h6{
  color: white;
  text-align: center;
  padding-top: 8rem;
}
</style>

</head>
<body>
	<%
	// get the students from the request object (sent by servlet)
	List<Reply> thefeeds = (List<Reply>) request.getAttribute("REPLY_LIST");
	String tempq = String.valueOf(request.getAttribute("questions"));
	%>
	<jsp:include page="../navbar.jsp"/>

    <section id="discussion">
		
	
	        <div class="discussion_cont">
	            
			    <div class="discussion-heading">
		            <h2><%= tempq %></h2>
		            <p style="color:red;">
					<%if(request.getParameter("error")!=null) { out.println(request.getParameter("error"));};%>
					</p>
		        </div>
		    	<div class="submit-container">
		    		<form name="ans_form" action="ReplyController" method="GET">
		            <input name="ans_box" type="text" class="submit-answer-box" placeholder="Your response..">
		            <button class="btn btn-primary" type="submit" onCLick="return validate_reply()">Submit</button>
		            </form>
		        </div>
	            
	            <% for (Reply tempRep : thefeeds) { %>
	            <div class="discussion-box">
					<table>
						<tr>
							<td class="userDATE"><%= tempRep.getDate() %></td>
						</tr>
						<tr>
							<td class="userINFO"><img src="profileIMG.png" />&emsp;&emsp;<b><%= tempRep.getUsername() %></b></td>
						</tr>
						<tr class="ans_row">
							<td class="answer">
							<%= tempRep.getReply() %>
							</td>
						</tr>
					</table>
	            </div>
	            <%} %>
	        
	        </div>            
	       
    </section>

    <jsp:include page="../footer.jsp"/>
</body>
</html>