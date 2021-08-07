  
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Query Results Using JSP</title>
</head>

<body>
    <div><p1>Add A Question!</p1></div> 
    <form action="handleAddQuestion.jsp" method="post">

            <label for="category">Question Category</label>
            <select name="category" id="category">
                <option value="Anthropology">Anthropology</option>
                <option value="Applied Science">Applied Science</option>
                <option value="Art History">Art History</option>
                <option value="Biology">Biology</option>
                <option value="Chemistry">Chemistry</option>
                <option value="Creative Writing">Creative Writing</option>
                <option value="Computer Science">Computer Science</option>
                <option value="Economics">Economics</option>
                <option value="Environmental">Environmental</option>
                <option value="Psychology">Psychology</option>
                <option value="Mathematics">Mathematics</option>
                <option value="History">History</option>
                <option value="Physics">Physics</option>
                <option value="Management">Management</option>
                <option value="null">null</option>
            </select>

            <label for="description">Question Description</label>
            <input type="text" name="description" /> <br/>
            <input type="submit" value="submit">
  
    </form>
</body>
</html>