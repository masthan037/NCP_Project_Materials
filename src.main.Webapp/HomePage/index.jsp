<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel = "stylesheet" href = "css/index.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

<title>Placement Preparation</title>
</head>
<body>
	<navbar class="navbars">
        <div class="links">
            <p class="logo">Logo</p>
            <ul>
                <li><a href="HomePage.jsp">LogIn/SignUp</a></li>
                <li><a href="../DoubtClearance/questions.jsp">Doubt Assistance</a></li>
                <li><a href="#prepresource">Preparation Resources</a></li>
                <li><a href="#header">Home</a></li>
            </ul>
        </div>
    </navbar>

    
    <section class="homepage">
        <div class="headersec" id="header">
            <h1>Heading</h1>
            <p><i>para</i></p>
        </div>
        
        <div class="resource" id="prepresource">
            <h3>Preparation Resources</h3>
            <ul>
                <a href="../Resources/resume.jsp"><li>Resume</a></li>
                <li><a href="../Resources/apptitude.jsp">Apptitude</a></li>
                <li><a href="../Resources/verbal.jsp">Verbal</a></li>
                <li><a href="../Resources/DSA.jsp">Data Structure and Algorithms</a></li>
                <li><a href="../Resources/OperatingSystem.jsp">Operating System</a></li>
                <li><a href="../Resources/ComputerNetworks.jsp">Computer Networks</a></li>
                <li><a href="../Resources/DBMS.jsp">Database Management System</a></li>
            </ul>
        </div>
        
        <div class="feedback">
            <h3>Feedback</h2>
            
            <form action="" method="POST" class="fform">

                    Your name: <br>
                    <input type="text" name="realname" id="name" size="51"><br>
                    <br>
                    
                    Your email: <br>
                    <input type="text" name="email" id="email" size="51"><br>
                    <br>
                    
                    Your comments: <br>
                    <textarea name="comments" rows="10" cols="50"></textarea><br><br>
                    
                    <input type="submit" value="Submit">
                     
            </form>
        </div>
    </section>
    
    <footer class="footer">
        <h6>&copy Students of Amrita</h6>
    </footer>
</body>
</html>