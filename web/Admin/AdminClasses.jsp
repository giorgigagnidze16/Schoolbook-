<%@ page import="Model.Class.School_Class" %>
<%@ page import="Model.User.User" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.UserDao" %>
<%@ page import="Model.Subject.Subject" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    User obj = new User();
    if (session.getAttribute("currentUser") == null)
        response.sendRedirect("index.jsp");
    String IdNumber = (String) request.getSession().getAttribute("currentUser");
    int ID_Number = Integer.parseInt(IdNumber);
    List<User> userList = UserDao.getUsers();
    for (int i = 0; i < userList.size(); i++) {
        if (ID_Number == userList.get(i).getID_Number()) {
            obj.setFirst_Name(userList.get(i).getFirst_Name());
            obj.setLast_Name(userList.get(i).getLast_Name());
            obj.setID_Number(userList.get(i).getID_Number());
            obj.setUser_ID(userList.get(i).getUser_ID());
            obj.setClass_Name(userList.get(i).getClass_Name());
            obj.setUser_Type_ID(userList.get(i).getUser_Type_ID());
            obj.setUser_ID(userList.get(i).getUser_ID());
            break;
        }
    }
    pageContext.setAttribute("firstname",obj.getFirst_Name());
    pageContext.setAttribute("lastname",obj.getLast_Name());
    pageContext.setAttribute("ID_Number",obj.getID_Number());
    request.setAttribute("userList",userList);
    String role = UserDao.getUserType(obj.getUser_ID());
    pageContext.setAttribute("role",role);
    pageContext.setAttribute("ID_Number",obj.getID_Number());
    pageContext.setAttribute("User_ID",obj.getUser_ID());
    List<Subject> subjectList = UserDao.getSubjects();
    List<School_Class> ClassList = UserDao.getClasses();
    request.setAttribute("ClassList", ClassList);
    request.setAttribute("subjectList",subjectList);
%>
<!DOCTYPE html>
<html>
<head>
    <title>კლასები</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../CSS/Admin/viewClasses.css">
    <title>Profile</title>
    <link href="https://fonts.googleapis.com/css?family=Viga&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="http://www.iconj.com/ico/b/4/b4d4om14p2.ico" type="image/x-icon" />
</head>
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

        <h3 style="margin-top: 640px;color: #1f4765">საგნები </h3>
        <table class="class Table">
            <thead>
            <tr class="thead">
                <th class="column" style="width: 100px;">კლასის ID</th>
                <th class="column">კლასის სახელი</th>
                <th class="column3" style="width: 250px;">მასწავლებლის დამატება</th>
                <th class="column">ნახვა</th>
                <th class="column">მასწავლებლები</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${ClassList}" var="u">

                <tr style="height: 30px;">
                    <td class="column1" style="width: 30px;">${u.getClass_ID()}</td>
                    <td class="column">${u.getClass_Name()}</td>
                    <td class="column" style="width: 250px;"><a href="../AdminProcess/linkTeacherToClass.jsp?Class_ID=${u.getClass_ID()}" style="color: black">დამატება </a></td>
                    <td class="column"><a href="viewClassStudents.jsp?Class_Name=${u.getClass_Name()}" style="color:black">ნახვა</a></td>
                    <td class="column"><a href="viewTeacherByClass.jsp?Class_Name=${u.getClass_Name()}&Class_ID=${u.getClass_ID()}" style="color:black">ნახვა</a></td>
                </tr>
            </c:forEach>

            </tbody>
        </table>

        <table class="subjectTable">
            <thead>
            <tr>

                <th class="column" style="width: 400px;height: 50px;">საგანი</th>
                <th class="column" style="width: 350px;height: 50px;">წაშლა</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${subjectList}" var="u">
                <tr style="height: 30px;">

                    <td class="column">${u.getName()}</td>
                    <td class="column"><A href="../AdminProcess/deleteSubject.jsp?Subject_ID=${u.getSubject_ID()}" style="color: black">წაშლა</A></td>
                </tr>
            </c:forEach>
            </tbody>


        </table>
    </div>


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
</html>