<%@ page import="DAO.UserDao" %>
<%@ page import="Model.Subject.Subject" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.User.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="u" class="Model.Subject.Subject"/>
<%
    User obj = new User();
    String IdNumber = (String) request.getSession().getAttribute("currentUser");
    int ID_Number = Integer.parseInt(IdNumber);
    List<User> userList2 = UserDao.getUsers();
    for (int i = 0; i < userList2.size(); i++) {
        if (ID_Number == userList2.get(i).getID_Number()) {
            obj.setFirst_Name(userList2.get(i).getFirst_Name());
            obj.setLast_Name(userList2.get(i).getLast_Name());
            obj.setID_Number(userList2.get(i).getID_Number());
            obj.setUser_ID(userList2.get(i).getUser_ID());
            obj.setClass_Name(userList2.get(i).getClass_Name());
            obj.setUser_Type_ID(userList2.get(i).getUser_Type_ID());
            obj.setUser_ID(userList2.get(i).getUser_ID());
            break;
        }
    }
    String role = request.getParameter("role");
    String redirect = "location='../Admin/AdminSettings.jsp?firstname="+obj.getFirst_Name()+"&lastname="+obj.getLast_Name() +"&ID_Number=" + obj.getID_Number() + "&role=" +role+"&User_ID="+Integer.parseInt(request.getParameter("User_ID")) +"';";
    String name = request.getParameter("subject");
    List<Subject> subjectList = UserDao.getSubjects();
    boolean subjectExists = false;

    System.out.println(subjectList);
    for (int i = 0; i < subjectList.size(); i++) {
        if (subjectList.get(i).getName().toLowerCase().equals(name.toLowerCase())) {
            subjectExists = true;
        }
    }
    if (subjectExists == false) {
        u.setName(name);
        UserDao.saveSubject(u);
        out.println("<script type=\"text/javascript\">");
        out.println("alert('საგანი დაემატა');");
        out.println(redirect);
        out.println("</script>");
    } else {
        out.println("<script type=\"text/javascript\">");
        out.println("alert('საგანი არსებობს');");
        out.println(redirect);
        out.println("</script>");

    }
%>