<html>
    <head>
        <title>JSP Form Demo</title>
    </head>
    <body>
        <%
            String category = request.getParameter("category");
            String description = request.getParameter("description");

        %>
        <p>Hi <%=category%> <%=description%>!</p>
    </body>
</html>