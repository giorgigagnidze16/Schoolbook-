<%@ page import="java.util.List" %>
<%@ page import="Model.Mark.Mark_User_Rel" %>
<%@ page import="DAO.UserDao" %>
<%@ page import="Model.Absent.Gacdena_User_Rel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    List<Mark_User_Rel> MarkList = UserDao.getAllMarks();
    List<Gacdena_User_Rel> gacdenaList = UserDao.getAllGacdenebi();
    request.setAttribute("MarkList",MarkList);
    request.setAttribute("gacdenaList",gacdenaList);
    pageContext.setAttribute("firstname",request.getParameter("firstname"));
    pageContext.setAttribute("lastname",request.getParameter("lastname"));
    pageContext.setAttribute("role",request.getParameter("role"));
    pageContext.setAttribute("ID_Number",request.getParameter("ID_Number"));
    pageContext.setAttribute("User_ID",request.getParameter("User_ID"));
%>
<!DOCTYPE html>
<html>
<head>
    <title>მონაცემები</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../CSS/Admin/viewClasses.css">
    <title>Profile</title>
    <link href="https://fonts.googleapis.com/css?family=Viga&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="http://www.iconj.com/ico/b/4/b4d4om14p2.ico" type="image/x-icon" />
</head>
<body>
<body>


