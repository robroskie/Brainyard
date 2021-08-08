//List all questions for a selected category
<%@ page import="java.sql.*,java.net.URLEncoder" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Date" %>
<!DOCTYPE html>
<html>
<head>
<title>Your Ansers!!!</title>
</head>
<body>
    
<% 
String url = "jdbc:sqlserver://db:1433;DatabaseName=tempdb;";
String uid = "SA";
String pw = "YourStrong@Passw0rd";

int userId=Integer.parseInt(request.getParameter("BrainID"));

try 
{	// Load driver class
	Class.forName("com.mysql.jdbc.Driver");
}
catch (java.lang.ClassNotFoundException e) {
	System.err.println("ClassNotFoundException: " +e);	
}

String sql="SELECT Description, PTime FROM Answers WHERE userId=?";

try ( Connection con = DriverManager.getConnection(url, uid, pw); PreparedStatement ps=con.prepareStatement(sql);) 
{	
   
    PreparedStatement ps=con.prepareStatement(sql);
    ps.setInt(1,userId);

	ResultSet rst=ps.executeQuery();

	out.println("<table><tr><th>Descripotion</th><th>PTime</th></tr>");
	while (rst.next())
	{	out.println("<tr><td>"+rst.getString(1)+"</td>"+"<td>"+rst.getDATE(2)+"</td></tr>");
	}
	out.println("</table>");
}
catch (SQLException ex) 
{ 	out.println(ex); 
}
%>
</body>
</html>