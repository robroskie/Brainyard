<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script>  
        var request;  
        function sendInfo()  
        {  
        var v=document.vinform.t1.value;  
        var url="index.jsp?val="+v;  
          
        if(window.XMLHttpRequest){  
        request=new XMLHttpRequest();  
        }  
        else if(window.ActiveXObject){  
        request=new ActiveXObject("Microsoft.XMLHTTP");  
        }  
          
        try{  
        request.onreadystatechange=getInfo;  
        request.open("GET",url,true);  
        request.send();  
        }catch(e){alert("Unable to connect to server");}  
        }  
          
        function getInfo(){  
        if(request.readyState==4){  
        var val=request.responseText;  
        document.getElementById('amit').innerHTML=val;  
        }  
        }  
          
    </script>  
</head>

<body>
    <div style="margin: auto;width:30%;padding-top:50px">
        <form id="form1" name="form1" method="post">
            <div class="form-group">
                <input type="text" class="form-control" placeholder='Search by rollno...' id="roll_no"><br>
                <p align="center"><button type="submit" class="btn btn-primary btn-default" id="search">Submit</button></p><br>
                <h1 class="query"> query </h1>
                <label for="city">Display city name of student:</label>
                <input type="text" class="form-control" placeholder='email address' id="email"><br><br>
            </div>
        </form>
    </div>

    <script>
        $("#search").click(function() {
            var email = $('#email').val();
            email.value = email;
            
            $.ajax({
                url: "./fetch.jsp",
                type: 'POST',
                data: { roll_no: roll_no },
                success: function (data) {
                    $('#email').val(data);
                    alert(data);
                    var email = data;
                }
            });
        });
    </script>
</body>

</html>