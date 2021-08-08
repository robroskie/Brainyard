<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>Main Page!</title>

    <link rel="stylesheet" href="standard.css">
</head>

<nav class="navbar navbar-expand-lg navbar-light bg-light">

    <a href="HelloWorld.jsp" class="navbar-left"><img src=".\Resources/Brain_Yard_logo.png" width="150 px"></a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">

            <li class="nav-item active">
                <a class="nav-link" href="../index.jsp">Home <span class="sr-only">(current)</span></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="../loaddata.jsp">Load Data</a>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">
                    Dropdown
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="./AjaxTest/ajaxtest.jsp">Ajax Test</a>
                    <a class="dropdown-item" href="../testQuery.jsp">JSP Test Page</a>
                    <a class="dropdown-item" href="../listAllQuestions.jsp">list orders</a>
                    <a class="dropdown-item" href="../addQuestion.jsp">add cart</a>
                    <a class="dropdown-item" href="../correctAnswers.jsp">show cart</a>

                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="#">Disabled</a>
            </li>
        </ul>

        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>

        <!-- Trigger the modal with a button -->
        <button type="button" class="btn btn-info btn-md little-margin-left" data-toggle="modal"
            data-target="#LogButton">Login
            to the site</button>

    </div>
</nav>

<body>
    <div style="margin: auto;width:30%;padding-top:50px">
        <form id="form1" name="form1" method="post">
            <div class="form-group">
                <input type="text" class="form-control" placeholder='Search by rollno...' id="roll_no"><br>
                <p align="center"><button type="submit" class="btn btn-primary btn-default" id="search">Submit</button>
                </p><br>
                <label for="city">Display city name of student:</label>
                <input type="text" class="form-control" placeholder='City name' id="city_name"><br><br>
            </div>
        </form>
    </div>

    <div id="demo">
        <h2>Let AJAX change this text</h2>
        <button type="button" onclick="loadDoc()">Change Content</button>
    </div>

    
    <script>
        $("#search").click(function () {
            var roll_no = $('#roll_no').val();
            city_name.value = city_name;
            $.ajax({
                url: "fetch.jsp",
                type: 'POST',
                data: { roll_no: roll_no },
                success: function (data) {
                    $('#city_name').val(data);
                    alert(data);
                    var city_name = data;
                }
            });
        });
    </script>
</body>

</html>