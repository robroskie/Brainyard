//List all questions for a selected category
<%@ page import="java.sql.*,java.net.URLEncoder" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Your Ansers!!!</title>
</head>
<body>
<h1>Enter your BrainID</h1>
<ul> 
    <li><p><b>BrainID</b>
        <%=request.getParameter("BrainID")%>
    </p></li>
</ul>
    
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
    String sql="SELECT Description, PTime FROM Answers WHERE userId=?";
    PreparedStatement ps=con.prepareStatement(sql);
    ps.getInt(1,request.getParameter("BrainID"));

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