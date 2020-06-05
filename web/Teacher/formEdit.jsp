<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Homework.Homework" %>
<%@ page import="Model.User.User" %>
<%@ page import="DAO.UserDao" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
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
    pageContext.setAttribute("firstname",obj.getFirst_Name());
    pageContext.setAttribute("lastname",obj.getLast_Name());
    pageContext.setAttribute("ID_Number",obj.getID_Number());
    request.setAttribute("userList",userList);
    String role = UserDao.getUserType(obj.getUser_ID());
    pageContext.setAttribute("role",role);
    pageContext.setAttribute("ID_Number",obj.getID_Number());
    pageContext.setAttribute("User_ID",obj.getUser_ID());
    int Class_ID  = Integer.parseInt(request.getParameter("Class_ID"));
    String homework = request.getParameter("Homework");
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    String startDatestr = request.getParameter("startDate");
    String Deadlinestr =  request.getParameter("Deadline");
    Date startDate = formatter.parse(startDatestr);
    Date Deadline = formatter.parse(Deadlinestr);
    String Class_Name = request.getParameter("Class_Name");
    int Subject_ID = Integer.parseInt(request.getParameter("Subject_ID"));
    System.out.println(Class_Name);
    int Homeworkid = Integer.parseInt(request.getParameter("Homework_ID"));
    pageContext.setAttribute("Subject_ID",Subject_ID);
    pageContext.setAttribute("Homework_ID",Homeworkid);
    pageContext.setAttribute("Class_Name",Class_Name);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../CSS/Teacher/teacherprofile.css">
    <title>Profile</title>
    <link href="https://fonts.googleapis.com/css?family=Viga&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="http://www.iconj.com/ico/b/4/b4d4om14p2.ico" type="image/x-icon" />
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
        <form action="../editHomework.jsp" method="post">
            <p class="micemap"> მიცემის თარიღი  </p> <br>
            <input type="date" class="giveDate" name="giveDate" required>
            <p class="shesrulebap">შესრულების ვადა  </p> <br>
            <input type="date" class="Deadline" name="deadLine" required>
            <br>
            <textarea name="editDavaleba" class="editDavaleba" style="resize: none" required></textarea>
            <input type="hidden" name="Subject_ID" value="${Subject_ID}">
            <input type="hidden" name="Class_Name" value="${Class_Name}">
            <input type="hidden" name="hmid" value="${Homework_ID}">
            <input type="submit" class="edit-davaleba-Submit" value="შენახვა">
        </form>

    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<style>
  .micemap{
      position: absolute;
      width: 150px;
     font-weight: bold;
      left:327px;
      top: 55px;
  }
    .giveDate{
        position: absolute;
        left:327px;
        top: 80px;
    }
    .shesrulebap{
        position: absolute;
        left:327px;
        top: 120px;
        font-weight: bold;
    }
    .Deadline{
        position: absolute;
        left: 327px;
        top: 145px;
    }
  .editDavaleba{
      position: absolute;
      left: 327px;
      top: 200px;
      width: 190px;
      height: 100px;
  }
  .edit-davaleba-Submit{
      position: absolute;
      left:327px;
      top: 315px;
      background-color: #1e40ad;
      color: white;
      font-weight: bold;
      font-size:14px;
      border-color: #1e40ad;
  }
  [type="date"] {
      background:#fff url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)  97% 50% no-repeat ;
  }
  [type="date"]::-webkit-inner-spin-button {
      display: none;
  }
  [type="date"]::-webkit-calendar-picker-indicator {
      opacity: 0;
  }

  input {
      border: 1px solid #c4c4c4;
      border-radius: 5px;
      background-color: #fff;
      padding: 3px 5px;
      box-shadow: inset 0 3px 6px rgba(0,0,0,0.1);
      width: 190px;
  }
</style>
</body>
</html>