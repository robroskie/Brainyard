<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <title>BrainYard: Main Page</title>

    <link rel="stylesheet" href="./standard.css">
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
</head>

<nav class="navbar navbar-expand-lg navbar-light bg-light">

    <a href="index.jsp" class="navbar-left"><img src="./Resources/Brain_Yard_logo.png" width="150 px"></a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">

            <li class="nav-item active">
                <a class="nav-link" href="./index.jsp">Home <span class="sr-only">(current)</span></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="./loaddata.jsp">Load Data</a>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">
                    Queries
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <!-- <a class="dropdown-item" href="./testQuery.jsp">Database Connection Test</a> -->
                    <a class="dropdown-item" href="./listAllQuestions.jsp">Browse Questions</a>
                    <a class="dropdown-item" href="./listAllQuestionsByCategory.jsp">Browse Questions by Category</a>
                    <a class="dropdown-item" href="./addQuestion.jsp">Submit A Question</a>
                    <a class="dropdown-item" href="./correctAnswers.jsp">Correct Answers</a>
                    <a class="dropdown-item" href="./answerHandler.jsp">List Your Answers</a>
                </div>
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



<body style="background-color: white;">

    <div class="container-fluid" style="height: 40px; width: 100%;">
        <h4 style="text-align: center; padding-top: 5px;"> Real questions. Real people. </h4>
    </div>

    <!-- <div class="container-fluid pb-2" style="padding-top: 10 px;">
        <div class="hero-image" style='background-image: url("./Resources/Brain Yard.svg")'>
            <div class="hero-text">
                <h1 style="font-size:50px">BrainYard</h1>
                <h3>"Please start by loading the database."</h3>
            </div>
        </div>
    </div> -->

    <div class="container-fluid pb-2" style="height: 800px;">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>

            <div class="carousel-inner">
                <!-- <h1 style="position:absolute; z-index: 20; color: black; top: 25%;">Centered</h1> -->
                <div class="carousel-item active">
                    <img class="d-block w-100" src="./Resources/1.svg" alt="First slide"
                        style="height: 800px; object-fit:cover; object-position: bottom;">
                    <!-- <div class="hero-text" style="z-index: 20; color: white; text-shadow: 1px 1px 4px #000000;">
                        <h1 style="font-size:50px">BrainYard</h1>
                        <h3>Please start by loading the database.</h3>
                    </div> -->
                </div>

                <div class="carousel-item">
                    <img class="d-block w-100" src="./Resources/2.svg"
                        alt="Second slide" style="height: 800px; object-fit: cover; object-position: bottom;">
                    <!-- <div class="hero-text" style="z-index: 20; color: white; text-shadow: 1px 1px 4px #000000;">
                        <h1 style="font-size:50px">Collaborate</h1>
                        <h3>Work together with a community of students</h3>
                    </div> -->
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100"
                        src="./Resources/3.svg" alt="Third slide"
                        style="height: 800px; object-fit: cover; object-position: bottom;">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>

        </div>
    </div>

    

    <div class="container-fluid" style="padding-top: 10px;"></div>
        <div class="row" style="padding: 10px; background-color: #000000; height: 370px;">
            
            <div class="col" style="top:20px;">
                <img class="pl-3" src="https://media-cldnry.s-nbcnews.com/image/upload/newscms/2020_21/3359781/200521-college-student-laptop-stock-cs-419p.jpg" alt="A student studies" style="width: 80%;">
            </div>
            
            <div class="col-4" style="top:30px;">
                <img src="https://www.icpas.org/images/default-source/insight/icpas-laptop-scholarship-800.jpg?sfvrsn=da560e1d_0" alt="another laptop" style="width: 80%;">
            </div>
            
            <div class="col-2" style="top:40px; right: 60px;">
                <img src="./Resources/Student.png" alt="" style="width: 100%;">
            </div>
            <div class="col">
            <img src="https://images.journeys.ca/images/products/1_412829_ZM.JPG" alt="" style="width: 60%;">
            </div>
        </div>
        <div class="row" style="padding:10px; background-color: #000000; height: 100px;">
            <div class ="col">
                <div class="hero-text" style="align-content:center;">
                    <h1 style="font-size:50px; color: white;">BrainYard</h1>
                </div>
            </div>
        </div>
    
    </div>

    <!-- <div class="container comments-box">
        <div class="jumbotron bg-dark my-4">
            <h1 class="display-4 text-white">Threaded Comments - Bootstrap 4</h1>
            <ul class="timeline-comments">

                <li class="timeline-comment">
                    <div class="timeline-comment-wrapper">
                        <div class="card">
                            <div class="card-header d-flex align-items-center">
                                <a href="#" class="d-flex align-items-center">
                                    <img class="rounded-circle" src="assets/images/avatar.jpg" alt="avatar" />
                                    <h5>zshare</h5>
                                </a>
                                <div class="comment-date" data-toggle="tooltip" title="Feb 5, 2018 8:21 pm"
                                    data-placement="top" data-original-title="Feb 5, 2018 8:21 pm">Sep 19, 2018</div>
                            </div>
                            <div class="card-body">
                                <p class="card-text">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eos
                                    sapiente, nam ipsam veritatis reiciendis dolore soluta magni sit pariatur veniam
                                    laborum perferendis, molestias amet excepturi voluptatem iure porro reprehenderit
                                    doloribus.</p>
                            </div>
                            <div class="card-footer bg-white p-2">
                                <button type="button" class="btn btn-secondary btn-sm">Reply</button>
                                <small class="text-muted ml-2">Last updated 3 mins ago</small>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div> -->

    <!-- Modal -->
    <div id="LogButton" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Sign into BrainYard</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <div class="modal-body">
                    <p>This is where our sign in code/status will go.</p>
                    <div class="container-md">
                        <object type="text/html" data="./Login/login-page.html" width="450px" height="600px"
                            style="overflow:auto;">
                        </object>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>

            </div>
        </div>
    </div>
</body>

</html>