<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Model.User.User" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.UserDao" %>
<%@ page import="Model.Subject.Subject" %>
<%@ page import="Model.Class.School_Class" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="u" class="Model.User.User"/>
<%
    int User_ID_Profile = Integer.parseInt(request.getParameter("User_ID"));
    pageContext.setAttribute("User_ID_Profile",User_ID_Profile);
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
    for (int i=0;i<userList.size();i++){
        if(User_ID_Profile == userList.get(i).getUser_ID()){
            u.setFirst_Name(userList.get(i).getFirst_Name());
            u.setLast_Name(userList.get(i).getLast_Name());
            u.setID_Number(userList.get(i).getID_Number());
            u.setUser_ID(userList.get(i).getUser_ID());
            u.setClass_Name(userList.get(i).getClass_Name());
            u.setUser_Type_ID(userList.get(i).getUser_Type_ID());
            u.setUser_ID(userList.get(i).getUser_ID());
        }
    }
    pageContext.setAttribute("type",UserDao.getUserType(User_ID_Profile));
%>
<!DOCTYPE html>
<html>
<head>
    <title>მასწავლებლები</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../CSS/Admin/viewClasses.css">
    <title>Profile</title>
    <link rel="shortcut icon" href="http://www.iconj.com/ico/b/4/b4d4om14p2.ico" type="image/x-icon" />
    <link href="https://fonts.googleapis.com/css?family=Viga&display=swap" rel="stylesheet">
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


    <div class="leftside info" style="text-align: center">

        <h2 class="sbook header" style="font-family: 'Viga', sans-serif;color: WHITE">SCHOOLBOOK</h2>
        <img src="../images/infobground.jpg" class="purple" style="pointer-events: none;width: 1200px;border-top-right-radius: 25px;">
        <img src="../images/mountains.jpg" class="bground">
        <img src="../viewPhoto.jsp?User_ID=${User_ID_Profile}" class="avatar zaza" style="pointer-events: none;">
       <div class="wrap">
           <p>${u.first_Name}</p>
           <p>${u.last_Name}</p>
           <p>${type}</p>
           <p>${u.ID_Number}</p>
       </div>
    </div>
<style>
    .wrap{
        position: absolute;
        width: 300px;
        height: 200px;
        background-color: rgba(219, 219, 219, 0.55);
        border-radius: 15px;
        left:440px;
        top: 380px;
        padding-top: 20px;
    }
    p{
        color: white;
        font-weight: bold;
    }
    .bground{
        position: absolute;
        top: 0px;
        left: 0px;
        height: auto;
        width: 1200px;
        border-top-right-radius: 25px;
    }
    .zaza{
        height: 200px;
        width: 200px;
        left: 490px;
        top:140px;
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
</body>
</html>