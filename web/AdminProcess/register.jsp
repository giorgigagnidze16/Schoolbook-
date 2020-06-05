<%@page import="Model.User.User" %>
<%@page import="DAO.UserDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="Model.Class.School_Class" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>
<jsp:useBean id="u" class="Model.User.User"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<body>

<%
    List<School_Class> list = UserDao.getClasses();
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
    request.setCharacterEncoding("UTF-8");
    List<User> userList = UserDao.getUsers();
    int idnumber = 0;
    long registration_number = Integer.parseInt(request.getParameter("ID_Number"));
    for (int i = 0; i < userList.size(); i++) {
        if (registration_number == userList.get(i).getID_Number()) {
            idnumber = userList.get(i).getID_Number();
        }
    }

    if (idnumber == registration_number) {
        out.println("<script type=\"text/javascript\">");
        out.println("alert('მომხმარებელი არსესბობს');");
        out.println("location='adminhomepage.jsp';");
        out.println("</script>");

    } else {
        String item = request.getParameter("first_name");
        byte[] bytes = item.getBytes(StandardCharsets.UTF_8);
        item = new String(bytes, StandardCharsets.UTF_8);


        String classID = request.getParameter("Class_Name");
        u.setFirst_Name(request.getParameter("first_name"));
        u.setLast_Name(request.getParameter("last_name"));
        u.setClass_Name(classID);
        u.setID_Number(Integer.parseInt(request.getParameter("ID_Number")));
        u.setPassword(request.getParameter("password"));
        u.setUser_Type_ID(Integer.parseInt(request.getParameter("User_Type_ID")));
        UserDao.saveUser(u);
        List<User> users = UserDao.getUsers();
        int User_ID1=0;
        for(int i=0;i<users.size();i++){
            if(u.getID_Number()==users.get(i).getID_Number()){
                User_ID1=users.get(i).getUser_ID();
            }
        }
        UserDao.SaveDefaultAvatar(User_ID1);
        if (u.getUser_Type_ID() == 1) {
            String USERNAME = "root";
            String PASSWORD = "password";
            String CONN_STRING = "jdbc:mysql://localhost:3306/mziuri?autoReconnect=true&useSSL=false";
            Connection connection = null;
            int User_ID = 0;
            int Class_ID=0;
            List<School_Class> classList = UserDao.getClasses();
            List<User> userList1 = UserDao.getUsers();
            for (int i = 0; i < classList.size(); i++) {
                if (classList.get(i).getClass_Name().equals(u.getClass_Name())) {
                    Class_ID = classList.get(i).getClass_ID();
                }
            }
            for (int i = 0; i < userList1.size(); i++) {
                if (userList1.get(i).getID_Number() == u.getID_Number()) {
                    User_ID = userList1.get(i).getUser_ID();
                }
            }
            UserDao.SaveStudent_ClassRel(User_ID,Class_ID);
        }
            int User_ID = Integer.parseInt(request.getParameter("User_ID"));
            String role = request.getParameter("role");
            String redirect = "location='../Admin/AdminSettings.jsp?firstname="+obj.getFirst_Name()+"&lastname="+obj.getLast_Name() +"&ID_Number=" + obj.getID_Number() + "&role=" +role+"&User_ID="+User_ID+ "';";
            out.println("<script type=\"text/javascript\">");
            out.println("alert('რეგისტრაცია წარმატებით დასრულდა');");
            out.println(redirect);
            out.println("</script>");

    }
%>

</body>
</html>