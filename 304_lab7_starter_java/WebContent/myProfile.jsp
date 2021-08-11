  
<%@ page import="java.sql.*" %>

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <title>BrainYard: Main Page</title>

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

<nav class="navbar navbar-expand-lg navbar-light bg-light">

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
                    <!-- <a class="dropdown-item" href="./testQuery.jsp">Database Connection Test</a> -->
                    <a class="dropdown-item" href="./listAllQuestions.jsp">Browse Questions</a>
                    <a class="dropdown-item" href="./listAllQuestionsByCategory.jsp">Browse Questions by Category</a>
                    <a class="dropdown-item" href="./addQuestion.jsp">Submit A Question</a>
                    <a class="dropdown-item" href="./correctAnswers.jsp">Correct Answers</a>
                    <a class="dropdown-item" href="./answerHandler.jsp">List Your Answers</a>
                    <a class="dropdown-item" href="./myProfile.jsp">myBrain</a>
                    <a class="dropdown-item" href="./login.jsp">Login</a>
                </div>
            </li>
        </ul>

        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>

        <!-- Trigger the modal with a button -->
        <button type="button" class="btn btn-info btn-md little-margin-left" data-toggle="modal"
            data-target="#LogButton">Login
            to the site</button>

    </div>
</nav>

<%

    

    //  <!-- Connection Information -->
    String url = "jdbc:sqlserver://db:1433;DatabaseName=tempdb;";
    String uid = "SA";
    String pw = "YourStrong@Passw0rd";
    

    try {	
        Class.forName("com.mysql.jdbc.Driver");
    }
    catch (java.lang.ClassNotFoundException e) {
        System.err.println("ClassNotFoundException: " +e);	
    }

    //Get total number of questions by userid
    String SQL = "SELECT UserId, COUNT(Qid) FROM Questions WHERE UserId=? GROUP BY UserId";

    //Get total number of answers by userid
    String SQL1 = "SELECT userId, COUNT(AnsId) FROM Answers WHERE userId=? GROUP BY userId";


    

    try ( Connection con = DriverManager.getConnection(url, uid, pw); PreparedStatement ps = con.prepareStatement(SQL); PreparedStatement ps1 = con.prepareStatement(SQL1);) {
        //Get integer value from category string
        int userId = (int)session.getAttribute("userId");
        
        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();	
        rs.next();
        String numQuestions = rs.getString(2);
        session.setAttribute("numQuestions", numQuestions);
        ps.close();

        ps1.setInt(1, userId);
        ResultSet rs1 = ps1.executeQuery();	
        rs1.next();
        String numAns = rs1.getString(2);
        session.setAttribute("numAns", numAns);   

  
    }

    catch (SQLException ex) { 
        	out.println(ex); 
    }




    // Get rank, balances, questions and answers of current user
%>

<body>
    <div class="container mt-5 d-flex justify-content-center">
        <div class="card p-3">
            <div class="d-flex align-items-center">
                <div class="image"> <img src="Avatar/1.jpg" class="rounded" width="155"> </div>
                <div class="ml-3 w-100">
                    <h4 class="mb-0 mt-0"><%= session.getAttribute("userId")%></h4> <span>Current Rank</span>
                    <h4 class="mb-0 mt-0"><%= session.getAttribute("University")%></h4> <span>Current Rank</span>
                    <div class="p-2 mt-2 bg-primary d-flex justify-content-between rounded text-white stats">
                        <div class="d-flex flex-column"> <span class="articles">Questions</span> <span class="number1"> <%= session.getAttribute("numQuestions") %> </span> </div>
                        <div class="d-flex flex-column"> <span class="followers">Answers</span> <span class="number2"><%= session.getAttribute("numAns") %></span> </div>
                        <div class="d-flex flex-column"> <span class="rating">Rating</span> <span class="number3">8.9</span> </div>
                    </div>
                    <div class="button mt-2 d-flex flex-row align-items-center"> <button class="btn btn-sm btn-outline-primary w-100">Chat</button> <button class="btn btn-sm btn-primary w-100 ml-2">Follow</button> </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container2 mt-5 d-flex justify-content-center">
        <div class="card p-3">
            <div class="d-flex align-items-center">
                <div class="ml-3 w-100">
                    <h4 class="mb-0 mt-0" id="balheader">Your Balances</h4>
                    <div class="p-2 mt-2 bg-primary d-flex justify-content-between rounded text-white stats">
                         <div class="d-flex flex-column">  <span class="articles coins" id="bitcoin">Bitcoin <img src="Resources/bitcoin.jpg" id="bitcoinimg" align="right" width="25" height="25"></span><html>  <span class="number1">1 </span>  </div>
                        <div class="d-flex flex-column"> <span class="followers coins" id="eth">Etherum <img src="Resources/eth.png" align="right" width="22" height="22"></span> <span class="number2">2</span> </div>
                        <div class="d-flex flex-column"> <span class="rating coins" id="dogecoin">Dogecoin <img src="Resources/doge.png" align="right" width="22" height="22"> </span> <span class="number3">3</span> </div>
                    </div>
                 
            </div>
        </div>
    </div>
</body>
</html>

