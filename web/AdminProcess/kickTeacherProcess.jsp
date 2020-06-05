<%@ page import="DAO.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int User_ID = Integer.parseInt(request.getParameter("User_ID"));
    int Class_ID = Integer.parseInt(request.getParameter("Class_ID"));
    String Class_Name = request.getParameter("Class_Name");
    UserDao.waiveTeacher(User_ID,Class_ID);

    response.sendRedirect("../Admin/viewTeacherByClass.jsp?Class_Name="+Class_Name+"&Class_ID="+Class_ID);
%>