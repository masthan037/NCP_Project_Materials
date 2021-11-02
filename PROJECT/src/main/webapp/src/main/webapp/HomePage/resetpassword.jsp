<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/resetpassword.css">
    <title>ResetPassword</title>
</head>
<body>
	<jsp:include page="../navbar.jsp"/>
	<div class="box">
        <h3 style="color: rgb(13, 107, 107); text-align: center;">RESET PASSWORD</h3><br>
        <form action="">
            <label for="newPassword">New Password</label><br>
            <input type="password"><br>
            <label for="confirmNewPassword">Confirm New Password</label><br>
            <input type="password"><br><br>
            <button class="btn btn-info" type="submit" style="color:white">Update</button>
        </form>
    </div>
</body>
</html>