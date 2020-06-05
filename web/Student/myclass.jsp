<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Model.User.User" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.UserDao" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("currentUser") == null)
        response.sendRedirect("index.jsp");
%>
<%
    int User_ID = Integer.parseInt(request.getParameter("User_ID"));
    String name = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");
    String Class_Name = request.getParameter("Class_Name");
    double avg = Double.parseDouble(request.getParameter("avg"));
    int ID_Number = Integer.parseInt(request.getParameter("ID_Number"));
    pageContext.setAttribute("ID_Number",ID_Number);
    pageContext.setAttribute("Class_Name",Class_Name);
    pageContext.setAttribute("User_ID",User_ID);
    pageContext.setAttribute("Name",name);
    pageContext.setAttribute("lname",lastname);
    pageContext.setAttribute("avg",avg);
    List<User> classStudents = UserDao.getStudentByClass(Class_Name);
    request.setAttribute("classList",classStudents);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="shortcut icon" href="http://www.iconj.com/ico/b/4/b4d4om14p2.ico" type="image/x-icon" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../CSS/Student/MyClassStudent.css">
    <title>ჩემი კლასი</title>
    <link href="https://fonts.googleapis.com/css?family=Viga&display=swap" rel="stylesheet">
</head>
<body>


<div class="container">


    <div class="sidebar" style="display: inline-block;">
        <ul>
            <li class="list"><a href="studentprofile.jsp"><img src="../images/SchoolbookBlueLogo.png" class="logo" alt="logo"></a></li>
        </ul>
        <ul>
            <li class="list1" id="chat"><a href="../chat.jsp"><img src="../images/ChatLogo.png" class="logo1" id="li1" alt="logo"></a><span
                    class="span chatspan"><p class="chat">ჩატი</p></span></li>
        </ul>
        <ul>
            <li class="list1" id="monitor"><a href="quiz.jsp?firstname=${Name}&lastname=${lname}&User_ID=${User_ID}&Class_Name=${Class_Name}&ID_Number=${ID_Number}&avg=${avg}"><img src="../images/ComputerMonitor.png" class="logo1" alt="logo"></a><span
                    class="mon"><p class="monitorsp">Quiz</p></span></li>
        </ul>
        <ul>
            <li class="list1" id="star"><a href="viewMarksBySubject.jsp?firstname=${Name}&lastname=${lname}&User_ID=${User_ID}&Class_Name=${Class_Name}&ID_Number=${ID_Number}&avg=${avg}"><img src="../images/StarIcon.png" class="logo1" alt="logo"></a>
                <span class="span4 starspan1"><p class="starspan">ნიშნები</p></span></li>
        </ul>
        <ul>
            <li class="list1" id="options"><a href="PersonalInfo.jsp?firstname=${Name}&lastname=${lname}&User_ID=${User_ID}&Class_Name=${Class_Name}&ID_Number=${ID_Number}&avg=${avg}"><img src="../images/settings.png" class="logo1"></a>
                <span class="span2 settinspan"><p class="options">პარამეტრები</p></span></li>
        </ul>
        <ul>
            <li class="list1" id="myclass"><a href="myclass.jsp?firstname=${Name}&lastname=${lname}&User_ID=${User_ID}&avg=${avg}&Class_Name=${Class_Name}&ID_Number=${ID_Number}"><img src="../images/MyClassesIcon.png" class="logo1"></a>
                <span class="span1 myclasspan"><p class="myclass">ჩემი კლასი</p> </span></li>
        </ul>
        <ul>
            <li class="list1" id="exit"><a href="../logout.jsp"><img src="../images/exitIcon.png" class="logo1"></a>
                <span class="span3 exit"><p class="exitp">გასვლა</p></span></li>
        </ul>
        <ul>
            <li class="color"><span></span></li>
        </ul>
    </div>



    <div class="student info">
        <h2 class="sbook header" style="font-family: 'Viga', sans-serif;color: WHITE">SCHOOLBOOK</h2>
        <img src="../images/infobground.jpg" class="purple" style="pointer-events: none;">
        <img src="../photo.jsp" class="avatar" style="pointer-events: none;">
        <p class="firstname">${Name}</p>
        <p class="lastname">${lname}</p>
        <a href="" class="piradi"><img src="../images/editicon.png" class="mini"><span>პირადი ინფორმაცია</span></a>

        <hr class="hor">
        <div class="main class">
            <p class="classnum">${Class_Name}</p>
            <p class="mainpr">ძირითადი კლასი</p>

        </div>
        <div class="avg">
            <p class="avgs">საერთო საშუალო ნიშანი</p>
            <p class="nishani">${avg}</p>
        </div>

        <p class="paragraph bottom">სკოლის მართვის ავტომატიზირებული სისტემა</p>
        <a href="https://www.facebook.com/gagnidze.gio27" class="madeby"
           style="font-family: 'Viga', sans-serif;color: WHITE">© Made By Giorgi Gagnidze</a>
    </div>



    <div class="right side">
        <h2 class="myheader">ჩემი კლასი</h2>
        <table class="classtable" style="display: inline-block;">
            <thead class="thead">
            <tr style="height: 50px;">
                <th scope="col">სახელი</th>
                <th scope="col">გვარი</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${classList}" var="u">
                <tr>
                    <td>${u.getFirst_Name()}</td>
                    <td>${u.getLast_Name()}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>