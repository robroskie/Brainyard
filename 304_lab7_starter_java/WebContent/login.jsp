
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <title>Login Page!</title>

    <link rel="stylesheet" href="./standard.css">
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    
    <link rel="stylesheet" href="profileStyle.css">

    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
</head>

<!-- <nav class="navbar navbar-expand-lg navbar-light bg-light">

    <a href="index.jsp" class="navbar-left"><img src="./Resources/BrainYardLogo.png" width="50 px" style="border-radius: 90%;"></a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">

            <li class="nav-item active">
                <a class="nav-link" href="./index.jsp">Home <span class="sr-only">(current)</span></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="./loaddata.jsp">Load Data</a>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">
                    Queries
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="./listAllQuestions.jsp">Browse Questions</a>
                    <a class="dropdown-item" href="./listAllQuestionsByCategory.jsp">Browse Questions by Category</a>
                    <a class="dropdown-item" href="./addQuestion.jsp">Submit A Question</a>
                    <a class="dropdown-item" href="./correctAnswers.jsp">Correct Answers</a>
                    <a class="dropdown-item" href="./answerHandler.jsp">List Your Answers</a>
                    <a class="dropdown-item" href="./myProfile.jsp">myBrain</a>
                </div>
            </li>
        </ul>
        <a href="index.jsp" class="navbar-right"><img src="<%=String.valueOf(session.getAttribute("profilePic"))%>" width="50 px" style="border-radius: 90%;"></a>
        
        <button type="button" class="btn btn-info btn-md little-margin-left" data-toggle="modal"
            data-target="#LogButton">"<%=String.valueOf(session.getAttribute("authenticatedUser"))%>"</button>
        
    </div>
</nav> -->

<body style="background-color: transparent;">
<div style="margin:0 auto;text-align:center;display:inline; align-items: center;">

<h3>Please Login to System</h3>

<%
// Print prior error login message if present
if (session.getAttribute("loginMessage") != null)
	out.println("<p>"+session.getAttribute("loginMessage").toString()+"</p>");
%>

<br>
<form name="MyForm" method=post action="validateLogin.jsp">
<table style="display:inline">
<tr>
	<td><div align="right" style="padding: 10px;"><font face="Arial, Helvetica, sans-serif" size="2">Username:</font></div></td>
	<td><input type="text" name="username"  size=10 maxlength=10></td>
</tr>
<tr>
	<td><div align="right" style="padding: 10px;"><font face="Arial, Helvetica, sans-serif" size="2">Password:</font></div></td>
	<td><input type="password" name="password" size=10 maxlength="10"></td>
</tr>
</table>
</br>
<input class="submit" type="submit" name="Submit2" value="Log In">
</form>

</div>

</body>
</html>