<%@ page import="DAO.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String doneornot = request.getParameter("doneornot");
    int User_ID =Integer.parseInt(request.getParameter("User_ID"));
    int Homework_ID= Integer.parseInt(request.getParameter("Homework_ID"));
    int Subject_ID=Integer.parseInt(request.getParameter("Subject_ID"));

    if(!doneornot.equals("null")){
       UserDao.MadeDavaleba(Homework_ID,User_ID,Subject_ID);
       response.sendRedirect("studentprofile.jsp");
    }else{
        out.println("<script type=\"text/javascript\">");
        out.println("alert('გთხოვთ ხელახლა სცადოთ');");
        out.println("location='Student/studentprofile.jsp';");
        out.println("</script>");
    }
%>
