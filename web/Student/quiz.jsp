<%@ page import="Model.Question" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.UserDao" %>
<%@ page import="Model.Subject.Subject" %>
<%@ page import="Model.Class.School_Class" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    List<Question> quizList = UserDao.getTodaysQuiz();
    request.setAttribute("quizList",quizList);
    int User_ID = Integer.parseInt(request.getParameter("User_ID"));
    pageContext.setAttribute("Name",request.getParameter("firstname"));
    pageContext.setAttribute("lname",request.getParameter("lastname"));
    pageContext.setAttribute("avg",request.getParameter("avg"));
    pageContext.setAttribute("User_ID",request.getParameter("User_ID"));
    pageContext.setAttribute("Class_Name",request.getParameter("Class_Name"));
    pageContext.setAttribute("Class_ID",request.getParameter("Class_ID"));
    pageContext.setAttribute("Daswreba",request.getParameter("Daswreba"));
    pageContext.setAttribute("ID_Number",request.getParameter("ID_Number"));
    int Score = UserDao.getScoreByID(User_ID);
    pageContext.setAttribute("score",Score);
   int Class_ID = 0;
   List<School_Class> classList = UserDao.getClasses();
   for(int i = 0;i<classList.size();i++){
       if(request.getParameter("Class_Name").equals(classList.get(i).getClass_Name())){
           Class_ID = classList.get(i).getClass_ID();
       }
   }
    List<Subject> subjectList= UserDao.getSubjectByClass(Class_ID);
    request.setAttribute("list",subjectList);
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
    <title>ნიშნები</title>
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
        <p class="paragraph bottom">სკოლის მართვის ავტომატიზირებული სისტემა</p>
        <a href="https://www.facebook.com/gagnidze.gio27" class="madeby"
           style="font-family: 'Viga', sans-serif;color: WHITE">© Made By Giorgi Gagnidze</a>
    </div>


    <div class="right side">
        <p style="position:absolute;font-size: 20px;margin-left: 5px;margin-top: 5px;">ანგარიში-${score}</p>
        <p class="airchiet">აირჩიეთ საგანი რომელშიც გსურთ ნიშნის მიღება:</p>
        <form action="../Process/quizReward.jsp?Class_ID=${Class_ID}&User_ID=${User_ID}&Score=${score}" method="post">
            <select name="Subject" class="select">
                <c:forEach items="${list}" var="u">
                    <option name="Subject" >${u.getName()}</option>
                </c:forEach>
            </select>
            <input type="submit" value="დადასტურება" class="submitMark">
        </form>
        <%
          if(quizList.isEmpty()){
              System.out.println("empty");
              out.println("<h2 style=\"font-size: 30px;margin-top: 40%\">ახალი კითხვა არ არის</h2>");
          }else{
              List<Question> questionList = UserDao.getWhoDoneToday();
              boolean gaaketa = false;
              for(int i=0;i<questionList.size();i++){
                  if(questionList.get(i).getQuiz_ID() == quizList.get(0).getQuiz_ID() && questionList.get(i).getUser_ID()==User_ID){
                   gaaketa = true;
                  }
              }
              if(gaaketa==true){
                  out.println("<h2 style=\"font-size: 30px;margin-top: 40%\">ხვალ ახლიდან სცადეთ</h2>");

              }else{
        %>
        <input type="text" readonly value="${quizList.get(0).getQuestion()}" style="width: 500px;margin-top: 150px;height: 35px; text-align: center;font-weight: bold" class="gay">
     <%
         if(quizList.get(0).getPasuxi()==1){
     %>

        <form action="../Process/submitQuiz.jsp?User_ID=${User_ID}&Quiz_ID=${quizList.get(0).getQuiz_ID()}" method="post">
     <table style="margin-left: 190px;margin-top: 20px;">
         <tr>
             <td style="padding:20px; background-color: #dee3e2">
                 <input type="checkbox" value="1" class="c1" name="c1"> <input type="text" value="${quizList.get(0).getAnswer()}" style="text-align: center;border: none" class="answer1;">
             </td>
             <td  style="padding:20px;  background-color: #dee3e2">
                 <input type="checkbox" value="2" class="c2" name="c2"><input type="text" value="${quizList.get(0).getAnswer1()}" style="text-align: center;border: none">
             </td>
         </tr>
         <tr>
             <Td  style="padding:20px; background-color: #dee3e2 ">
                 <input type="checkbox" value="3" class="c3" name="c3"> <input type="text" value="${quizList.get(0).getAnswer2()}" style="text-align: center;border: none">
             </Td>
             <td  style="padding:20px; background-color: #dee3e2 ">
                 <input type="checkbox" value="4" class="c4" name="c4"><input type="text" value="${quizList.get(0).getAnswer3()}" style="text-align: center;border: none">
             </td>
         </tr>
     </table>
            <input type="submit" class="submit"  value="შემოწმება"/>
        </form>
<%
    }
%>
        <%
            if(quizList.get(0).getPasuxi()==2){
        %>
        <form action="../Process/submitQuiz.jsp?User_ID=${User_ID}&Quiz_ID=${quizList.get(0).getQuiz_ID()}" method="post">
            <table style="margin-left: 190px;margin-top: 20px;">
                <tr>
                    <td style="padding:20px; background-color: #dee3e2">
                        <input type="checkbox" value="1" class="c1" name="c1"> <input type="text" value="${quizList.get(0).getAnswer1()}" style="text-align: center;border: none" class="answer1;">
                    </td>
                    <td  style="padding:20px;  background-color: #dee3e2">
                        <input type="checkbox" value="2" class="c2" name="c2"><input type="text" value="${quizList.get(0).getAnswer()}" style="text-align: center;border: none">
                    </td>
                </tr>
                <tr>
                    <Td  style="padding:20px; background-color: #dee3e2 ">
                        <input type="checkbox" value="3" class="c3" name="c3"> <input type="text" value="${quizList.get(0).getAnswer2()}" style="text-align: center;border: none">
                    </Td>
                    <td  style="padding:20px; background-color: #dee3e2 ">
                        <input type="checkbox" value="4" class="c4" name="4"><input type="text" value="${quizList.get(0).getAnswer3()}" style="text-align: center;border: none">
                    </td>
                </tr>
            </table>
            <input type="submit" class="submit"  value="შემოწმება"/>
        </form>
        <%
            }
        %>
        <%
            if(quizList.get(0).getPasuxi()==3){
        %>
        <form action="../Process/submitQuiz.jsp?User_ID=${User_ID}&Quiz_ID=${quizList.get(0).getQuiz_ID()}" method="post">
            <table style="margin-left: 190px;margin-top: 20px;">
                <tr>
                    <td style="padding:20px; background-color: #dee3e2">
                        <input type="checkbox" value="1" class="c1" name="c1"> <input type="text" value="${quizList.get(0).getAnswer1()}" style="text-align: center;border: none" class="answer1;">
                    </td>
                    <td  style="padding:20px;  background-color: #dee3e2">
                        <input type="checkbox" value="2" class="c2" name="c2"><input type="text" value="${quizList.get(0).getAnswer2()}" style="text-align: center;border: none">
                    </td>
                </tr>
                <tr>
                    <Td  style="padding:20px; background-color: #dee3e2 ">
                        <input type="checkbox" value="3" class="c3" name="c3"> <input type="text" value="${quizList.get(0).getAnswer()}" style="text-align: center;border: none">
                    </Td>
                    <td  style="padding:20px; background-color: #dee3e2 ">
                        <input type="checkbox" value="4" class="c4" name="c4"><input type="text" value="${quizList.get(0).getAnswer3()}" style="text-align: center;border: none">
                    </td>
                </tr>
            </table>
            <input type="submit" class="submit"  value="შემოწმება"/>
        </form>
        <%
            }
        %>
        <%
            if(quizList.get(0).getPasuxi()==4){
        %>
        <form action="../Process/submitQuiz.jsp?User_ID=${User_ID}&Quiz_ID=${quizList.get(0).getQuiz_ID()}" method="post">
            <table style="margin-left: 190px;margin-top: 20px;">
                <tr>
                    <td style="padding:20px; background-color: #dee3e2">
                        <input type="checkbox" value="1" class="c1" name="c1"> <input type="text" value="${quizList.get(0).getAnswer1()}" style="text-align: center;border: none" class="answer1;">
                    </td>
                    <td  style="padding:20px;  background-color: #dee3e2">
                        <input type="checkbox" value="2" class="c2" name="c2"><input type="text" value="${quizList.get(0).getAnswer2()}" style="text-align: center;border: none">
                    </td>
                </tr>
                <tr>
                    <Td  style="padding:20px; background-color: #dee3e2 ">
                        <input type="checkbox" value="3" class="c3" name="c3"> <input type="text" value="${quizList.get(0).getAnswer3()}" style="text-align: center;border: none">
                    </Td>
                    <td  style="padding:20px; background-color: #dee3e2 ">
                        <input type="checkbox" value="4" class="c4" name="c4"><input type="text" value="${quizList.get(0).getAnswer()}" style="text-align: center;border: none">
                    </td>
                </tr>
            </table>
            <input type="submit" class="submit"  value="შემოწმება"/>
        </form>
        <%
            }
            }
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


<style>
    .gay:focus{
        outline: none;
    }
    .gay{
        pointer-events: none;
        border-style: solid;
        border-radius: 15px;
        border-color: rgba(67, 216, 201, 0.45);
    }
    .submit{
      width: 200px;
        border-style:solid;
        border-radius: 10px;
        height: 45px;
        color: white;
        background-color: #1e40ad;
        font-weight: bold;
        position: absolute;
        left: 310px;
        top:380px;
    }
    .submit:focus{
        outline: none;
    }
    .select:focus{
        outline: none;
    }
    .submitMark{
        position: absolute;
        border-style: solid;
        width: 170px;
        height: 30px;
        border-radius: 15px;
        border-color: #04bae4;
        background-color: #04bae4;
        color:white;
        font-size: 14px;
        font-weight: bold;
        right: 20px;
        top: 60px;
    }
    .select{
        position: absolute;
        right: 20px;
        width: 170px;
        top:15px;
    }
    .airchiet{
    position: absolute;
        font-size: 14px;
        right: 200px;
        top: 16.5px;
        color: #ff9800;
        font-weight: bold;
    }
</style>
</body>
</html>