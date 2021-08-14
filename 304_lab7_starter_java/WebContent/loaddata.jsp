<%@ page import="java.sql.*" %>
<%@ page import="java.util.Scanner" %>
<%@ page import="java.io.File" %>
<%@ include file="jdbc.jsp" %>
<%@ page import="java.sql.ResultSet" %>




<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <title>BrainYard: Load Data</title>

    <link rel="stylesheet" href="./standard.css">
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    
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
                    <a class="dropdown-item" href="./myProfile.jsp">My Profile</a>
                </div>
            </li>
        </ul>

        <a href="index.jsp" class="navbar-right"><img src="<%=String.valueOf(session.getAttribute("profilePic"))%>" width="50 px" style="border-radius: 90%;"></a>

        <button type="button" class="btn btn-info btn-md little-margin-left" data-toggle="modal"
            data-target="#LogButton"> <%= session.getAttribute("loginbutton") %>
        </button>
        
    </div>
</nav>

<body>

<%
// Load driver class
try {	
        Class.forName("com.mysql.cj.jdbc.Driver");
    }
catch (java.lang.ClassNotFoundException e) {
        System.err.println("ClassNotFoundException: " +e);	
    }

String url = "jdbc:sqlserver://db:1433;DatabaseName=tempdb;";
String uid = "SA";
String pw = "YourStrong@Passw0rd";

out.print("<h1>Connecting to database.</h1><br><br>");

Connection con = DriverManager.getConnection(url, uid, pw);
        
String fileName = "/usr/local/tomcat/webapps/shop/orderdb_sql.ddl";

try
{
    // Create statement
    Statement stmt = con.createStatement();
    
    Scanner scanner = new Scanner(new File(fileName));
    // Read commands separated by ;
    scanner.useDelimiter(";");
    while (scanner.hasNext())
    {
        String command = scanner.next();
        if (command.trim().equals(""))
            continue;
        // out.print(command);        // Uncomment if want to see commands executed
        try
        {
            stmt.execute(command);
        }
        catch (Exception e)
        {	// Keep running on exception.  This is mostly for DROP TABLE if table does not exist.
            out.print(e);
        }
    }	 
    scanner.close();
    
    out.print("<br><br><h1>Database loaded.</h1>");
    con.close();
}

catch (Exception e)
{
    out.print(e);
}  
%>


<!-- THE PURPOSE OF THE CODE BELOW IS TO CORRECTLY UPDATE THE TIMEUNTILCLOSE ROW -->
<% 


   
    String SQL5 = "UPDATE Questions SET TimeUntilClose = DATEADD(day, 14, postTime)";
    String SQL6 = "ALTER TABLE Questions ADD DaysRemaining AS CASE WHEN GETDATE() < TimeUntilClose THEN DATEDIFF(second, GETDATE(), TimeUntilClose) / 86400 WHEN GETDATE() > TimeUntilClose THEN 0 END";
    String SQL7 = "ALTER TABLE Questions ADD HoursRemaining AS CASE WHEN GETDATE() < TimeUntilClose THEN DATEDIFF(second, GETDATE(), TimeUntilClose) % 3600 % 24 WHEN GETDATE() > TimeUntilClose THEN 0 END";
    String SQL8 = "ALTER TABLE Questions ADD MinutesRemaining AS CASE WHEN GETDATE() < TimeUntilClose THEN DATEDIFF(second, GETDATE(), TimeUntilClose) / 60 % 60 WHEN GETDATE() > TimeUntilClose THEN 0 END";
    String SQL9 = "ALTER TABLE Questions ADD SecondsRemaining AS CASE WHEN GETDATE() < TimeUntilClose THEN DATEDIFF(second, GETDATE(), TimeUntilClose) % 60 WHEN GETDATE() > TimeUntilClose THEN 0 END";
    String SQL10 = "ALTER TABLE Questions ADD Expired AS CASE WHEN GETDATE() > TimeUntilClose THEN 't' WHEN GETDATE() < TimeUntilClose THEN 'f' END";


    try(
        Connection con2 = DriverManager.getConnection(url, uid, pw);   
        Statement stmt = con2.createStatement();    
        Statement stmt2 = con2.createStatement();
        Statement stmt3 = con2.createStatement();
        Statement stmt4 = con2.createStatement();
        Statement stmt5 = con2.createStatement();
        Statement stmt6 = con2.createStatement(); ){
    

        long millis=System.currentTimeMillis();  
        java.sql.Date date=new java.sql.Date(millis); 

        stmt.executeUpdate(SQL5);

        stmt2.executeUpdate(SQL6);
        stmt3.executeUpdate(SQL7);
        stmt4.executeUpdate(SQL8);
        stmt5.executeUpdate(SQL9);
        stmt6.executeUpdate(SQL10);
        
    }

    catch (SQLException ex) { 
        	out.println(ex); 
    }

 %> 


<!-- Modal -->
<div id="LogButton" class="modal fade" role="dialog">

    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Sign into BrainYard</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body">
                <!-- <p>This is where our sign in code/status will go.</p> -->
                
                <div class="container-md">
                    <object type="text/html" data="./authorizationavi.jsp" width="450px" height="500px"
                        style="overflow:auto;">
                    </object>
                </div>

            </div>
            <div class="modal-footer">
                <button onClick="window.location.reload();" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>

        </div>
    </div>
</div>

</body>
</html> 
