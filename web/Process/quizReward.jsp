<%@ page import="Model.Subject.Subject" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    int User_ID = Integer.parseInt(request.getParameter("User_ID"));
    String subject = request.getParameter("Subject");
    int Score = Integer.parseInt(request.getParameter("Score"));
    int Subject_ID = 0;
    List<Subject> subjectList = UserDao.getSubjects();
    for(int i=0;i<subjectList.size();i++){
        if(subject.equals(subjectList.get(i).getName())){
            Subject_ID = subjectList.get(i).getSubject_ID();
        }
    }
    if(Score>=10){
        UserDao.saveQuizMark(User_ID,Subject_ID);
        UserDao.removeScoreQuiz(User_ID);
        String redirect = "location='../Student/studentprofile.jsp'";
        out.println("<script type=\"text/javascript\">");
        out.println("alert('თქვენ მიიღეთ 10 ქულა!');");
        out.println(redirect);
        out.println("</script>");
    }
    else{
        String redirect = "location='../Student/studentprofile.jsp'";
        out.println("<script type=\"text/javascript\">");
        out.println("alert('საჭიროა მინიმუმ 10 ქულა');");
        out.println(redirect);
        out.println("</script>");
    }
%>