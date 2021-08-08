<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*" %>
<%@page import="java.util.*,java.sql.*,java.io.*" %>
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employee Portal</title>
</head>

<body>

    <%!Connection con; %>

    <%!Statement s; %>

    <%!ResultSetrs; %>

    <% 
    String url = "jdbc:sqlserver://db:1433;DatabaseName=brainYard;";
    String uid = "SA";
    String pw = "YourStrong@Passw0rd";

    String name=request.getParameter("st");
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        con1 = DriverManager.getConnection(url, uid, pw);
        s1=con1.createStatement();
        rs1=s1.executeQuery("select * from employee where id='"+empId+"'");
    } catch(Exception e) { e.printStackTrace();}
    
    %>

    <div id="dt_table">
        <table border='4' cellpadding='6' cellspacing='3' width="300px">
            <tr bgcolor="66FF00"> <th>Empolyee ID</th><th>Empolyee Name</th><th>Employee Age</th><th>Employee Designation</th></tr> <tr>
            <% while(rs1.next()){ %>
                <td><%=rs1.getString(1)%></td>
                <td><%=rs1.getString(2)%></td>
                <td><%=rs1.getInt(5)%></td>
                <td><%=rs1.getString(6)%></td>
            <% } %>
            </tr>
        </table>
    </div>

</body>
</html>