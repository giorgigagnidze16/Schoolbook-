<%@ page import="DAO.UserDao" %>
<%@ page import="java.nio.file.ReadOnlyFileSystemException" %>
<%@ page import="javax.xml.transform.Result" %>
<%@ page import="java.sql.*" %>
<%@ page import="Model.User.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="obj" class="Model.User.User"/>
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
    String role = UserDao.getUserType(obj.getUser_ID());
    pageContext.setAttribute("role",role);
    String redirect = "location='../Admin/AdminClasses.jsp?firstname="+obj.getFirst_Name()+"&lastname="+obj.getLast_Name() +"&ID_Number=" + obj.getID_Number() + "&role=" +role+"&User_ID=" + obj.getUser_ID()+ "';";
    int Class_ID = Integer.parseInt(request.getParameter("Class_ID"));
    int User_ID = Integer.parseInt(request.getParameter("User_ID"));

    int result=0;

    List<User> teacherByClass = UserDao.getTeacherByClass(Class_ID);

    boolean aswavlis = false;
   User k  = new User();
   k.setUser_ID(User_ID);
   String subject = UserDao.getSubject_byObject(k);
    System.out.println(subject + " AMAS ASWAVLIS BLIAD");
    System.out.println(teacherByClass);
    for(int i =0;i<teacherByClass.size();i++){
        User l = new User();
        l.setUser_ID(teacherByClass.get(i).getUser_ID());
        String sbj = UserDao.getSubject_byObject(l);
        System.out.println(sbj);
        if(sbj.equals(UserDao.getSubject_byObject(k))){
            aswavlis=true;
        }
    }




    if(aswavlis==false){
        out.println("<script type=\"text/javascript\">");
        out.println(redirect);
        out.println("</script>");
        UserDao.linkSbjProcess(User_ID,Class_ID);

    }else{

        out.println("<script type=\"text/javascript\">");
        out.println("alert('კლასს უკვე ყავს საგნის მასწავლებელი ');");
        out.println(redirect);
        out.println("</script>");
    }

%>
