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

</head>


<body>
	<navbar class="navbars">
        <div class="links">
            <p class="logo">Placement Preparation Guiders</p>
            <ul>
                <li><a href="../HomePage/HomePage.jsp">LogIn/SignUp</a></li>
                <li><a href="../DoubtClearance/questions.jsp">Doubt Assistance</a></li>
                <li><a href="http://localhost:8080/Placement_Preparation_Portal/#prepresource">Preparation Resources</a></li>
	            <li><a href="http://localhost:8080/Placement_Preparation_Portal/">Home</a></li>
            </ul>
        </div>
    </navbar>

    <section id="question">
		
		<div class="row align-items-start" id="Q_row">
        


		
        <div class="col-md-9" id="question-container">
	            
	             <div class="head_block"><img src="questionIMG.png"/></div>
			     <div class="question-heading">
		            <h1>Questions</h1>
		        </div>
		    	<div class="submit-container">
		    		<form name="Q_form" action="" method="POST">
		            <input name="qbox" type="text" class="submit-answer-box" placeholder="Ask a question">
		            <button class="btn btn-primary" onCLick="return validate_question();" type="submit">Submit</button>
		            </form>
		        </div>
	            
	            <div class="question-box">
					<h6>2020-01-10</h6>
	                <h5>Why we need to do algorithm analysis??</h5> <a href="discussions.jsp"><img class="arrow-image" src="arrow.png"></a>
	
	            </div>
	                    
	       </div>
        <div class="col-md-3" id="top_contributors">
        	<div class="top_head"><h5>Top Contributors</h5></div>
        	<hr>
        	<div class="top_usersInfo">
        		<table>
        			<tr>
        			<th>User</th>
        			<th>Replies</th>
	        		</tr>
	        		<tr>
	        			
	        			<td><img src="profileIMG.png"/>&emsp; User Name</td>
	        			
	        			<td>0</td>
	        		</tr>
	        	</table>
        	</div>
		</div>
		</div>
    </section>

    <jsp:include page="../footer.jsp"/>
</body>
</html>