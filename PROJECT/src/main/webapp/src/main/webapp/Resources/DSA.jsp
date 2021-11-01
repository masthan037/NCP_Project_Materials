<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel = "stylesheet" href = "css/dsa.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<title>DATA STRUCTURES AND ALGORITHMS</title>
</head>
<body>
<body>
	<jsp:include page="../navbar.jsp"/>
	
    <div class="container" style="margin-left:140px">
        <div class="sidebar">
            <div class="section-topics">
                <h4 class="section-title">Topics</h4>
                <ul>
               <li><a href="#"><b>2D Arrays</b></a></li>
                    <li><a href="#"><b>Strings</b></a></li>
                    <li><a href="#"><b>Linked List</b></a></li>
                    <li><a href="#"><b>Stack</b></a></li>
                    <li><a href="#"><b>Queue</b></a></li>
                    <li><a href="#"><b>Hash Table & Hash Set</b></a></li>
                    <li><a href="#"><b>Heap</b></a></li>
                    <li><a href="#"><b>Graphs</b></a></li>
                    <li><a href="#"><b>Binary Tree</b></a></li>
                      <li><a href="#"><b>Binary Search Tree</b></a></li>
                        <li><a href="#"><b>Trie</b></a></li>
                </ul>
            </div>
        </div>
        <section class="main-content">
        	<div class="main-content-container"><h1 style="color:orange;">&emsp;&emsp;&emsp;&emsp;DATA STRUCTURES AND ALGORITHMS</h1></div>
        	
            <h1 class="main-heading" style="color: rgb(0, 0, 0);"><img class="dsa-img" height="350px" width="300px" src="DSAIMG1.jpg">
            <img class="dsa-img" " height="350px" width="300px" src="DSAIMG3.jpg">
            <img class="dsa-img"  height="350px" width="300px" src="DSAIMG2.jpg">
            </h1>
       
            <div class="main-content-container">
       <h1>Improve your DSA Skills... Here's How..</h1>
    		<p>Here is a step-by-step plan to improve your data structure and algorithm skills:</p>
    		<h3>Step 1: Understand Depth vs. Breadth</h3>
			<p>We all have that friend who has solved 500 coding problems. They love to wear it as a badge of honor. But when it comes to interviews, they fail miserably. This is a very common scenario. It’s what we call the “Breadth-Only” approach. They are solely focused on solving as many problems as they can.
			   The Breadth-Only approach has a problem—you don’t build a strong foundation. Interviews require deep problem-solving knowledge and the ability to code fast and accurately. You only develop these skills with focused preparation.</p>
    		<br/>
    		<br/>
    		<div class="videoCont"><iframe width="900" height="500" src="https://www.youtube.com/embed/myZKhztFhzE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="display:block; margin:auto;"></iframe></div>
    		<br/>
    		<br/>
    		<h3>Step 2: Start the Depth-First Approach-make a list of core questions</h3>
    		<p>Identify a list of ~100 core problems. Many sites give you 100 curated problems.
				<br/>Here’s another way:
				<br/>Get these two books:
				<ul><li>Elements of Programming Interviews</li>
				<li>Cracking the Coding Interview.</li></ul> 
				<br/>Collectively, they give you a good variety of hand-picked problems.</p>
			<br>
			<div style="width:100%; height:max-content;"><embed src="../PDFfiles/CTCIBOOK.pdf" type="application/pdf"   height="1000px" width="900" style="display:block; margin:auto;"></div>	
			<br><br>
    		<h3>Step 3: Master each data structure.</h3>
    		<p>Now that you have finalized your list, start with the basics. Know every data structure.
				<br/>
				Learn how to use each data structure in your language.
				<br/>
				Also, learn how to implement them. Yes, implement them by hand. Many people ignore this, but it’s extremely important. Interviewers can ask you about data structure internals. Many problems modify data structures or re-engineer them for a specific use case. To utilize them fully, you need to know how they work.</p>
          
           
            <p>Online Courses - (<a href="https://www.geeksforgeeks.org/data-structures-and-algorithms-online-courses-free-and-paid/"><i>DSA_GFG_selfpaced course</i></a>)</p>
			<h3>Step 4: Spaced Repetition</h3>
			<p>Alright. You made a list of questions and you started solving them. Here’s a common question we get:"I solve many questions but can’t solve them a week later! How do I remember solutions?"<br/>
				The key is to not remember solutions. The key is to practice them. When you see a problem, you should immediately be able to break it down and re-create the solution. This is different from rote learning. You’re recognizing different components, breaking them down and solving the problem.
				The best technique we’ve seen – solve the problem again in 3 days. Then in a week. Then in a month. It will become second nature to you.
			</p>
			<h3>Step 5: Isolate techniques that are reused. Isolate actual code blocks.</h3>
			<p>This is where the Depth-First approach gets exciting. As you solve these problems, you’ll start to notice patterns. 
				<br/>
				Let’s say you solved 5 problems that used Binary Search. You can isolate the Binary Search code and practice it over and over. You know it will be used in similar problems.
				<br/>And this is one of many techniques you can isolate. Here are some other common ones:<br/>
				<ul>
				<li>Depth First Search</li>
				<li>Recursion + Memoization</li>
				<li>Hash Table + Linked List combination</li>
				<li>Searching a Binary Tree etc.</li>
				</ul>
				</p>
			<h3>Step 6: Now, it's time for Breadth.</h3>
			<p>Let’s say you’ve mastered your core problems. Using common data structures is second nature to you. You can now look beyond your core set. Because you’ve implemented so many techniques already, you don’t even have to code all the new questions.
				<br/>
				During this time, try to solve realistic interview problems. Once you get good, there’s a tendency to focus on really hard problems.</p>
			<h3>Step 7: Practice on paper</h3>
			<p>When you code without an IDE and Stack Overflow, it takes you away from your comfort zone. 
				<br/>
				Here are some benefits of practicing on paper:<br/>
				<ol>
				<li>You’re forced to plan your code before writing. You can’t just go back and retype.</li>
				<li>You will start learning correct language syntax and data structure usage. With an IDE, code used to write itself.</li>
				<li>You can take a paper and pen anywhere with you to practice.</li>
				</ol>
				And more importantly, it is a realistic simulation of a whiteboard interview.

				
				</p>
				<br/>
				  </div>
				 <div class="main-content-container">
				<p>Few Popular websites - 
				<ul>
				<li>InterviewBit - (<a href="https://www.interviewbit.com/practice/"><i>interviewbit-practice/</i></a>)</li>
				<li>HackerEarth - (<a href="https://www.hackerearth.com/practice/"><i>hackerearth-practice</i></a>)</li>
				<li>Geeks For Geeks - (<a href="https://www.geeksforgeeks.org/data-structures/?ref=shm"><i>GFG-DSA</i></a>)</li>
				<li>HackerRank - (<a href="https://www.hackerrank.com/"><i>https://www.hackerrank.com/</i></a>)</li>
				</ul>
				</p>
				<p>Online Editors to practice - <br/>GDB<a href="https://www.onlinegdb.com/"><i>https://www.onlinegdb.com/</i></a> 
				</p>
				<br>
				<h5>Try out the Python compiler!!</h5>
				<p><i>For the comipler to work please...Under Chrome's Settings > Privacy > Content settings, you have the cookie setting set to "Allow all cookies"</i></p><br>
				<div style="width=100%; height=400px;"><iframe frameborder="0" width="100%" height="400px" src="https://create.withcode.uk/"><a target="_blank" href="https://create.withcode.uk/">create.withcode.uk</a></iframe></div>
				<br><br>
			<h5>Few Videos</h5><br>	
    		<iframe width="560" height="315" src="https://www.youtube.com/embed/32Ll35mhWg0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    		<br/>
    		<br/>
    		<iframe width="560" height="315" src="https://www.youtube.com/embed/4B0M0biIa3E" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    		<br/>
    		<br/>
    		<br/>
    		<h3>Congratulations, you're now a pro! Let's get those interviews rolling!!</h3>
    		<br/>
    		<a href="https://www.hackerearth.com/blog/developers/top-7-algorithms-data-structures-every-programmer-know/"><h6><i>Top 7 algorithms and data structures every programmer should know about..</i></h6></a>
    		<br/>
    		<br/>
    		
            </div>
        </section>
    </div>
<jsp:include page="../footer.jsp"/>
</body>
</html>