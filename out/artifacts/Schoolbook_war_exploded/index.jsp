<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Schoolbook</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
     <link rel="stylesheet" type="text/css" href="CSS/index.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>

</head>

<div class="top-container">

    <nav class="navbar fixed-top navbar-expand-lg navbar-light navbar-fixed-top">
        <a class="navbar-brand" href="#"><img src="https://bit.ly/3eeIEuq" class="brand"></a>
        <button class="navbar-toggler custom-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">მთავარი</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#mid">ჩვენ შესახებ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#modules">მოდულები</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#login" id="avtorizacia">ავტორიზაცია</a>
                </li>
            </ul>
        </div>
    </nav>



    <div class="wrapper">
        <img src="images/screen.png" class="screen">
        <h1 class="martva-header"> სკოლის მართვის<br>ელექტრონული სისტემა</h1>
        <p class="tu gsurt">თუ გსურთ ჩაერთოთ სქულბუქში და გახდეთ ჩვენი სისტემის <br>მომხმარებელი</p>
        <a class="moitxove" href="#">მოითხოვე სქულბუქი</a>
    </div>
</div>


<div class="mid aboutus" id="mid">
    <h2 class="about-header"> ჩვენ შესახებ </h2>
    <p class="warmoadgens">SchoolBook-ი ქართულ საგანმანათლებლო სივრცეში ახალ სიტყვას წარმოადგენს - ესაა დახვეწილი და ინოვაციური მიდგომა სასწავლო პროცესის მართვის კუთხით. <br>

        ჩვენი კომპანია 2013 წელს დაარსდა და უკვე ლიდერია ბაზარზე სკოლის ელექტრონული მართვის ყველა სხვა დანარჩენ კომპანიას შორის. მცირე დროში ჩვენ შევძელით, გვყოლოდა ათი ათასობით მომხმარებელი. ჩვენი წარმატება სასწავლო პროცესის მიმართ დახვეწილმა და ინოვაციურმა მიდგომამ განაპირობა, რაც თანამედროვე განათლების სისტემის განუყოფელ ნაწილს წარმოადგენს.</p>

</div>


<div class="modules" id="modules">
    <h2 class="additional">დამატებითი მოდულები</h2>
    <div class="module">
        <div class="blue"><img src="images/saqagalde.svg" class="inner-img"></div>
        <h5 class="inner-header">ელექტრონული საქაღალდე</h5>
        <p class="inner-p">სკოლის თანამშრომლებსა და სკოლას შეუძლიათ ერთმანეთს გაუზიარონ სხვადასვა დოკუმენტები და ჰქონდეთ საკუთარი ელექტრონული პორთფოლიოები.</p>
    </div>
    <div class="module">
        <div class="blue" style="background-color: #8b92f4"><img src="images/clubs.svg" class="inner-img"></div>
        <h5 class="inner-header">კლუბები</h5>
        <p class="inner-p">სკოლაში არსებული ყველა დამატებითი კლუბური მეცადინეობის მართვა. მოსწავლეთა რაოდენობრივი ზღვრების დაწესება, მეცადინეობის აღწერა, და ა.შ.</p>
    </div>

    <div class="module">
        <div class="blue" style="background-color: #4b4ee7"><img src="images/abc.svg" class="inner-img"></div>
        <h5 class="inner-header">ჰაუსები</h5>
        <p class="inner-p" style="width: 100%;">მოსწავლეთა მოტივაციის მოდული, რომელიც მოსწავლეთა წახალისებაზეა ორიენტირებული. სკოლას შეუძლია შექმნას მოსწავლეთა ჯგუფები და გამოავლინოს მათ შორის ყველაზე რეიტინგულები.</p>
    </div>

</div>



<div class="login-wrapper" id="login">
    <h2 class="login-header">ავტორიზაცია</h2>
    <form  action="Process/loginprocess.jsp" method="post" class="form">
        <div class="input-container">
            <input required type="text" name="ID_Number"/>
            <label>პირადი ნომერი</label>
        </div>

        <div class="input-container">
            <input required type="password"  name="password"/>
            <label>პაროლი</label>
        </div>
        <div class="input-container">
            <input type="submit" value="ავტორიზაცია"/>
        </div>
    </form>

</div>
<div id="bottom" class="bottom">
    <div class="bot-wrap">
        <h2 class="daxmareba">გჭირდებათ დახმარება?</h2>
        <p class="email">info@schoolbook.ge</p>
        <p class="number"> +995 (0322) 470 333</p>
        <p class="copyright">© 2020 ყველა უფლება დაცულია.</p>
    </div>
</div>
<script>
    $(function () {
        $(document).scroll(function () {
            var $nav = $(".navbar-fixed-top");
            $nav.toggleClass('scrolled', $(this).scrollTop() > $nav.height());
        });
    });
</script>
</body>
</html>