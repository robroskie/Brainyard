
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Get Your Answers!!</title>
</head>

<body>
<div><p1>Whats your BrainID?</p1></div>

<form action="listAnswers.jsp" method="post">

    <label for="BrainID">BrainID</label>
    <input type="text" name="BrainID" placeholder="BrainID" /> <br/>
    <input type="submit" value="submit">



</form>
</body>
</html>