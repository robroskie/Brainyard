<html>
    <head>
        <title>JSP Form Demo</title>
    </head>
    <body>
        <%
            String category = request.getParameter("category");
            String description = request.getParameter("description");

        %>
        <p>Added question from category of:<strong> <%=category%> </strong></p>
        <p>Question description:<i> <%=description%> </i>.</p>
    </body>
</html>