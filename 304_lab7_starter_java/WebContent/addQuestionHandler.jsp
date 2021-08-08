<%@ page import="java.sql.*" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Date" %>

<!DOCTYPE html>
<html>
<head>
<title>Query Results Using JSP</title>
</head>


    <body>


    <!-- Print added question -->
    <%
        String category = request.getParameter("category");
        String description = request.getParameter("description");

    %>
    <p>Added question from category of:<strong> <%=category%> </strong></p>
    <p>Question description:<i> <%=description%> </i>.</p>
        
    <!-- Add a question -->
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

    String SQL = "INSERT INTO Questions VALUES (?,?,?,?,?,?)";

    try ( Connection con = DriverManager.getConnection(url, uid, pw); PreparedStatement ps = con.prepareStatement(SQL);) {
        long millis=System.currentTimeMillis();  
        java.sql.Date date=new java.sql.Date(millis); 

        ps.setInt(1, 31);
        ps.setInt(2, 2);
        ps.setString(3, description);
        
        //This value needs to be category mapped from the string value to corresponding int value	
        ps.setInt(4, 2);
        ps.setDate(5, date);	
        ps.setDate(6, date);	
        int updateQuery = ps.executeUpdate();	
        if(updateQuery != 0)
            out.println("successfully updated"); 
    }
    catch (SQLException ex) { 
        	out.println(ex); 
    }

    %>


    </body>
</html>



