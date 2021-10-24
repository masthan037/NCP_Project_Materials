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

    <section id="discussion">
		
	
	        <div class="discussion_cont">
	            
			    <div class="discussion-heading">
		            <h2>Why we need to do algorithm analysis??</h2>
		        </div>
		    	<div class="submit-container">
		    		<form name="ans_form" action="" method="POST">
		            <input name="ans_box" type="text" class="submit-answer-box" placeholder="Your response..">
		            <button class="btn btn-primary" type="submit" onCLick="return validate_reply()">Submit</button>
		            </form>
		        </div>
	            
	            <div class="discussion-box">
					<table>
						<tr>
							<td class="userDATE">2020-01-10</td>
						</tr>
						<tr>
							<td class="userINFO"><img src="profileIMG.png" />&emsp;&emsp;<b>Guest User</b></td>
						</tr>
						<tr class="ans_row">
							<td class="answer">
							A problem can be solved in more than one ways. So, many solution algorithms can be derived for a given problem. We analyze available algorithms to find and implement the best suitable algorithm.
							</td>
						</tr>
					</table>
	                
	
	            </div>
	        
	        </div>            
	       
    </section>

    <jsp:include page="../footer.jsp"/>
</body>
</html>