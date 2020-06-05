<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="DAO.UserDao" %>
<%@ page import="Model.Subject.Subject" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.User.User" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="Model.Homework.Homework" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String IdNumber = (String) request.getSession().getAttribute("currentUser");
    int ID_Number = Integer.parseInt(IdNumber);
    List<User> userList = UserDao.getUsers();
    int Teacher_ID = 0;
    User u = new User();
    for(int i =0;i<userList.size();i++){
        if(ID_Number == userList.get(i).getID_Number()){
            Teacher_ID = userList.get(i).getUser_ID();
            u.setSubject(userList.get(i).getSubject());
        }
    }
    String Class_Name = request.getParameter("Class_Name");
    String Subject = request.getParameter("Subject");
    String giveDateStr = request.getParameter("given");
    String deadlineStr = request.getParameter("deadline");
    String homework = request.getParameter("davalebaTXT");
    int Class_ID = Integer.parseInt(request.getParameter("Class_ID"));
    int Subject_ID=0;
    List<Model.Subject.Subject> subjectList = UserDao.getSubjects();
    for(int i=0;i<subjectList.size();i++){
        if(subjectList.get(i).getName().equals(Subject)){
            Subject_ID =  subjectList.get(i).getSubject_ID();
        }
    }

    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    Date startDate = null,Deadline=null;
    java.sql.Date StartDate=null,DeadLine=null;
    try{
        startDate= formatter.parse(giveDateStr);
        Deadline = formatter.parse(deadlineStr);
        StartDate = UserDao.convertUtilToSql(startDate);
        DeadLine= UserDao.convertUtilToSql(Deadline);
    }catch (ParseException e) {e.getMessage();}

    if(homework != null){
        UserDao.saveHomework(Class_ID,Class_Name,Subject_ID,homework,StartDate,DeadLine,Teacher_ID);
        Homework h= new Homework();
        List<Homework> homework1 = UserDao.GethomeworkByClass(Class_ID,Subject_ID);
        for(int i = 0;i<homework1.size();i++){
            if (homework.equals(homework1.get(i).getHomework())){
                h.setHomework_ID(homework1.get(i).getHomework_ID());
            }
        }
        UserDao.Homework_Rel(h.getHomework_ID(),Class_Name,Subject_ID);
        response.sendRedirect("../Teacher/teacherprofile.jsp");
    }

%>
