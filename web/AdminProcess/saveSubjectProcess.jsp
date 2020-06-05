<%@ page import="DAO.UserDao" %>
<%@ page import="Model.Subject.Subject" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Subject.Users_Subject_Rel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String subject = request.getParameter("subjectlist");
    int User_ID= Integer.parseInt(request.getParameter("User_ID"));
    List<Subject> subjectList = UserDao.getSubjects();
    int Subject_ID=0;
    for(int i=0;i<subjectList.size();i++){
        if (subjectList.get(i).getName().equals(subject)){
            Subject_ID = subjectList.get(i).getSubject_ID();
        }
    }
    Users_Subject_Rel u = new Users_Subject_Rel();
    u.setUser_ID(User_ID);
    u.setSubject_ID(Subject_ID);

    int result =  UserDao.linkSubjectToTeacher(u);
    if(result==1) {
        out.println("<script type=\"text/javascript\">");
        out.println("alert('საგანი დაემატა');");
        out.println("location='../Admin/adminhomepage.jsp';");
        out.println("</script>");
    }else{
        out.println("<script type=\"text/javascript\">");
        out.println("alert('მასწავლებელი უკვე ასწავლის საგანს');");
        out.println("location='../Admin/adminhomepage.jsp';");
        out.println("</script>");
    }
%>
