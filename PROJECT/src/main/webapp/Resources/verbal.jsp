<%@ page import= "java.util.*, verbal.jdbc.connect.*"  %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Verbal mcq's</title>
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

.main-content-container {
  margin-left: 30px;
  margin-right:30px;
  margin-bottom:30px;
  padding: 10px;
  box-shadow: 5px 10px 20px 1px rgba(0, 0, 0, 0.2);
}


</style>
</head>

<body>
	<%
	List<verbal> mcqs = (List<verbal>)request.getAttribute("VERBAL");
	int q = 1;
	%>
	
	<jsp:include page="../navbar.jsp"/>
	
	<br>
	<h3 class="text-center" style="color:#2F86A6">Verbal MCQ</h3>
	<p style="color:red;" class="text-center">
	<%if(request.getParameter("error")!=null) { out.println(request.getParameter("error"));};%>
	</p>
	<br>	
	<div class="main-content-container">
	<form action="verbalServletController" method="POST">
	<% for (verbal tempmcq : mcqs) { %>
	<h6>Q<%=q %>.<%=tempmcq.getMcqQ() %></h6>
	<p><input type="radio" name=<%=tempmcq.getVerbID()%> value=<%=tempmcq.getA() %> checked> <%=tempmcq.getA() %></p>
	<p><input type="radio" name=<%=tempmcq.getVerbID()%> value=<%=tempmcq.getB() %>> <%=tempmcq.getB() %></p>
	<p><input type="radio" name=<%=tempmcq.getVerbID()%> value=<%=tempmcq.getC() %>> <%=tempmcq.getC() %></p>
	<p><input type="radio" name=<%=tempmcq.getVerbID()%> value=<%=tempmcq.getD() %>> <%=tempmcq.getD() %></p> 
	<br>
	<% q=q+1;} %>
	<input type="submit" class="btn btn-info"/>
	</form>
	</div>
		<jsp:include page="../footer.jsp"/>
	
</body>
</html>