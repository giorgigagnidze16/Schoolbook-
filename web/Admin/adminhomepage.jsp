<%@ page import="DAO.UserDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="Model.*" %>
<%@ page import="Model.Subject.Subject" %>
<%@ page import="Model.User.User" %>
<%@ page import="Model.Subject.Users_Subject_Rel" %>
<%@ page import="Model.Class.School_Class" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="obj" class="Model.User.User"/>
<%
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
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../CSS/Admin/AdminPage.css">
    <title>Profile</title>
    <link rel="shortcut icon" href="http://www.iconj.com/ico/b/4/b4d4om14p2.ico" type="image/x-icon" />
    <link href="https://fonts.googleapis.com/css?family=Viga&display=swap" rel="stylesheet">
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


    <div class="student info" >
        <h2 class="sbook header" style="font-family: 'Viga', sans-serif;color: WHITE">SCHOOLBOOK</h2>
        <img src="../images/infobground.jpg" class="purple" style="pointer-events: none;">
        <img src="../photo.jsp" class="avatar" style="pointer-events: none;">
        <p class="firstname">${firstname}</p>
        <p class="lastname">${lastname}</p>
        <a href="AdminSettings.jsp?firstname=${firstname}&lastname=${lastname}&ID_Number=${ID_Number}&role=${role}&User_ID=${User_ID}" class="piradi"><img src="../images/editicon.png" class="mini"><span>პირადი ინფორმაცია</span></a>

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
        <h3 class="users-header">მომხმარებლები</h3>
        <input type="text" id="myInput" onkeyup="myFunction()" placeholder="პირადი ნომერი..." class="searchBar">
        <table class="user-table" id="myTable">
            <thead>
            <tr class="table100-head">
                <th style="width: 240px">პირადი ნომერი</th>
                <th style="width: 240px">პაროლი</th>
                <th style="width: 240px">სახელი</th>
                <th style="width: 240px">გვარი</th>
                <th style="padding-right: 15px;">მომხმარებელი</th>
                <th style="padding-right: 10px;">კლასი</th>
                <th style="padding-right: 10px;">წაშლა</th>
                <th>შეცვლა</th>
            </tr>
            </thead>
            <tbody style="background-color: white;">
            <c:forEach items="${userList}" var="u">
                <tr>
                    <td onClick="document.location.href='UserProfileByID.jsp?User_ID=${u.getUser_ID()}';">
                        0${u.getID_Number()}</td>
                    <td onClick="document.location.href='UserProfileByID.jsp?User_ID=${u.getUser_ID()}';">${u.getPassword()}</td>
                    <td onClick="document.location.href='UserProfileByID.jsp?User_ID=${u.getUser_ID()}';">${u.getFirst_Name()}</td>
                    <td onClick="document.location.href='UserProfileByID.jsp?User_ID=${u.getUser_ID()}';">${u.getLast_Name()}</td>
                    <td onClick="document.location.href='UserProfileByID.jsp?User_ID=${u.getUser_ID()}';">${u.getUser_Type_ID()}</td>
                    <td onClick="document.location.href='UserProfileByID.jsp?User_ID=${u.getUser_ID()}';">${u.getClass_Name()} </td>
                    <td ><a href="../AdminProcess/DeleteUser.jsp?User_ID=${u.getUser_ID()}" onclick="return confirm('Are you sure?')" class="delete">Delete</a></td>
                    <td><a href="EditUser.jsp?User_ID1=${u.getUser_ID()}&firstname=${firstname}&lastname=${lastname}&ID_Number=${ID_Number}&role=${role}" onclick="return confirm('Are you sure?')" class="editor">Edit</a></td>
                </tr>

            </c:forEach>

            </tbody>
        </table>



    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script>
    function myFunction() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("myTable");
        tr = table.getElementsByTagName("tr");

        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[0];
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }
</script>
</body>
</html>