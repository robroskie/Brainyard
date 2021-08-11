<!-- login in page -->
<%@ page import="java.sql.*,java.net.URLEncoder" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Date" %>

<html>

<head>
  <link rel="stylesheet" href="css/style.css">
  <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
  <title>Sign in</title>
</head>

<body>
  <div class="main">
    <p class="sign" align="center">Sign in</p>
    <form action="validateLogin.jsp" method="post">
      <input class="un " type="text" name="username" align="center" placeholder="Username">
      <input class="pass" type="password" name="password" align="center" placeholder="Password">
      <a class="submit" align="center">Sign in</a>
      <p class="forgot" align="center"><a href="#">Forgot Password?</p>
      </form>      
                
    </div>
     
</body>

</html>