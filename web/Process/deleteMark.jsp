<%@ page import="DAO.UserDao" %>
<%@ page import="Model.User.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int User_ID = Integer.parseInt(request.getParameter("User_ID"));
    int Subject_ID = Integer.parseInt(request.getParameter("Subject_ID"));
    int Class_ID = Integer.parseInt(request.getParameter("Class_ID"));
    String Class_Name = request.getParameter("Class_Name");
    int res=UserDao.DeleteTodaysMark(Subject_ID, User_ID);
    if(res==1){
        String url = "../Teacher/viewGacdenebiTable.jsp?Class_Name="+Class_Name +"&Class_ID=" + Class_ID;
        response.sendRedirect(url);
    }else{

        out.println("<script type=\"text/javascript\">");
        out.println("alert('შეცდომა');");
        out.println("location='../Teacher/viewGacdenebi.jsp';");
        out.println("</script>");
    }
%>
