<%@ page import="java.util.List" %>
<%@ page import="DAO.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="obj" class="Model.User.User"/>
<%@ page import="Model.*" %>
<%@ page import="Model.Homework.Homework_User_Rel" %>
<%@ page import="Model.Mark.Mark" %>
<%@ page import="Model.User.User" %>
<%@ page import="Model.Class.School_Class" %>
<%@ page import="Model.Absent.Gacdena_User_Rel" %>
<jsp:useBean id="o" class="Model.User.User_Type"/>
<jsp:useBean id="u1" class="Model.User.User_Type"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            break;
        }
    }

    int Class_ID = 0;
    List<School_Class> u = UserDao.getClasses();
    for (int i = 0; i < u.size(); i++) {
        if (u.get(i).getClass_Name().equals(obj.getClass_Name())) {
            Class_ID = u.get(i).getClass_ID();
        }
    }
    List<Homework_User_Rel> homeworkList = UserDao.NotMadeDavaleba(obj.getUser_ID());
    request.setAttribute("homeworkList", homeworkList);
    List<User> subjectList = UserDao.getTechersWithSubjectByClass(Class_ID);
    request.setAttribute("subjectList", subjectList);
    pageContext.setAttribute("Class_Name", obj.getClass_Name());
    pageContext.setAttribute("Name", obj.getFirst_Name());
    pageContext.setAttribute("lname", obj.getLast_Name());
    pageContext.setAttribute("User_ID", obj.getUser_ID());

    List<Mark> markList = UserDao.getMarkSubs(obj.getUser_ID());
    int nishnebiRaodenoba = markList.size();
    int sum = 0;
    for (int i = 0; i < markList.size(); i++) {
        sum += markList.get(i).getMark();
    }
    double avg = 0;
    if (nishnebiRaodenoba != 0) {
        avg = sum / nishnebiRaodenoba;
        pageContext.setAttribute("avg", avg);
    } else {
        pageContext.setAttribute("avg", avg);
    }
    List<Gacdena_User_Rel> gacdenalist = UserDao.getAllGacdenaForUser(obj.getUser_ID());
    double gacdenebi = gacdenalist.size();


    if (gacdenebi != 0) {
        double procenti = (gacdenebi / (gacdenebi + 1)) * 100;
        int za = (int) procenti;
        String percent =  za + "%";
        pageContext.setAttribute("Daswreba",percent);
    } else {
        pageContext.setAttribute("Daswreba", "NaN");
    }
    List<User> teacherList = UserDao.getTechersWithSubjectByClass(Class_ID);
    pageContext.setAttribute("teacherList", teacherList);
    pageContext.setAttribute("ID_Number",obj.getID_Number());
    pageContext.setAttribute("Class_ID",Class_ID);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="http://www.iconj.com/ico/b/4/b4d4om14p2.ico" type="image/x-icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../CSS/Student/StudentProfile.css">
    <title>პროფილი</title>
    <link href="https://fonts.googleapis.com/css?family=Viga&display=swap" rel="stylesheet">
</head>
<body>


