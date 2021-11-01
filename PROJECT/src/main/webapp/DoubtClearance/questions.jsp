<%@ page import="java.util.*, Question.jdbc.connect.*, Reply.jdbc.connect.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Questions</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link rel = "stylesheet" href = "css/questions.css">

<script>
	function  validate_question(){
		var question = document.Q_form.qbox.value;
		if(question.length<=10){
			alert("Please Enter a vaild Question");
			document.Q_form.qbox.focus();
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

#question {
  display: flex;
  flex-direction: column;
  width: 100%;
  height: 100%;
  
  
}

#Q_row{
	width:100%;
	height:100%;
}

.question-heading {
  width:100%;
  height:max-content;
  position: relative;
}

.head_block{
	width:100%;
	height:max-content;
}

.head_block img{
	width:5rem;
	height:4rem;
	display:block;
	margin-top:2rem;
	margin-left:auto;
	margin-right:auto;
}

.question-heading h1{
	width:max-content;
	display: block;
    margin: auto;
	margin-bottom:3rem;
}

.question-heading p{
	width:max-content;
	display: block;
    margin: auto;
	
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


#question-container {
  flex-direction: row;
  flex-wrap: wrap;
  width:70%;
  margin-left:auto;
  margin-right:auto;
  height:100%;
 
}

.question-box {
  width: 70%;
  height:max-content;
  box-shadow: 2px 2px 30px rgba(0, 0, 0, 0.1);
  padding: 2rem;
  margin: auto;
  margin-top:1rem;
  cursor: pointer;
  display: block;
  border-radius: 15px;
  background-color: white;
}

.question-box h6{
	width:100%;
	height:max-content;
	text-align:right;
}

.question-box h5{
	width:100%;
	height:max-content;
	margin-bottom:1rem;
}


.arrow-image {
  object-fit: contain;
  width: 28px;
}

#top_contributors{
	height:50rem;
	background-color: white;
	margin-bottom:1rem;
}

.top_head{
	margin-top:2rem;
	width:100%;
	height:max-content;
}

.top_head h5{
	width:max-content;
	height:max-content;
	margin:auto;
}

.top_usersInfo{
	width:100%;
	height:max-content;	
}

.top_usersInfo table{
	width:100%;
	height:max-content;
}

.top_usersInfo table tr{
		width:100%;
		height:max-content;
		
}

th{
		width:max-content;
		height:2rem;
		align:center;
		padding-bottom:1rem;
		
		
}

td{
		width:max-content;
		height:3rem;
		
}

td img{
	width:2.5rem;
	height:2rem;
		
	
}

.footer{
  bottom:0;
  height: 10rem;
  width: 100%;
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
	List<Question> theQ = (List<Question>) request.getAttribute("Q_LIST");
	List<String> theR = (List<String>) request.getAttribute("Rep_COUNT");
	%>
	<jsp:include page="../navbar.jsp"/>

    <section id="question">
		
		<div class="row align-items-start" id="Q_row">
        


		
        <div class="col-md-9" id="question-container">
	            
	             <div class="head_block"><img src="https://pngimg.com/uploads/question_mark/question_mark_PNG129.png"/></div>
			     <div class="question-heading">
		            <h1>Questions</h1>
		            <p style="color:red;">
					<%if(request.getParameter("error")!=null) { out.println(request.getParameter("error"));};%>
					</p>
		        </div>
		    	<div class="submit-container">
		    		<form name="Q_form" action="QuestionController" method="POST">
		            <input name="qbox" type="text" class="submit-answer-box" placeholder="Ask a question">
		            <button class="btn btn-primary" onCLick="return validate_question();" type="submit">Submit</button>
		            </form>
		        </div>
	            <% for (Question tempQ : theQ) { %>
	            <div class="question-box">
					<h6><%= tempQ.getDate() %></h6>
	                <h5><%= tempQ.getQuestion() %></h5> 
	                <form id=<%= tempQ.getQid()%> method="POST" action="ReplyController"> 
	                <input type="hidden" id="qid" name="qid" value=<%= tempQ.getQid() %>>
	                <input type="hidden" id="q_name" name="q_name" value=<%= tempQ.getQuestion() %>>
	                </form>
	                <a href="javascript:{}" onClick="document.getElementById(<%= tempQ.getQid() %>).submit(); return false;"><img class="arrow-image" src="https://image.flaticon.com/icons/png/512/56/56814.png"></a>
	
	            </div>
	            <%} %>
	                    
	       </div>
        <div class="col-md-3" id="top_contributors">
        	<div class="top_head"><h5>Top Contributors</h5></div>
        	<hr>
        	<div class="top_usersInfo">
        		<table>
        		
        			<tr>
        			<th>User</th>
        			<th style="float:right;">Replies</th>
	        		</tr>
	        		<% for (int i=0;i<theR.size();i+=2) { %>
	        		<tr>
	        			
	        			<td><img src="https://archive.org/download/HeaderIconUser/Header-Icon-User.png"/>&emsp; </td>
	        			<td><%= theR.get(i+1) %></td>
	        			<td><%= theR.get(i) %></td>
	        		</tr>
	        		<%} %>
	        	</table>
        	</div>
		</div>
		</div>
    </section>

    <jsp:include page="../footer.jsp"/>
</body>
</html>