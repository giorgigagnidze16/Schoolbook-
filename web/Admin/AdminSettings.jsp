<%@ page import="Model.Subject.Subject" %>
<%@ page import="Model.User.User" %>
<%@ page import="DAO.UserDao" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Subject.Users_Subject_Rel" %>
<%@ page import="Model.Class.School_Class" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    if (session.getAttribute("currentUser") == null)
        response.sendRedirect("index.jsp");
%>
<%
    String firstname = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");
    int ID_Number = Integer.parseInt(request.getParameter("ID_Number"));
    String role = request.getParameter("role");
    pageContext.setAttribute("ID_Number",ID_Number);
    pageContext.setAttribute("firstname",firstname);
    pageContext.setAttribute("lastname",lastname);
    pageContext.setAttribute("role",role);
     int User_ID = Integer.parseInt(request.getParameter("User_ID"));
     pageContext.setAttribute("User_ID",User_ID);
    List<Subject> list = UserDao.getSubjects();
    request.setAttribute("list",list);
    List<User> userList = UserDao.getTeachers();
    request.setAttribute("userList",userList);
    List<Subject> subjectList = UserDao.getSubjects();
    Users_Subject_Rel k = new Users_Subject_Rel();
    Subject s = new Subject();
    int aidi = 46;
    List<School_Class> classList = UserDao.getClasses();
    request.setAttribute("classList",classList);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../CSS/Admin/AdminSettings.css">
    <title>პარამეტრები</title>
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
        <h2 class="infoheader" >პირადი ინფორმაცია</h2>
        <hr class="hr1">
        <div class="purple"> </div>
        <a class="changephoto" href="#" id="change-photo">სურათის შეცვლა</a>
        <hr class="hr2">
        <a class="maininfo" href="#" id="main-info">ძირითადი ინფორმაცია</a>
        <hr class="hr3">
        <a class="editpass" href="#" id="change-pass">პაროლის შეცვლა</a>
        <hr class="hr4">
        <a class="adduser" href="#" id="add-user">მომხმარებლის დამატება</a>
        <hr class="hr5">
        <a class="addsubject" href="#" id="add-subject">საგნის დამატება</a>
        <hr class="hr6">
        <a class="linksubject" href="#" id="link-subject">საგნის მიბმა მასწავლებელზე</a>
        <hr class="hr7">

        <p class="paragraph bottom">სკოლის მართვის ავტომატიზირებული სისტემა</p>
        <a href="https://www.facebook.com/gagnidze.gio27" class="madeby"
           style="font-family: 'Viga', sans-serif;color: WHITE">© Made By Giorgi Gagnidze</a>
    </div>


    <div class="right side">
        <div class="piradi-info" id="div2">
            <img src="../images/piradi-info-avatar.png" class="avararicon">
            <h3 class="piradi-info-header">პირადი ინფორმაცია</h3>
            <p class="shegiliat-ixilot">ამ გვერდზე შეგიძლიათ იხილოთ პირადი ინფორმაცია</p>
            <hr class="hr-info">
            <p class="saxeli-span">სახელი</p>
            <p class="saxeli">${firstname}</p>
            <p class="gvari-span">გვარი</p>
            <p class="gvari">${lastname}</p>
            <p class="idnum-span">პირადი ნომერი</p>
            <p class="idnum">0${ID_Number}</p>
            <p class="class-span">მომხმარებელი</p>
            <p class="class">${role}</p>
        </div>

        <div class="paroli" id="div3">
            <img src="../images/fingerprint.png" class="fingerprint">
            <h3 class="piradi-info-header">პაროლის ცვლილება</h3>
            <p class="shegiliat-ixilot">უსაფრთხოების მიზნით შეიყვანეთ რთული კომბინაციისგან შემდგარი პაროლი!</p>
            <hr class="hr-info">

            <form action="../Process/changePassword.jsp?User_ID=${User_ID}&role=${role}" method="post">
                <input type="password" name="password" class="pass-field" placeholder="შეიყვანეთ ახალი პაროლი" required>
                <input type="submit" value="შეცვლა" class="button-pass">
            </form>
        </div>

        <div class="photo-change" id="div1">
            <img src="../images/mountains.jpg" class="bground">
            <img src="../photo.jsp" class="avatar" id="blah">

            <form action="../UpdateProfileServlet" method="post" enctype="multipart/form-data">
                <input type="file" id="files" name="photo1" class="custom-input" style="display: none;" accept="image/gif, image/jpeg, image/png" onchange="readURL(this);">
                <label for="files" style="position: absolute;" class="span-select"> აირჩიეთ ფაილი</label>
                <label  for="files"> <img src="../images/cloudUpload.png" class="cloud" class="gay"></label>
                <input type="submit" name="submit" class="file-upload" value="სურათის ატვირთვა">
            </form>
        </div>


        <div class="photo-change" id="div4">

            <img src="../images/addIcon.png" class="img">
            <h3 class="piradi-info-header">მომხმარებლის დამატება</h3>
            <p class="shegiliat-ixilot">აქედან შეგიძლიათ დაარეგისტრიროთ ახალი მომხმარებლები</p>
            <hr class="hr-info">


            <form class="form" id="regform" action="../AdminProcess/register.jsp?role=${role}&User_ID=${User_ID}" method="post" name="regF">

                <input type="text" name="first_name" class="lastname" placeholder=" სახელი" required> <br>
                <input type="text" name="last_name" class="pass" placeholder=" გვარი" required> <br>
                <input type="text" name="ID_Number" class="idnumber" placeholder=" პირადი ნომერი" id="idnumber"
                       onblur="checkExist()" required> <br>
                <input type="password" name="password" class="name" placeholder=" პაროლი" required><br>
                <select name="Class_Name" class="lerio">
                    <c:forEach items="${classList}" var="u">
                        <option name="Class_Name"  >${u.getClass_Name()}</option>
                    </c:forEach>
                    <option value="0">0</option>
                </select>
                <br>
                <select name="User_Type_ID" class="usertype">
                    <option value="1">Student</option>
                    <option value="2">Teacher</option>
                    <OPTION value="3">Admin</OPTION>
                </select>

                <input type="submit" name="submit" class="submit" value="რეგისტრაცია" id="submit"> <span id="isE"  class="idE"></span>

            </form>
        </div>

        <div class="photo-change" id="div5">
            <hr class="hr-info">
            <h3 class="sagani-header">საგნის დამატება</h3>
            <img src="../images/plus.png" class="fingerprint">
            <form class="form-subj" action="../AdminProcess/saveSubject.jsp?role=${role}&User_ID=${User_ID}" method="post" id="subform" >
                <input type="text" name="subject" required class="subjectinput" placeholder="საგნის სახელი"> <br>
                <input type="submit" value="დამატება" class="damateba">
            </form>
        </div>

        <div class="link-change" id="div6">
            <img src="../images/link.png" class="fingerprint">
            <h3 class="piradi-info-header">საგნის მიბმა მასწავლებელზე</h3>
            <p class="shegiliat-ixilot">აქედან შეგიძლიათ თავისუფალ მასწავლებელს მიაბათ საგანი რომელსაც ასწავლის</p>
            <hr class="hr-info">



            <table class="link-table">
         <%
             if(userList.isEmpty()){
                 out.print("<h1 style=\"margin-top: 380px;\">ცხრილები ცარიელია</h1>");
             }else{
         %>
                <thead>
                <tr class="thead">
                    <th class="column1">№</th>
                    <th class="column2">სახელი</th>
                    <th class="column3">გვარი</th>
                    <th class="column4">საგანი</th>
                    <th class="column5">საგნის წაშლა</th>
                    <th class="column6">Option</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${userList}" var="u">

                    <tr>
                        <td class="column1">${u.getUser_ID()}</td>
                        <td class="column">${u.getFirst_Name()}</td>
                        <td class="column">${u.getLast_Name()}</td>
                        <td class="column">${u.getSubject()}</td>
                        <td class="column"><a href="../AdminProcess/deleteTeacherSubject.jsp?User_ID=${u.getUser_ID()}" style="color: black">საგნის ამოშლა</a></td>
                        <td class="column"><a href="../AdminProcess/linkSubject.jsp?User_ID=${u.getUser_ID()}" style="color: black">საგნის მიბმა</a></td>

                    </tr>
                </c:forEach>

                </tbody>
            </table>
            <%
                }
            %>
        </div>
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

