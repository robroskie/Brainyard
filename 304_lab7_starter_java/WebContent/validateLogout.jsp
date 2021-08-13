<%@ page language="java" import="java.io.*,java.sql.*"%>
<%@ include file="jdbc.jsp" %>

<%
	String authenticatedUser = null;
    
	session.invalidate();
	String redirectURL = "./ConfirmLogin.jsp";
    response.sendRedirect(redirectURL);
%>