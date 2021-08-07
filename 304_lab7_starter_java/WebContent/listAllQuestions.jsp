//List all questions for a selected category
<%@ page import="java.sql.*,java.net.URLEncoder" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>YOUR NAME Grocery</title>
</head>
<body>

<h1>Use the dropdown bar to select the category of question that you want to see!</h1>



<% 
String url = "jdbc:sqlserver://db:1433;DatabaseName=tempdb;";
String uid = "SA";
String pw = "YourStrong@Passw0rd";





try 
{	// Load driver class
	Class.forName("com.mysql.jdbc.Driver");
}
catch (java.lang.ClassNotFoundException e) {
	System.err.println("ClassNotFoundException: " +e);	
}
try ( Connection con = DriverManager.getConnection(url, uid, pw);
      Statement stmt = con.createStatement();) 
{		
	ResultSet rst = stmt.executeQuery("SELECT * FROM Questions ORDER BY TimeUntilClose ASC");		
	out.println("<table><tr><th>QId</th><th>UserId</th><th>Description</th><th>Category</th><th>TimeUntilClose</th><th>postTime</th></tr>");
	while (rst.next())
	{	out.println("<tr><td>"+rst.getInt(1)+"</td>"+"<td>"+rst.getInt(2)+"</td>"+"<td>"+rst.getString(3)+"</td>"+"<td>"+rst.getInt(4)+"</td><td>"+rst.getTimestamp(5)+"</td><td>"+rst.getTimestamp(6)+"</td></tr>");
	}
	out.println("</table>");
}
catch (SQLException ex) 
{ 	out.println(ex); 
}
%>

</body>
</html>