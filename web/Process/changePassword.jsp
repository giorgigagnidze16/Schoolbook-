<%@ page import="DAO.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int User_ID = Integer.parseInt(request.getParameter("User_ID"));
    String password = request.getParameter("password");
    int result=0;
    String role =request.getParameter("role");
    if (!password.equals(null)){
      if(role.toLowerCase().equals("admin")){
          result= UserDao.updatePassword(password,User_ID);

          if(result==1){
              out.println("<script type=\"text/javascript\">");
              out.println("alert('ოპერაცია წარმატებით დასრულდა');");
              out.println("location='../Admin/adminhomepage.jsp';");
              out.println("</script>");
          }else{
              out.println("<script type=\"text/javascript\">");
              out.println("alert('ოპერაცია ვერ განხორციელდა');");
              out.println("location='../Student/adminhomepage.jsp';");
              out.println("</script>");
          }
      }
        if(role.toLowerCase().equals("student")) {
            result = UserDao.updatePassword(password, User_ID);

            if (result == 1) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('ოპერაცია წარმატებით დასრულდა');");
                out.println("location='../Student/studentprofile.jsp';");
                out.println("</script>");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('ოპერაცია ვერ განხორციელდა');");
                out.println("location='../Student/studentprofile.jsp';");
                out.println("</script>");
            }
        }
        if (role.toLowerCase().equals("teacher")){
            result= UserDao.updatePassword(password,User_ID);
            if (result == 1) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('ოპერაცია წარმატებით დასრულდა');");
                out.println("location='../Teacher/teacherSettings.jsp';");
                out.println("</script>");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('ოპერაცია ვერ განხორციელდა');");
                out.println("location='../Teacher/teacherSettings.jsp';");
                out.println("</script>");
            }
        }
      }



%>