<div class="container">


    <div class="sidebar" style="display: inline-block;">
        <ul>
            <li class="list"><a href="adminhomepage.jsp"><img src="../images/SchoolbookBlueLogo.png" class="logo"></a></li>
        </ul>
        <ul>
            <li class="list1" id="chat"><a href="../chat.jsp?User_ID=${User_ID}"><img src="../images/ChatLogo.png" class="logo1" id="li1"></a><span class="span chatspan"><p class="chat">ჩატი</p></span></li>
        </ul>
        <ul>
            <li class="list1" id="monitor"><a href="QuestionOftheDay.jsp?firstname=${firstname}&lastname=${lastname}&ID_Number=${ID_Number}&role=${role}&User_ID=${User_ID}"><img src="../images/ComputerMonitor.png" class="logo1"></a><span class="mon"><p class="monitorsp">კითხვა</p></span></li>
        </ul>
        <ul>
            <li class="list1" id="star"><a href="viewStats.jsp?firstname=${firstname}&lastname=${lastname}&ID_Number=${ID_Number}&role=${role}&User_ID=${User_ID}"><img src="../images/StarIcon.png" class="logo1"></a>
                <span class="span4 starspan1"><p class="starspan">მონაცემები</p> </span></li>
        </ul>
        <ul>
            <li class="list1" id="options"><a href="AdminSettings.jsp?firstname=${firstname}&lastname=${lastname}&ID_Number=${ID_Number}&role=${role}&User_ID=${User_ID}" ><img src="../images/settings.png" class="logo1"></a>
                <span class="span2 settinspan"><p class="options">პარამეტრები</p> </span></li>
        </ul>
        <ul>
            <li class="list1" id="myclass"><a href="AdminClasses.jsp?firstname=${firstname}&lastname=${lastname}&ID_Number=${ID_Number}&role=${role}&User_ID=${User_ID}"><img src="../images/MyClassesIcon.png" class="logo1"></a>
                <span class="span1 myclasspan"><p class="myclass">კლასები</p></span></li>
        </ul>
        <ul>
            <li class="list1" id="exit"><a href="../logout.jsp"><img src="../images/exitIcon.png" class="logo1"></a>
                <span class="span3 exit"><p class="exitp">გასვლა</p></span></li>
        </ul>
        <ul>
            <li class="color"><span></span></li>
        </ul>
    </div>


    <div class="leftside info">

        <h2 class="sbook header" style="font-family: 'Viga', sans-serif;color: WHITE">SCHOOLBOOK</h2>
        <img src="../images/infobground.jpg" class="purple" style="pointer-events: none;">
        <img src="../photo.jsp" class="avatar" style="pointer-events: none;">
        <p class="firstname">${firstname}</p>
        <p class="lastname">${lastname}</p>
        <hr class="hor">
        <div class="main" >
            <p class="role">${role}</p>
            <p class="mainpr">მომხმარებელი</p>

        </div>
        <div class="idnum" >
            <p class="idnums">პირადი ნომერი</p>
            <p class="nomeri">${ID_Number}</p>
        </div>


        <p class="paragraph bottom">სკოლის მართვის ავტომატიზირებული სისტემა</p>
        <a href="https://www.facebook.com/gagnidze.gio27" class="madeby"
           style="font-family: 'Viga', sans-serif;color: WHITE">© Made By Giorgi Gagnidze</a>
    </div>


    <div class="right side">
      <%
          if(MarkList.isEmpty() || gacdenaList.isEmpty()){
              out.print("<h1 style=\"margin-top: 350px;\">ცხრილები ცარიელია</h1>");
          }else{
      %>

     <h3 class="markHeader" style="margin-top: 10px;color: #1f4765">ნიშნები </h3>
        <h3 style="margin-top: 600px;color: #1f4765">გაცდენები </h3>
        <table class="class Table">
            <thead>
            <tr class="thead">
            <th>სახელი</th>
            <th>გვარი</th>
            <th>საგანი</th>
            <th>ნიშანი</th>
            <th>თარიღი</th>
            <th style="display: none">ID</th>
                <th>წაშლა</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${MarkList}" var="u">

                <tr>
                <td>${u.getFirst_Name()}</td>
                <td>${u.getLast_Name()}</td>
                <td>${u.getSubject()}</td>
                <td>${u.getMark()}</td>
                <td>${u.getMarkDate()}</td>
                    <td style="display: none;">${u.getMark_ID()}</td>
                    <td><a href="../AdminProcess/deleteMark.jsp?Mark_ID=${u.getMark_ID()}&firstname=${firstname}&lastname=${lastname}&ID_Number=${ID_Number}&role=${role}&User_ID=${User_ID}" style="color: black">წაშლა</a></td>
                </tr>
            </c:forEach>

            </tbody>
        </table>

        <table class="subjectTable">
            <thead>
            <th style="display: none">ID</th>
             <th style="width: 200px;">თარიღი</th>
             <th style="width: 200px;">სახელი</th>
             <th style="width: 200px;">გვარი</th>
             <th style="width: 200px;">საგანი</th>
            <th style="width: 200px;">წაშლა</th>
            </thead>

            <tbody>
            <c:forEach items="${gacdenaList}" var="u">
              <tr>
                  <td class="column">${u.getDate()}</td>
                  <td class="column">${u.getFirst_Name()}</td>
                  <td class="column">${u.getLast_Name()}</td>
                  <td class="column">${u.getSubject()}</td>
                  <td ><a href="../AdminProcess/deleteGacdena.jsp?Gacdena_ID=${u.getGacdena_ID()}&firstname=${firstname}&lastname=${lastname}&ID_Number=${ID_Number}&role=${role}&User_ID=${User_ID}" style="color: black">წაშლა</a></td>
              </tr>
            </c:forEach>
            </tbody>


        </table>
        <% }%>
    </div>
    <style>
        .mon{
            color: white;
            position: absolute;
            z-index: 99;
            top:145.3px;
            margin-left: 37.5px;
            background-color: #3156b5;
            width: 160px;
            height: 64PX;
            text-align: center;
            transition: 0.5s;
            display: none;
        }
        .monitorsp
        {
            position: absolute;
            width: 20px;
            left: 47px;
            top: 20px;

        }
        #monitor:hover .mon{
            display: inline-block;
        }
        #monitor:hover{
            background-color: #3156b5;
            transition: 0.3s;
        }
    </style>

</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
</body>
</html>