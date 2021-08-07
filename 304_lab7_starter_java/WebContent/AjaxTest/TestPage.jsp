<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Query Results Using JSP</title>
</head>

<body>

<% 
String url = "jdbc:sqlserver://db:1433;DatabaseName=brainYard;";
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
	ResultSet rst = stmt.executeQuery("SELECT * FROM Categories");		
	out.println("<table>");
	while (rst.next())
	{	
        out.println("<tr><td>"+rst.getString("subjTitle") + "</td></tr>");
	}
    out.println("</table>");
}
catch (SQLException ex) 
{ 	out.println(ex); 
}
%>
</body>
</html>