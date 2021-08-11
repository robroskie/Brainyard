<html>

<head>
    Testing data gathering
</head>

<body>
    <%out.println("<p>"+request.getParameter("username").toString()+"</p>");
    out.println("<p>"+"\n"+"</p>");
    out.println("<p>"+request.getParameter("password").toString()+"</p>");
</body>

</html>


<!-- 
<%@ page language="java" import="java.io.*" %>
<%
String authenticatedUser = null;
session = request.getSession(true);
<!-- // May create new session try -->
{ authenticatedUser = validateLogin(out,request,session);
}
catch(IOException e) { out.println(e); }
if (authenticatedUser != null) response.sendRedirect("protectedPage.jsp"); // Success  
else
response.sendRedirect("login.jsp"); 
%>

<%!

String validateLogin(JspWriter out,HttpServletRequest request, HttpSession session) throws IOException 
{
String username = request.getParameter("username"); 
String password = request.getParameter("password"); 
String retStr = null;

if(username == null || password == null)
return null;
if((username.length() == 0) || (password.length() == 0))
return null;

if (username.equals("test") && password.equals("test"))
  retStr = username;
  if(retStr != null)
{ session.removeAttribute("loginMessage");
} session.setAttribute("authenticatedUser",username);
else
session.setAttribute("loginMessage","Failed login."); 
return retStr;
}%> -->