<div class="container">


    <div class="sidebar" style="display: inline-block;">
        <ul>
            <li class="list"><a href="studentprofile.jsp"><img src="../images/SchoolbookBlueLogo.png" class="logo"></a></li>
        </ul>
        <ul>
            <li class="list1" id="chat"><a href="../chat.jsp"><img src="../images/ChatLogo.png" class="logo1" id="li1"></a><span
                    class="span chatspan"><p class="chat">ჩატი</p></span></li>
        </ul>
        <ul>
            <li class="list1" id="monitor"><a href="quiz.jsp?firstname=${Name}&lastname=${lname}&User_ID=${User_ID}&Class_Name=${Class_Name}&ID_Number=${ID_Number}&avg=${avg}"><img src="../images/ComputerMonitor.png" class="logo1"></a><span
                    class="mon"><p class="monitorsp">Quiz</p></span></li>
        </ul>
        <ul>
            <li class="list1" id="star"><a href="viewMarksBySubject.jsp?firstname=${Name}&lastname=${lname}&User_ID=${User_ID}&Class_Name=${Class_Name}&ID_Number=${ID_Number}&avg=${avg}&Class_ID=${Class_ID}&Daswreba=${Daswreba}"><img src="../images/StarIcon.png" class="logo1"></a>
                <span class="span4 starspan1"><p class="starspan">ნიშნები</p></span></li>
        </ul>
        <ul>
            <li class="list1" id="options"><a href="PersonalInfo.jsp?firstname=${Name}&lastname=${lname}&User_ID=${User_ID}&Class_Name=${Class_Name}&ID_Number=${ID_Number}&avg=${avg}&Daswreba=${Daswreba}"><img src="../images/settings.png" class="logo1"></a>
                <span class="span2 settinspan"><p class="options">პარამეტრები</p></span></li>
        </ul>
        <ul>
            <li class="list1" id="myclass"><a href="myclass.jsp?firstname=${Name}&lastname=${lname}&User_ID=${User_ID}&avg=${avg}&Class_Name=${Class_Name}&ID_Number=${ID_Number}&Daswreba=${Daswreba}"><img src="../images/MyClassesIcon.png" class="logo1"></a>
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
        <a href="PersonalInfo.jsp?firstname=${Name}&lastname=${lname}&User_ID=${User_ID}&Class_Name=${Class_Name}&ID_Number=${ID_Number}&avg=${avg}" class="piradi"><img src="../images/editicon.png" class="mini"><span>პირადი ინფორმაცია</span></a>

        <hr class="hor">
        <div class="main class">
            <p class="classnum">${Class_Name}</p>
            <p class="mainpr">ძირითადი კლასი</p>

        </div>
        <div class="avg">
            <p class="avgs">საერთო საშუალო ნიშანი</p>
            <p class="nishani">${avg}</p>
        </div>
        <div class="daswreba">
            <p class="present">საერთო გაცდენები</p>
            <p class="pr" style="text-align: center;">${Daswreba}</p>
        </div>
        <p class="paragraph bottom">სკოლის მართვის ავტომატიზირებული სისტემა</p>
        <a href="https://www.facebook.com/gagnidze.gio27" class="madeby"
           style="font-family: 'Viga', sans-serif;color: WHITE">© Made By Giorgi Gagnidze</a>
    </div>

    <div class="right side">
        <%
            if(homeworkList.isEmpty()&&teacherList.isEmpty()&&subjectList.isEmpty()){
                out.print("<h2 style=\"margin-top: 400px;\">მონაცემები არ არის</h2>");
            }else{
        %>
        <h2 class="davaleba">შესასრულებელი დავალებები</h2>
        <table class="table">
            <thead class="thead">
            <tr>
                <th scope="col">საგანი</th>
                <th scope="col" style="width: 200px;">დავალება</th>
                <th scope="col">მიღების თარიღი</th>
                <th scope="col">შესრულების ვადა</th>
                <th scope="col">შესრულება</th>
                <th scope="col">Option</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${homeworkList}" var="u">
                <tr>
                    <form method="post" action="davalebaMadeSave.jsp?User_ID=${User_ID}&Homework_ID=${u.getHomework_ID()}&Subject_ID=${u.getSubject_ID()}" >
                        <td>${u.getSubject()}</td>
                        <td style="float: left; max-width:220px;overflow: auto">${u.getHomework()}</td>
                        <td>${u.getHomeworkDate()}</td>
                        <td>${u.getDeadline()}</td>
                        <td><input type="checkbox" name="doneornot"></td>
                        <input type="hidden" name="User_ID" value="${User_ID}">
                        <input type="hidden" name="Homework_ID" value="${u.getHomework_ID()}">
                        <input type="hidden" name="Subject_ID" value="${u.getSubject_ID()}">
                        <td><input type="submit" name=""></td>
                    </form>
                </tr>
            </c:forEach>
            </tbody>
        </table>


        <h2 class="sagnebiheader">საგნები</h2>
        <table class="table table-striped lergia" id="table"
               style="position: absolute; top: 50px; left: 25px;overflow: auto; width:95%; height: 70px;">
            <thead style="background-color: #26c6da;">
            <tr >
                <c:forEach items="${subjectList}" var="u">
                    <th scope="col" style="width:1000px;">${u.getSubject()}</th>
                </c:forEach>
            </tr>

            </thead>
            <tbody>
            </tbody>
        </table>

        <h2 class="maswavlebeliheader">მასწავლებლები</h2>
        <button class="right-arrow" id="right-arrow">></button>
        <button class="left-arrow" id="left-arrow" style=" color:white; background-color:#342ead;font-size: 18px; text-align: center;width: 50px; height: 35px;border-style: solid;border-color: #342ead;border-radius: 8px;position: absolute;right: 80px;top: 155px;"><</button>
        <table style="position: absolute;left:25px;top:220px;width: 800px;height:65px;padding-top:3px;overflow: hidden" id="teacher-table" class="teachertable">
            <tbody>

                <c:forEach items="${teacherList}" var="u">
                    <th>
                                <td> <img src="../viewPhoto.jsp?User_ID=${u.getUser_ID()}" style="width: 50px;height: 50px;border-radius: 300px;margin-right: 3px;margin-top: 3px;"></td>
                                <td>${u.getFirst_Name()}&#160</td>
                                <td>${u.getLast_Name()}</td>
                                <Td style="position:relative;top: 18px;left:-85px;margin-left: 20px;font-size: 12px;">🔵${u.getSubject()}</Td>
                    </th>

                </c:forEach>
            </tbody>
        </table>
        <%
            }
        %>
    </div>

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
<script>
    const table1 = document.getElementById("teacher-table");
    const right = document.getElementById("right-arrow");
    const left = document.getElementById("left-arrow");
    right.onclick = function () {
        table1.scrollLeft += 40;
    };
    left.onclick = function () {
        table1.scrollLeft -= 40;
    };
   if(window.history.replaceState){
       window.history.replaceState(null,null,window.location.href);
   }
</script>

</body>
</html>