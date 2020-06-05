<%@page import="Model.User.User" %>
<%@page import="DAO.UserDao" %>
<%@ page import="java.util.List" %>
<jsp:useBean id="obj" class="Model.User.User"/>
<jsp:setProperty name="obj" property="*"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>

    <%
    boolean status= UserDao.Validate(obj);
    List<User> userList = UserDao.getUsers();
    if(status)
    {
        String idnum = obj.getID_Number() + "";
        session.setAttribute("currentUser",idnum);
        Cookie cl = new Cookie("First_Name",idnum);
        response.addCookie(cl);


        for(int i=0;i<userList.size();i++)
        {

            if(userList.get(i).getID_Number() == obj.getID_Number() && userList.get(i).getUser_Type_ID()==3)
            {
              response.sendRedirect("../Admin/adminhomepage.jsp");
            }

            if(userList.get(i).getID_Number()==obj.getID_Number() && userList.get(i).getUser_Type_ID()==2)
            {
                response.sendRedirect("../Teacher/teacherprofile.jsp");
            }
            if(userList.get(i).getID_Number()==obj.getID_Number() && userList.get(i).getUser_Type_ID()==1)
            {
                response.sendRedirect("../Student/studentprofile.jsp");
            }
        }

    } else{
        response.sendRedirect("../loginError.jsp#login");
    }
%>
</html>
</body>