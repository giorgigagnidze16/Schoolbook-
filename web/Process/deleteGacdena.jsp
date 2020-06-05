<%@ page import="DAO.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String Class_Name= request.getParameter("Class_Name");
    int User_ID = Integer.parseInt(request.getParameter("User_ID"));
    int Subject_ID = Integer.parseInt(request.getParameter("Subject_ID"));
    UserDao.DeleteDgevandeliGacdena(User_ID,Class_Name,Subject_ID);
    int  Class_ID = Integer.parseInt(request.getParameter("Class_ID"));
     pageContext.setAttribute("Class_Name",Class_Name);
     pageContext.setAttribute("Class_ID",Class_ID);

%>
<html>
<head>
    <TITLE>Process</TITLE>
    <meta http-equiv="Refresh" content="0.01; ../Teacher/viewGacdenebiTable.jsp?Class_Name=${Class_Name}&Class_ID=${Class_ID}" />
    <link rel="stylesheet" type="text/css" href="../CSS/loader.css">

</head>
</html>
