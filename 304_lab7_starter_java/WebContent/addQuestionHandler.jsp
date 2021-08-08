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



        
    <!-- Add a question -->
    <%
    String url = "jdbc:sqlserver://db:1433;DatabaseName=tempdb;";
    String uid = "SA";
    String pw = "YourStrong@Passw0rd";
    

    // Parse values
    <% 
        String category = request.getParameter("category");
        String description = request.getParameter("description");
        int userid = Integer.parseInt(request.getParameter("userid"));
    %>



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
            out.println("successfully updated"); 


        ps2.setString(1,category);
        int rs2 = ps2.executeUpdate();
        
        out.println("rs2 is: " + rs2);
        
        //rs2.next();
        
        //int categoryNum = rs2.getInt(1);
        //out.println(categoryNum);





        

    }
    catch (SQLException ex) { 
        	out.println(ex); 
    }

    %>

        <!-- Print added question -->
        <p>Added question from category of:<strong> <%=category%> </strong></p>
        <p>Question description:<i> <%=description%> </i>.</p>

    </body>
</html>



