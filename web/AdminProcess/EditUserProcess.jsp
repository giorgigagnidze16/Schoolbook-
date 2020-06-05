<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="Model.User.User" %>
<%@page import="DAO.UserDao" %>
<%@ page import="java.util.List" %>
<jsp:useBean id="u" class="Model.User.User"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String id = request.getParameter("User_ID");
    int idnum = Integer.parseInt(id);

    List<User> userList = UserDao.getUsers();

    u.setFirst_Name(request.getParameter("first_name"));
    u.setLast_Name(request.getParameter("last_name"));
    u.setUser_ID(idnum);
    u.setUser_Type_ID(Integer.parseInt(request.getParameter("User_Type_ID")));
    u.setClass_Name(request.getParameter("Class_Name"));
    u.setPassword(request.getParameter("password"));
    u.setID_Number(Integer.parseInt(request.getParameter("ID_Number")));

    UserDao.editUser(u);
    response.sendRedirect("../Admin/adminhomepage.jsp");

%>
</body>
</html>
