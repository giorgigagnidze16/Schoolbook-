<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="Model.User.User" %>
<%@page import="DAO.UserDao" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Class.School_Class" %>
<jsp:useBean id="u" class="Model.User.User"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="obj" class="Model.User.User"/>
<%
    if (session.getAttribute("currentUser") == null)
        response.sendRedirect("index.jsp");
%>
<%
    String id = request.getParameter("User_ID1");
    int userId = Integer.parseInt(id);
    User editUser = UserDao.getUserById(userId);
    List<School_Class> classList = UserDao.getClasses();
    request.setAttribute("classList",classList);
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
        <h3 class="users-header">რედაქტირება</h3>

        <form method="post" action="../AdminProcess/EditUserProcess.jsp" class="forma100">
            <input type="hidden" name="User_ID" value=<%=editUser.getUser_ID()%>>

            <table>

                <tr>
                    <td class="p">სახელი:</td>
                    <td><input type="text" name="first_name" value=<%= editUser.getFirst_Name()  %>></td>
                </tr>

                <tr>
                    <td class="p">გვარი</td>
                    <td><input type="text" name="last_name" value=<%= editUser.getLast_Name()%>></td>
                </tr>
                <tr>
                    <td class="p">პაროლი:</td>
                    <td><input type="text" name="password" value=<%= editUser.getPassword()%>></td>
                </tr>
                <tr>
                    <td class="p">პირადი ნომერი:</td>
                    <td><input type="text" name="ID_Number" value=<%= editUser.getID_Number()%>></td>
                </tr>
                <tr>
                    <td class="p">კლასი:</td>
                    <td><select class="select" name="Class_Name"><c:forEach items="${classList}" var="u"> <option>${u.getClass_Name()}</option></c:forEach><option>0</option></select></td>
                </tr>
                <tr>
                    <td class="p">მომხმარებლის ტიპი:</td>
                    <td>

                        <select name="User_Type_ID">
                            <option value="1">მოსწავლე</option>
                            <option value="2">მასწავლებელი</option>
                            <OPTION value="3">ადმინი</OPTION>
                        </select>
                    </td>
                </tr>


                <tr>
                    <td><input type="submit" value="შენახვა" class="zd"></td>
                </tr>

            </table>

        </form>


    </div>
</div>
<style>
    .forma100{
        margin-top: 40px;
        display: block;
        margin-left:auto;
        position: absolute;
        left: 18%;
    }
    select{
        width: 183px;
        border-radius: 15px;
        margin-bottom: 10px;
        padding-left: 10px;
        background-color: #dbdbdb;
        border-color: #dbdbdb;
        transition: 0.3s;
        font-size: 14px;
    }
    select:focus{
        outline: none;
    }
    select:hover{
        background-color: white;
        cursor: pointer;
        transition: 0.3s;
    }
    input{
        border-style: solid;
        border-width: 1px;
        border-radius: 15px;
        font-size: 14px;
        width: 180px;
        padding-left: 5px;
        background-color: #dbdbdb;
        border-color: #dbdbdb;
        margin-bottom: 10px;
        transition: 0.3s;
    }
    input:hover{
        background-color: white;
         cursor: pointer;
        transition: 0.3s;
    }
    input:focus{
       outline: none;

    }
    .p{
        color: black;
        font-weight: bold;
    }
    .zd{
       position: absolute;
        top: 250px;
        left: 190px;
        background-color: #3a519d;
        border-color: #3a519d;
        color: white;
        font-weight: bold;
        height: 30px;
    }
    .zd:hover{
        position: absolute;
        top: 250px;
        left: 190px;
        background-color: #3a519d;
        border-color: #3a519d;
        color: white;
        font-weight: bold;
        height: 30px;
    }
</style>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>
