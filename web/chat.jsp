<%@ page import="DAO.UserDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="Model.*" %>
<%@ page import="Model.User.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="u" class="Model.User.User"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    List<User> userList = UserDao.getUsers();
    String ID_Numberstr = (String) session.getAttribute("currentUser");
    int ID_Number = Integer.parseInt(ID_Numberstr);
    for(int i=0;i<userList.size();i++){
        if(ID_Number==userList.get(i).getID_Number()) {
            u.setFirst_Name(userList.get(i).getFirst_Name());
            u.setLast_Name(userList.get(i).getLast_Name());
            u.setSubject(userList.get(i).getSubject());
            u.setUser_ID(userList.get(i).getUser_ID());
            u.setPassword(userList.get(i).getPassword());
            u.setClass_Name(userList.get(i).getClass_Name());
            u.setUser_Type_ID(userList.get(i).getUser_Type_ID());
            u.setUser_ID(userList.get(i).getUser_ID());
        }
    }
    String role = UserDao.getUserType(u.getUser_ID());
    pageContext.setAttribute("role",role);
    pageContext.setAttribute("name",u.getFirst_Name());
    pageContext.setAttribute("lname",u.getLast_Name());

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="CSS/Chat.css">
    <title>ჩემი კლასი</title>
    <link rel="shortcut icon" href="http://www.iconj.com/ico/b/4/b4d4om14p2.ico" type="image/x-icon" />
    <link href="https://fonts.googleapis.com/css?family=Viga&display=swap" rel="stylesheet">
</head>
<body>


<div class="container">

    <%if(role.toLowerCase().equals("student")){
        out.print(" <div class=\"sidebar\" style=\"display: inline-block;\">\n" +
                "       \n" +
                "        <ul>\n" +
                "            <li class=\"list\"><a href=\"Student/studentprofile.jsp\"><img src=\"images/SchoolbookBlueLogo.png\" class=\"logo\" alt=\"logo\"></a></li>\n" +
                "        </ul>\n" +
                "        <ul>\n" +
                "            <li class=\"color\"><span></span></li>\n" +
                "        </ul>\n" +
                "    </div>");
    }
    if (role.toLowerCase().equals("admin")){
        out.print(" <div class=\"sidebar\" style=\"display: inline-block;\">\n" +
                "       \n" +
                "        <ul>\n" +
                "            <li class=\"list\"><a href=\"Admin/adminhomepage.jsp\"><img src=\"images/SchoolbookBlueLogo.png\" class=\"logo\" alt=\"logo\"></a></li>\n" +
                "        </ul>\n" +
                "        <ul>\n" +
                "            <li class=\"color\"><span></span></li>\n" +
                "        </ul>\n" +
                "    </div>");
    }
    if(role.toLowerCase().equals("teacher"))
    {
        out.print(" <div class=\"sidebar\" style=\"display: inline-block;\">\n" +
                "       \n" +
                "        <ul>\n" +
                "            <li class=\"list\"><a href=\"Teacher/teacherprofile.jsp\"><img src=\"images/SchoolbookBlueLogo.png\" class=\"logo\" alt=\"logo\"></a></li>\n" +
                "        </ul>\n" +
                "        <ul>\n" +
                "            <li class=\"color\"><span></span></li>\n" +
                "        </ul>\n" +
                "    </div>");
    }%>




    <div class="student info">
        <img src="images/source.gif" class="gif" style="position: absolute;">
        <h4 class="chroom-header">ჩატრუმი</h4>
        <h2 class="sbook header" style="font-family: 'Viga', sans-serif;color: WHITE">SCHOOLBOOK</h2>
        <img src="images/infobground.jpg" class="purple" style="pointer-events: none;">
        <p class="paragraph bottom">სკოლის მართვის ავტომატიზირებული სისტემა</p>
        <a href="https://www.facebook.com/gagnidze.gio27" class="madeby"
           style="font-family: 'Viga', sans-serif;color: WHITE">© Made By Giorgi Gagnidze</a>
    </div>



    <div class="right side">
        <div id="msg-box" style="width:600px; height: 500px; background: #dbdbdb; overflow:auto;text-align: left;"></div>
        <textarea id="messageField" placeholder="შეიყვანეთ მესიჯი..."></textarea>
        <button onclick="sendMsg();" class="sendBtn">გაგზავნა</button>
    </div>
</div>

<style>
    .sendBtn:focus{
        outline:none;
    }
</style>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


<script>
    var webSocket = new WebSocket("ws://localhost:8080/Schoolbook_war_exploded/test");
    var msgField = document.getElementById("messageField");
    var divMsg = document.getElementById("msg-box");

    function sendMsg() {
        if(msgField.value!=''){
            var msgToSend = msgField.value;
            webSocket.send("(" + "${role}" +")"+  " " +"${name}"+" " + "${lname}:"+" "+msgToSend);
            msgField.value = "";
        }
    }

    webSocket.onmessage = function (message) {

        divMsg.innerHTML +=  message.data + "</br> ";

    }

    webSocket.onopen = function () {
        webSocket.send("${name}"+" " + "${lname}:"+" "+"Connected");
        console.log("connection opened");
    };

    webSocket.onclose = function () {
        console.log("connection closed");
    };

    webSocket.onerror = function wserror(message) {
        console.log("error: " + message);
    }


</script>
</body>
</html>