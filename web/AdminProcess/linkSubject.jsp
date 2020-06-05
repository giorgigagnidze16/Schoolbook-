<%@ page import="Model.User.User" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.UserDao" %>
<%@ page import="Model.Subject.Subject" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="u" class="Model.User.User"/>
<jsp:useBean id="subject" class="Model.Subject.Subject"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    if (session.getAttribute("currentUser") == null)
        response.sendRedirect("index.jsp");
%>
<%
    List<User> teacherList = UserDao.getTeachers();
    List<Subject> subjectList = UserDao.getSubjects();
    request.setAttribute("subjectList",subjectList);
    int User_ID = Integer.parseInt(request.getParameter("User_ID"));
    for (int i = 0; i< teacherList.size();i++){
        if(User_ID == teacherList.get(i).getUser_ID()){
            u.setFirst_Name(teacherList.get(i).getFirst_Name());
            u.setLast_Name(teacherList.get(i).getLast_Name());
            u.setID_Number(teacherList.get(i).getID_Number());
            u.setUser_Type_ID(teacherList.get(i).getUser_Type_ID());
            u.setClass_Name(teacherList.get(i).getClass_Name());
            u.setPassword(teacherList.get(i).getPassword());
            u.setUser_ID(teacherList.get(i).getUser_ID());
        }
    }
        pageContext.setAttribute("ID_Number",u.getID_Number());
        pageContext.setAttribute("role",UserDao.getUserType(u.getUser_ID()));
        pageContext.setAttribute("firstname",u.getFirst_Name());
        pageContext.setAttribute("lastname",u.getLast_Name());
        pageContext.setAttribute("User_ID",u.getUser_ID());
%>
<html>
<head>
    <style> textarea:focus,input:focus{
        outline: none;
    }</style>
    <title>Link Subject</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../CSS/Admin/AdminPage.css">
    <link href="https://fonts.googleapis.com/css?family=Viga&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="http://www.iconj.com/ico/b/4/b4d4om14p2.ico" type="image/x-icon" />
</head>
<body>

<div class="container">


    <div class="sidebar" style="display: inline-block;">
        <ul>
            <li class="list"><a href="../Admin/adminhomepage.jsp"><img src="../images/SchoolbookBlueLogo.png" class="logo"></a></li>
        </ul>
        <ul>
            <li class="list1" id="chat"><a href="../chat.jsp?User_ID=${User_ID}"><img src="../images/ChatLogo.png" class="logo1" id="li1"></a><span class="span chatspan"><p class="chat">ჩატი</p></span></li>
        </ul>
        <ul>
            <li class="list1" id="monitor"><a href="../Admin/QuestionOftheDay.jsp?firstname=${firstname}&lastname=${lastname}&ID_Number=${ID_Number}&role=${role}&User_ID=${User_ID}"><img src="../images/ComputerMonitor.png" class="logo1"></a><span class="mon"><p class="monitorsp">კითხვა</p></span></li>
        </ul>
        <ul>
            <li class="list1" id="star"><a href="../Admin/viewStats.jsp?firstname=${firstname}&lastname=${lastname}&ID_Number=${ID_Number}&role=${role}&User_ID=${User_ID}"><img src="../images/StarIcon.png" class="logo1"></a>
                <span class="span4 starspan1"><p class="starspan">მონაცემები</p> </span></li>
        </ul>
        <ul>
            <li class="list1" id="options"><a href="../Admin/AdminSettings.jsp?firstname=${firstname}&lastname=${lastname}&ID_Number=${ID_Number}&role=${role}&User_ID=${User_ID}" ><img src="../images/settings.png" class="logo1"></a>
                <span class="span2 settinspan"><p class="options">პარამეტრები</p> </span></li>
        </ul>
        <ul>
            <li class="list1" id="myclass"><a href="../Admin/AdminClasses.jsp?firstname=${firstname}&lastname=${lastname}&ID_Number=${ID_Number}&role=${role}&User_ID=${User_ID}"><img src="../images/MyClassesIcon.png" class="logo1"></a>
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
    <div class="student info" >
        <h2 class="sbook header" style="font-family: 'Viga', sans-serif;color: WHITE">SCHOOLBOOK</h2>
        <img src="../images/infobground.jpg" class="purple" style="pointer-events: none;">
        <img src="../photo.jsp" class="avatar" style="pointer-events: none;">
        <p class="firstname">${firstname}</p>
        <p class="lastname">${lastname}</p>
        <a href="../Admin/AdminSettings.jsp?firstname=${firstname}&lastname=${lastname}&ID_Number=${ID_Number}&role=${role}&User_ID=${User_ID}" class="piradi"><img src="../images/editicon.png" class="mini"><span>პირადი ინფორმაცია</span></a>

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
<form action="saveSubjectProcess.jsp?User_ID=${u.user_ID}" method="post">
    სახელი <br>
    <input type="text" class="teacher-name" value="${u.first_Name}" readonly name="teacher-name"> <br>
    გვარი <br>
    <input type="text" class="teacher-lname" value="${u.last_Name}" readonly  name="teacher-lname"> <br>
    პირადი ნომერი <br>
    <input type="text" class="teacher-idnum" value="${u.ID_Number}" readonly name="teacher-idnum"> <br>
    საგანი:
<select class="subject-list" name="subjectlist">
<c:forEach items="${subjectList}" var="u">
    <option>${u.getName()}</option>
</c:forEach>
</select>
    <br>
<input type="submit" class="savebutton" value="შენახვა">
</form>
    </div>
</div>
<style>
    input{
        margin: 20px 0;
    }
    select{
        margin: 20px 0;
    }
</style>
</body>
</html>
