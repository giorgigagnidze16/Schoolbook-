<jsp:useBean id="user" class="Model.User.User"/>
<%@ page import="DAO.UserDao" %>
<jsp:setProperty name="user" property="*"/>
<%@ page import="Model.User.User" %>
<jsp:useBean id="u1" class="Model.User.User"/>

<html>
<body>
<%
    String id = request.getParameter("User_ID");
    int userId = Integer.parseInt(id);
    user.setUser_ID(userId);
    UserDao.deleteUser(user);
    response.sendRedirect("../Admin/adminhomepage.jsp");
%>
</body>
</html>