<script type="text/javascript">
    const editpass = document.getElementById('change-pass');
    const editphoto = document.getElementById('change-photo');
    const maininfo = document.getElementById('main-info');
    const addsubject = document.getElementById('add-subject');
    const linksubject = document.getElementById('link-subject');
    const adduser = document.getElementById('add-user');
    const photoDiv =document.getElementById('div1');
    const infoDiv =document.getElementById('div2');
    const paroliDiv =document.getElementById('div3');
    const addDiv = document.getElementById('div4');
    const addsubDiv = document.getElementById('div5');
    const linkDiv = document.getElementById('div6');
    editpass.onclick = function(){
        photoDiv.style.display="none";
        infoDiv.style.display="none";
        paroliDiv.style.display="inline-block";
        addsubDiv.style.display="none";
        addDiv.style.display="none";
        linkDiv.style.display="none";
        addsubDiv.style.display="none";
        editpass.style.color="#ff9800";
        editphoto.style.color="white";
        maininfo.style.color="white";
        addsubject.style.color="white";
        linksubject.style.color="white";
        adduser.style.color="white";
    };
    editphoto.onclick = function(){
        photoDiv.style.display="inline-block";
        infoDiv.style.display="none";
        paroliDiv.style.display="none";
        addsubDiv.style.display="none";
        editpass.style.color="white";
        editphoto.style.color="#ff9800";
        maininfo.style.color="white";
        addsubject.style.color="white";
        linksubject.style.color="white";
        adduser.style.color="white";
        addDiv.style.display="none";
        addsubDiv.style.display="none";
        linkDiv.style.display="none";
    };
    maininfo.onclick = function(){
        photoDiv.style.display="none";
        infoDiv.style.display="inline-block";
        paroliDiv.style.display="none";
        addsubDiv.style.display="none";
        editpass.style.color="white";
        editphoto.style.color="white";
        maininfo.style.color="#ff9800";
        addsubject.style.color="white";
        linksubject.style.color="white";
        adduser.style.color="white";
        addDiv.style.display="none";
        addsubDiv.style.display="none";
        linkDiv.style.display="none";
    };
    adduser.onclick = function(){
        photoDiv.style.display="none";
        infoDiv.style.display="none";
        paroliDiv.style.display="none";
        addsubDiv.style.display="none";
        editpass.style.color="white";
        editphoto.style.color="white";
        maininfo.style.color="white";
        addsubject.style.color="white";
        linksubject.style.color="white";
        adduser.style.color="#ff9800";
        addDiv.style.display="inline-block";
        addsubDiv.style.display="none";
        linkDiv.style.display="none";
    };
    addsubject.onclick = function(){
        photoDiv.style.display="none";
        infoDiv.style.display="none";
        paroliDiv.style.display="none";
        editpass.style.color="white";
        editphoto.style.color="white";
        maininfo.style.color="white";
        addsubject.style.color="#ff9800";
        linksubject.style.color="white";
        adduser.style.color="white";
        addDiv.style.display="none";
        linkDiv.style.display="none";
        addsubDiv.style.display="inline-block";
    };
    linksubject.onclick = function(){
        photoDiv.style.display="none";
        infoDiv.style.display="none";
        paroliDiv.style.display="none";
        addsubDiv.style.display="none";
        editpass.style.color="white";
        editphoto.style.color="white";
        maininfo.style.color="white";
        addsubject.style.color="white";
        linksubject.style.color="#ff9800";
        adduser.style.color="white";
        addDiv.style.display="none";
        linkDiv.style.display="inline-block";
    };

    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah')
                    .attr('src', e.target.result)
                    .width(140)
                    .height(140);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }



    function checkExist() {
        var submitbutton = document.getElementById("submit");
        var xmlhttp = new XMLHttpRequest();
        var ID_Number = document.forms["regF"]["ID_Number"].value;
        var url = "../AdminProcess/exists.jsp?ID_Number=" + ID_Number;
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                if (xmlhttp.responseText != "\n\n\n\n\nმომხმარებელი არსებობს") {
                    document.getElementById("isE").style.color = "red";
                    document.getElementById("isE").innerHTML = xmlhttp.responseText;
                }
            }
        };
        try {
            xmlhttp.open("GET", url, true);
            xmlhttp.send();
        } catch (e) {
            alert("unable to connect to server");
        }
    }
</script>
</body>
</html>
