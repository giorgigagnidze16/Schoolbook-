<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="DAO.UserDao" %>
<%@ page import="Model.User.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="Model.Subject.Subject" %>
<%@ page import="Model.Absent.Gacdena_User_Rel" %>
<%@ page import="Model.Mark.Mark_User_Rel" %>
<jsp:useBean id="obj" class="Model.User.User"/>
<%
    if (session.getAttribute("currentUser") == null)
        response.sendRedirect("index.jsp");
%>
<%
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
    int Subject_ID=0;
    obj.setSubject(UserDao.getSubject_byObject(obj));
    List<Subject> subjectList = UserDao.getSubjects();
    for(int i = 0 ;i<subjectList.size();i++){
        if(subjectList.get(i).getName().equals(obj.getSubject())){
            Subject_ID = subjectList.get(i).getSubject_ID();
        }
    }
    pageContext.setAttribute("Subject_ID",Subject_ID);
    pageContext.setAttribute("firstname",obj.getFirst_Name());
    pageContext.setAttribute("lastname",obj.getLast_Name());
    pageContext.setAttribute("ID_Number",obj.getID_Number());
    request.setAttribute("userList",userList);
    String role = UserDao.getUserType(obj.getUser_ID());
    pageContext.setAttribute("role",role);
    pageContext.setAttribute("ID_Number",obj.getID_Number());
    pageContext.setAttribute("User_ID",obj.getUser_ID());
    String Class_Name = request.getParameter("Class_Name");
    int Class_ID = Integer.parseInt(request.getParameter("Class_ID"));
    pageContext.setAttribute("Class_ID",Class_ID);
    List<Gacdena_User_Rel> gacdenaList = UserDao.getDgevandeliGacdenebi(Class_Name,Subject_ID);
    request.setAttribute("gacdenaList",gacdenaList);
    List<Mark_User_Rel> markList = UserDao.getTodaysMarks(Class_Name,Subject_ID);
    request.setAttribute("markList",markList);
    System.out.println(gacdenaList);
    System.out.println(markList);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../CSS/Teacher/teacherprofile.css">
    <title>მონაცემები</title>
    <link rel="shortcut icon" href="http://www.iconj.com/ico/b/4/b4d4om14p2.ico" type="image/x-icon" />
    <link href="https://fonts.googleapis.com/css?family=Viga&display=swap" rel="stylesheet">
</head>



<body>


<div class="container">


    <div class="sidebar" style="display: inline-block;">
        <ul>
            <li class="list"><a href="teacherprofile.jsp"><img src="../images/SchoolbookBlueLogo.png" class="logo"></a></li>
        </ul>
        <ul>
            <li class="list1" id="chat"><a href="../chat.jsp?User_ID=${User_ID}"><img src="../images/ChatLogo.png" class="logo1" id="li1"></a><span class="span chatspan"><p class="chat">ჩატი</p></span></li>
        </ul>
        <ul>
            <li class="list1" id="star"><a href="viewGacdenebi.jsp?firstname=${firstname}&lastname=${lastname}&ID_Number=${ID_Number}&role=${role}&User_ID=${User_ID}"><img src="../images/StarIcon.png" class="logo1"></a>
                <span class="span4 starspan1"><p class="starspan">მონაცემები</p> </span></li>
        </ul>
        <ul>
            <li class="list1 opt" id="options"><a href="teacherSettings.jsp?firstname=${firstname}&lastname=${lastname}&ID_Number=${ID_Number}&role=${role}&User_ID=${User_ID}" ><img src="../images/settings.png" class="logo1"></a>
                <span class="span2 settinspan"><p class="options">პარამეტრები</p> </span></li>
        </ul>

        <ul>
            <li class="list1" id="exit"><a href="../logout.jsp"><img src="../images/exitIcon.png" class="logo1"></a>
                <span class="span3 exit"><p class="exitp">გასვლა</p></span></li>
        </ul>
        <ul>
            <li class="color" style="height: 860px;"><span></span></li>
        </ul>
    </div>
    <style>
        .settinspan{
            top:210px;
        }
        .exit{
            top: 275px;
        }
        .starspan1
        {
            top: 145px;
        }
    </style>


    <div class="student info" >
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
        <a href="https://www.facebook.com/gagnidze.gio27" class="madeby" style="font-family: 'Viga', sans-serif;color: WHITE">© Made By Giorgi Gagnidze</a>
    </div>


    <div class="right side">
        <%
            if(gacdenaList.isEmpty() && markList.isEmpty())
            {
                out.print("<h3 style=\"margin-top: 300px\">მონაცემები არ არის</h3>");
            }else{
        %>

        <h3 class="myclass-header">მონაცემები</h3>

        <table style="height: 500px;overflow:auto;display: block;margin-top: 40px;" class="table2">
            <thead style="background-color: #3a519d;color: white;">

            <tr style="height: 40px;">
                <th style="width: 250px">სახელი</th>
                <th style="width: 250px">გვარი</th>
                <th style="width: 250px">ნიშანი</th>
                <th style="width: 250px">თარიღი</th>
                <th style="width: 250px">Option</th>


            </tr>
            </thead>
            <tbody style="background-color: white">
            <c:forEach items="${markList}" var="u">
                <tr style="height: 25px;">
                    <td>${u.getFirst_Name()}</td>
                    <td>${u.getLast_Name()}</td>
                    <td>${u.getMark()}</td>
                    <td>${u.getMarkDate()}</td>
                    <td><a href="../Process/deleteMark.jsp?User_ID=${u.getUser_ID()}&Class_Name=${u.getClass_Name()}&Subject_ID=${u.getSubject_ID()}&Class_ID=${Class_ID}" style="color: black">ნიშნის წაშლა</a></td>

                </tr>
            </c:forEach>
            </tbody>
        </table>

        <h3 class="absent">გაცდენები</h3>

        <table style="height: 500px;overflow:auto;display: block;margin-top: 40px;" class="table2">
            <thead style="background-color: #3a519d;color: white;">

            <tr style="height: 40px;">
                <th style="width: 40px">№</th>
                <th style="width: 250px">სახელი</th>
                <th style="width: 250px">გვარი</th>
                <th style="width: 250px">თარიღი</th>
                <th style="width: 250px">Option</th>
            </tr>
            </thead>
            <tbody style="background-color: white">
            <c:forEach items="${gacdenaList}" var="u">
                <tr>
                    <td class="column1">${u.getUser_ID()}</td>
                    <td class="column2">${u.getFirst_Name()}</td>
                    <td class="column3">${u.getLast_Name()}</td>
                    <td class="column4">${u.getDate()}</td>
                    <td class="column5"><a style="color: black" href="../Process/deleteGacdena.jsp?User_ID=${u.getUser_ID()}&Class_Name=${u.getClass_Name()}&Subject_ID=${u.getSubject_ID()}&Class_ID=${Class_ID}">გაცდენის ამოშლა</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>



    </div>
    <%
        }
    %>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<style>
    .table2 tbody tr:hover{
        transition: 0.3s;
        background-color: #dbdbdb;
    }
    .absent{
        margin-top:20px;
    }
</style>
</body>
</html>