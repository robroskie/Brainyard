<%@ page import="java.sql.*" %>
<%@ page import="java.io.File" %>
<%@ include file="jdbc.jsp" %>

<%
String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
<!-- String connectionUrl = "jdbc:sqlserver://db:1433;DatabaseName=tempdb;"; -->
<!-- String database = "testdb";
String userid = "root";
String password = ""; -->

String url = "jdbc:sqlserver://db:1433;DatabaseName=brainYard;";
String uid = "SA";
String pw = "YourStrong@Passw0rd";

try {
    Class.forName(driver);
    } catch (ClassNotFoundException e) {
    e.printStackTrace();
}

Connection con = null;
Statement smt = null;
ResultSet resultSet = null;

try{
    
    String roll_no=request.getParameter("roll_no");
    
    <!-- String category=request.getParameter("category");
    connection = DriverManager.getConnection(connectionUrl+database, userid, password);
     -->

    con = DriverManager.getConnection(url, uid, pw);
    smt = connection.createStatement();
    
    String sql ="select StudentEmail from BUsers where UserId="+roll_no;
    out.println(sql)
    <!-- String sql = -->
    
    resultSet = statement.executeQuery(sql);

    int i=0;
    while(resultSet.next()){
        String StudentEmail=resultSet.getString("StudentEmail");
        i++;
        out.println(StudentEmail);
}

connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>