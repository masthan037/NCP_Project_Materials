<%@ page import= "java.util.*, verbal.jdbc.connect.*"  %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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

</style>
</head>

<body>
	<%
	List<verbal> mcqs = (List<verbal>)request.getAttribute("VERBAL");
	int q = 1;
	%>
	
	<jsp:include page="../navbar.jsp"/>
	
	<br>
	<p style="color:red;">
	<%if(request.getParameter("error")!=null) { out.println(request.getParameter("error"));};%>
	</p>
	<br>
	
	<form action="" method="POST">
	<% for (verbal tempmcq : mcqs) { %>
	<label>Q<%=q %>.<%=tempmcq.getMcqQ() %></label>
	<select name=<%=tempmcq.getVerbID() %>>
	<option value=<%=tempmcq.getA() %>><%=tempmcq.getA() %></option>
	<option value=<%=tempmcq.getB() %>><%=tempmcq.getB() %></option>
	<option value=<%=tempmcq.getC() %>><%=tempmcq.getC() %></option>
	<option value=<%=tempmcq.getD() %>><%=tempmcq.getD() %></option>
	</select>
	<br>
	<% q=q+1;} %>
	<input type="submit"/>
	</form>
	
</body>
</html>