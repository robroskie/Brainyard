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
</nav>
<!-- Connection Information -->
    <%
    String url = "jdbc:sqlserver://db:1433;DatabaseName=tempdb;";
    String uid = "SA";
    String pw = "YourStrong@Passw0rd";
    

    // Parse values
    String category = request.getParameter("category");
    String description = request.getParameter("description");
    int userid = Integer.parseInt(request.getParameter("userid"));

    try 
    {	// Load driver class
        Class.forName("com.mysql.jdbc.Driver");
    }
    catch (java.lang.ClassNotFoundException e) {
        System.err.println("ClassNotFoundException: " +e);	
    }

    String SQL = "INSERT Questions(UserId, Description, Category, TimeUntilClose, postTime) VALUES (?,?,?,?,?)";
    String SQL2 = "SELECT CategoryId FROM Categories WHERE subjTitle=?";


    //INSERT Questions(UserId, Description, Category, TimeUntilClose, postTime) VALUES (1, 'How does a Cas9 protein recognize its complementing genetic target sequence?', 4, '2012-04-11 12:12:12', '2012-05-11 12:12:12');

    try ( Connection con = DriverManager.getConnection(url, uid, pw); PreparedStatement ps = con.prepareStatement(SQL);  PreparedStatement ps2 = con.prepareStatement(SQL2);) {
        //Get integer value from category string

        
        long millis=System.currentTimeMillis();  
        java.sql.Date date=new java.sql.Date(millis); 

        ps.setInt(1, userid);;
        ps.setString(2, description);
        
        //This value needs to be category mapped from the string value to corresponding int value	
        ps.setInt(3, 6);
        ps.setDate(4, date);	
        ps.setDate(5, date);	
        int updateQuery = ps.executeUpdate();	

        if(updateQuery != 0)
            out.println("Successfully updated your question!"); 


        ps2.setString(1,category);
        int rs2 = ps2.executeUpdate();
        
    }

    catch (SQLException ex) { 
        	//out.println(ex); 
    }

    %>