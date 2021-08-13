<%@ page language="java" import="java.io.*,java.sql.*"%>
<%@ include file="jdbc.jsp" %>

<%
	String authenticatedUser = null;
    
	session.invalidate();
	String redirectURL = "./ConfirmLogout.jsp";
    response.sendRedirect(redirectURL);
%>