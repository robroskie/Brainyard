function returnname(str)
{
    return "Thanks " + str + "!";
}

$(document).ready(function(){
  $("button").click(function(){
    $("#bless").load("../testQuery.jsp");
  });
});