<%@ page import="DAO.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int Class_ID = Integer.parseInt(request.getParameter("Class_ID"));
    String Class_Name = request.getParameter("Class_Name");
    int Homework_ID = Integer.parseInt(request.getParameter("Homework_ID"));
    String Subject_ID = request.getParameter("Subject_ID");
    int re=UserDao.deleteHomework(Homework_ID);
    System.out.println(re);
    if(re >-1)
    response.sendRedirect("../Teacher/viewDavalebaTeacher.jsp?Class_ID="+Class_ID+"&Class_Name="+Class_Name+"&Subject_ID="+Subject_ID);
    else{
        String redirect = "location='../Teacher/viewDavalebaTeacher.jsp?Class_ID="+Class_ID+"&Class_Name="+Class_Name+"&Subject_ID="+Subject_ID+ "';";
        out.println("<script type=\"text/javascript\">");
        out.println("alert('ოპერაცია ვერ განხორციელდა');");
        out.println(redirect);
        out.println("</script>");
    }
%>