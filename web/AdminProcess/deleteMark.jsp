<%@ page import="DAO.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String firstname = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");
    int ID_Number = Integer.parseInt(request.getParameter("ID_Number"));
    String role = request.getParameter("role");
    int User_ID = Integer.parseInt(request.getParameter("User_ID"));
    int Mark_ID = Integer.parseInt(request.getParameter("Mark_ID"));
    int res = UserDao.DeleteMarkByID(Mark_ID);
    String redirect = "location='../Admin/viewStats.jsp?firstname="+firstname+"&lastname="+lastname +"&ID_Number=" + ID_Number + "&role=" +role+"&User_ID=" + User_ID+ "';";
    if(res == 1) {
        out.println("<script type=\"text/javascript\">");
        out.println("alert('ოპერაცია წარმატებით დასრულდა');");
        out.println(redirect);
        out.println("</script>");
    }else{
        out.println("<script type=\"text/javascript\">");
        out.println("alert('შეცდომა');");
        out.println(redirect);
        out.println("</script>");
    }

%>