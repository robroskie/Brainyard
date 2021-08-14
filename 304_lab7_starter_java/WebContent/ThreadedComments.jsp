<%@ include file="LoginFilter.jsp" %>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
    <link rel="stylesheet" href="./standard.css">
    <link rel="stylesheet" href="./StyleDocs/threaded.css" />

    <title>Threaded Comments | Bootstrap 4</title>

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

    <a href="index.jsp" class="navbar-left"><img src="./Resources/BrainYardLogo.png" width="50 px" style="border-radius: 90%;"></a>

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
                    <a class="dropdown-item" href="./listAllQuestions.jsp">Browse Questions</a>
                    <a class="dropdown-item" href="./listAllQuestionsByCategory.jsp">Browse Questions by Category</a>
                    <a class="dropdown-item" href="./addQuestion.jsp">Submit A Question</a>
                    <a class="dropdown-item" href="./correctAnswers.jsp">Correct Answers</a>
                    <a class="dropdown-item" href="./answerHandler.jsp">List Your Answers</a>
                    <a class="dropdown-item" href="./myProfile.jsp">My Profile</a>
                    <a class="dropdown-item" href="./ThreadedComments.jsp">ThreadedComments</a>
                </div>
            </li>
        </ul>

        <a href="index.jsp" class="navbar-right"><img src="<%=String.valueOf(session.getAttribute("profilePic"))%>" width="50 px" style="border-radius: 90%;"></a>

        <button type="button" class="btn btn-info btn-md little-margin-left" data-toggle="modal"
            data-target="#LogButton"> <%= session.getAttribute("loginbutton") %>
        </button>
        
    </div>
</nav>

<body>

    <div class="container comments-box">

        <!-- <div class="jumbotron bg-dark my-4">
            <h1 class="display-4 text-white"> Comments - Bootstrap 4</h1>
        </div> -->

        <ul class="timeline-comments">

            <li class="timeline-comment">
                <div class="timeline-comment-wrapper">
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
                            <a href="#" class="d-flex align-items-center">
                                <img class="rounded-circle" src="Avatars/1.png" alt="avatar" />
                                <h5>zshare</h5>
                            </a>
                            <div class="comment-date" data-toggle="tooltip" title="Feb 5, 2018 8:21 pm" data-placement="top" data-original-title="Feb 5, 2018 8:21 pm">Sep 19, 2018</div>
                        </div>
                        <div class="card-body">
                            <p class="card-text">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eos sapiente, nam ipsam veritatis reiciendis dolore soluta magni sit pariatur veniam laborum perferendis, molestias amet excepturi voluptatem iure porro reprehenderit doloribus.</p>
                        </div>
                        <div class="card-footer bg-white p-2">
                            <button type="button" class="btn btn-secondary btn-sm">Reply</button>
                            <small class="text-muted ml-2">Last updated 3 mins ago</small>
                        </div>
                    </div>
                </div>
            </li>

            <li class="timeline-comment">
                <div class="timeline-comment-wrapper">
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
                            <a href="#" class="d-flex align-items-center">
                                <img class="rounded-circle" src="Avatars/2.png" alt="avatar" />
                                <h5>zshare</h5>
                            </a>
                            <div class="comment-date" data-toggle="tooltip" title="Feb 5, 2018 8:21 pm" data-placement="top" data-original-title="Feb 5, 2018 8:21 pm">Sep 19, 2018</div>
                        </div>
                        <div class="card-body">
                            <p class="card-text">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eos sapiente, nam ipsam veritatis reiciendis dolore soluta magni sit pariatur veniam laborum perferendis, molestias amet excepturi voluptatem iure porro reprehenderit doloribus.</p>
                        </div>
                        <div class="card-footer bg-white p-2">
                            <button type="button" class="btn btn-secondary btn-sm">Reply</button>
                            <small class="text-muted ml-2">Last updated 3 mins ago</small>
                        </div>
                    </div>
                </div>

                <ul class="timeline-comments">
                    <li class="timeline-comment">
                        <div class="timeline-comment-wrapper">
                            <div class="card">
                                <div class="card-header d-flex align-items-center">
                                    <div class="ribbon"><span>admin</span></div>
                                    <a href="#" class="d-flex align-items-center">
                                        <img class="rounded-circle" src="Avatars/3.png" alt="avatar" />
                                        <h5>zshare</h5>
                                    </a>
                                    <div class="comment-date" data-toggle="tooltip" title="Feb 5, 2018 8:21 pm" data-placement="top" data-original-title="Feb 5, 2018 8:21 pm">Sep 19, 2018</div>
                                </div>
                                <div class="card-body">
                                    <p class="card-text">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eos sapiente, nam ipsam veritatis reiciendis dolore soluta magni sit pariatur veniam laborum perferendis, molestias amet excepturi voluptatem iure porro reprehenderit doloribus.</p>
                                </div>
                                <div class="card-footer bg-white p-2">
                                    <button type="button" class="btn btn-secondary btn-sm">Reply</button>
                                    <small class="text-muted ml-2">Last updated 3 mins ago</small>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </li>
        </ul>


    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    <script>
        /* Activate tooltip */
        $('[data-toggle="tooltip"]').tooltip();
    </script>

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
                    <!-- <p>This is where our sign in code/status will go.</p> -->
                    
                    <div class="container-md">
                        <object type="text/html" data="./authorizationavi.jsp" width="450px" height="500px"
                            style="overflow:auto;">
                        </object>
                    </div>

                </div>
                <div class="modal-footer">
                    <button onClick="window.location.reload();" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>

            </div>
        </div>
    </div>

</body>

</html>