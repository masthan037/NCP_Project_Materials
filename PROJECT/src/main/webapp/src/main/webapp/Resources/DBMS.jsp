<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel = "stylesheet" href = "css/dbms.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<title>Data Base Management System</title>
</head>
<body>
<body>
	
	<jsp:include page="../navbar.jsp"/>
	
    <div class="container" style="margin-left:140px">
        <div class="sidebar">
            <div class="section-topics">
                <h4 class="section-title">Topics</h4>
                <ul>
                    <li><a href="#"><b>DBMS Tutorial</b></a></li>
                    <li><a href="#"><b>ER Model</b></a></li>
                    <li><a href="#"><b>Relational Model</b></a></li>
                    <li><a href="#"><b>Relational DB Design</b></a></li>
                    <li><a href="#"><b>Storage and File Structure</b></a></li>
                    <li><a href="#"><b>Indexing and Hashing</b></a></li>
                    <li><a href="#"><b>Transaction and Concurrency</b></a></li>
                    <li><a href="#"><b>Backup and Recovery</b></a></li>
                    <li><a href="#"><b>DBMS Useful Rescources</b></a></li>
                </ul>
            </div>
        </div>
        <section class="main-content">
        	<div class="main-content-container"><h1 style="color:#28B5B5;">&emsp;&emsp;&emsp;&emsp;DATABASE MANAGEMENT SYSTEM</h1></div>
        	
            <h1 class="main-heading" style="color: rgb(0, 0, 0);"><img class="dbms-img" style="border:5px solid darkcyan;" height="350px" width="900px" src="DBMS.jpg"></h1>
       
            <div class="main-content-container">
                <p><h3><b>Database </b></h3> is a collection of related data and data is a collection of facts and figures that
                    can be
                    processed
                    to produce information.

                    Mostly data represents recordable facts. Data aids in producing information, which is based on
                    facts.
                    For
                    example, if we have data about marks obtained by all students, we can then conclude about toppers
                    and
                    average marks.

                    A database management system stores data in such a way that it becomes easier to retrieve,
                    manipulate,
                    and
                    produce information.</p>
                <h3 style="color: rgb(172, 172, 236);">Characteristics</h3>
                <p>Traditionally, data was organized in file formats. DBMS was a new concept then, and all the research
                    was
                    done
                    to make it overcome the deficiencies in traditional style of data management. A modern DBMS has the
                    following characteristics −<br>

                    <b>Real-world entity : </b>A modern DBMS is more realistic and uses real-world entities to
                    design its
                    architecture.
                    It uses the behavior and attributes too. For example, a school database may use students as an
                    entity
                    and
                    their age as an attribute.<br><br>

                    <b>Relation-based tables :</b> DBMS allows entities and relations among them to form tables. A user
                    can
                    understand
                    the architecture of a database just by looking at the table names.<br><br>

                    <b>Isolation of data and application :</b> A database system is entirely different than its data. A
                    database is
                    an
                    active entity, whereas data is said to be passive, on which the database works and organizes. DBMS
                    also
                    stores metadata, which is data about data, to ease its own process.<br><br>

                    <b>Less redundancy :</b> DBMS follows the rules of normalization, which splits a relation when any
                    of its
                    attributes is having redundancy in values. Normalization is a mathematically rich and scientific
                    process
                    that reduces data redundancy.<br><br>

                    <b>Consistency :</b> Consistency is a state where every relation in a database remains consistent.
                    There
                    exist
                    methods and techniques, which can detect attempt of leaving database in inconsistent state. A DBMS
                    can
                    provide greater consistency as compared to earlier forms of data storing applications like
                    file-processing
                    systems.<br><br>

                    <b>Query Language : </b>DBMS is equipped with query language, which makes it more efficient to
                    retrieve and
                    manipulate data. A user can apply as many and as different filtering options as required to retrieve
                    a
                    set
                    of data. Traditionally it was not possible where file-processing system was used.<br><br>

                    <b>ACID Properties : </b>DBMS follows the concepts of Atomicity, Consistency, Isolation, and
                    Durability
                    (normally
                    shortened as ACID). These concepts are applied on transactions, which manipulate data in a database.
                    ACID
                    properties help the database stay healthy in multi-transactional environments and in case of
                    failure.<br><br>

                    <b>Multiuser and Concurrent Access :</b> DBMS supports multi-user environment and allows them to
                    access and
                    manipulate data in parallel. Though there are restrictions on transactions when users attempt to
                    handle
                    the
                    same data item, but users are always unaware of them.<br><br>

                    <b>Multiple views :</b> DBMS offers multiple views for different users. A user who is in the Sales
                    department
                    will
                    have a different view of database than a person working in the Production department. This feature
                    enables
                    the users to have a concentrate view of the database according to their requirements.<br><br>

                    <b>Security :</b> Features like multiple views offer security to some extent where users are unable
                    to
                    access
                    data
                    of other users and departments. DBMS offers methods to impose constraints while entering data into
                    the
                    database and retrieving the same at a later stage. DBMS offers many different levels of security
                    features,
                    which enables multiple users to have different views with different features. For example, a user in
                    the
                    Sales department cannot see the data that belongs to the Purchase department. Additionally, it can
                    also
                    be
                    managed how much data of the Sales department should be displayed to the user. Since a DBMS is not
                    saved
                    on
                    the disk as traditional file systems, it is very hard for miscreants to break the code.
                </p>
            </div>
        </section>
    </div>
    <div >
    <h3 class=" main-content-container_prep" style="text-align: center; margin-top: 100px;">MySql Preperation Videos</h3>
    </div>
    <div class="mysql-section">
        <div class="video1  "><iframe width="400" height="200" src="https://www.youtube.com/embed/2bW3HuaAUcY"
                title="YouTube video player" frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowfullscreen></iframe></div>
        <div class="video2  "><iframe width="400" height="200" src="https://www.youtube.com/embed/2bW3HuaAUcY"
                title="YouTube video player" frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowfullscreen></iframe></div>
        <div class="video3 "><iframe width="400" height="200" src="https://www.youtube.com/embed/2bW3HuaAUcY"
                title="YouTube video player" frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowfullscreen></iframe></div>
    </div>
<jsp:include page="../footer.jsp"/>
</body>
</html>