<%@ page import="DAO.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String Class_Name = request.getParameter("Class_Name");
  String firstname = request.getParameter("firstname");
  String lastname = request.getParameter("lastname");
  double avg = Double.parseDouble(request.getParameter("avg"));
  int User_ID = Integer.parseInt(request.getParameter("User_ID"));
  int ID_Number = Integer.parseInt(request.getParameter("ID_Number"));
  pageContext.setAttribute("name",firstname);
  pageContext.setAttribute("lastname",lastname);
  pageContext.setAttribute("idnum",ID_Number);
  pageContext.setAttribute("class1",Class_Name);
  pageContext.setAttribute("User_ID",User_ID);
    pageContext.setAttribute("avg",avg);
    String role = UserDao.getUserType(User_ID);
    pageContext.setAttribute("role",role);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="http://www.iconj.com/ico/b/4/b4d4om14p2.ico" type="image/x-icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../CSS/Student/info.css">
    <title>პარამეტრები</title>
    <link href="https://fonts.googleapis.com/css?family=Viga&display=swap" rel="stylesheet">
</head>
<body>


<div class="container">


    <div class="sidebar" style="display: inline-block;">
        <ul>
            <li class="list"><a href="studentprofile.jsp"><img src="../images/SchoolbookBlueLogo.png" class="logo" alt="logo"></a></li>
        </ul>
        <ul>
            <li class="list1" id="chat"><a href="../chat.jsp"><img src="../images/ChatLogo.png" class="logo1" id="li1" alt="logo"></a><span
                    class="span chatspan"><p class="chat">ჩატი</p></span></li>
        </ul>
        <ul>
            <li class="list1" id="monitor"><a href="quiz.jsp?firstname=${name}&lastname=${lastname}&User_ID=${User_ID}&Class_Name=${class1}&ID_Number=${idnum}&avg=${avg}"><img src="../images/ComputerMonitor.png" class="logo1" alt="logo"></a><span
                    class="mon"><p class="monitorsp">Quiz</p></span></li>
        </ul>
        <ul>
            <li class="list1" id="star"><a href="viewMarksBySubject.jsp?firstname=${name}&lastname=${lastname}&User_ID=${User_ID}&Class_Name=${class1}&ID_Number=${idnum}&avg=${avg}"><img src="../images/StarIcon.png" class="logo1" alt="logo"></a>
                <span class="span4 starspan1"><p class="starspan">ნიშნები</p></span></li>
        </ul>
        <ul>
            <li class="list1" id="options"><a href="PersonalInfo.jsp?firstname=${name}&lastname=${lastname}&User_ID=${User_ID}&Class_Name=${class1}&ID_Number=${idnum}&avg=${avg}"><img src="../images/settings.png" class="logo1"></a>
                <span class="span2 settinspan"><p class="options">პარამეტრები</p></span></li>
        </ul>
        <ul>
            <li class="list1" id="myclass"><a href="myclass.jsp?firstname=${name}&lastname=${lastname}&User_ID=${User_ID}&avg=${avg}&Class_Name=${class1}&ID_Number=${idnum}"><img src="../images/MyClassesIcon.png" class="logo1"></a>
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
            <p class="saxeli">${name}</p>
            <p class="gvari-span">გვარი</p>
            <p class="gvari">${lastname}</p>
            <p class="idnum-span">პირადი ნომერი</p>
            <p class="idnum">0${idnum}</p>
            <p class="class-span">კლასი</p>
            <p class="class">${class1}</p>
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
    const photoDiv =document.getElementById('div1');
    const infoDiv =document.getElementById('div2');
    const paroliDiv =document.getElementById('div3');


    editpass.onclick = function(){
        photoDiv.style.display="none";
        infoDiv.style.display="none";
        paroliDiv.style.display="inline-block";
        editpass.style.color="#ff9800";
        editphoto.style.color="white";
        maininfo.style.color="white";
    };
    editphoto.onclick = function(){
        photoDiv.style.display="inline-block";
        infoDiv.style.display="none";
        paroliDiv.style.display="none";
        editpass.style.color="white";
        editphoto.style.color="#ff9800";
        maininfo.style.color="white";
    };
    maininfo.onclick = function(){
        photoDiv.style.display="none";
        infoDiv.style.display="inline-block";
        paroliDiv.style.display="none";
        editpass.style.color="white";
        editphoto.style.color="white";
        maininfo.style.color="#ff9800";
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
</script>
</body>
</html>
