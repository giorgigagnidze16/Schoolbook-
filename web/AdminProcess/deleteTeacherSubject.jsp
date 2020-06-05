<%@ page import="DAO.UserDao" %>
<%@ page import="Model.User.User" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="u" class="Model.User.User"/>
<jsp:useBean id="obj" class="Model.User.User"/>
<%
  int User_ID = Integer.parseInt(request.getParameter("User_ID"));
    String USERNAME = "root";
    String PASSWORD = "password";
    String CONN_STRING = "jdbc:mysql://localhost:3306/mziuri?autoReconnect=true&useSSL=false";
    String IdNumber = (String) request.getSession().getAttribute("currentUser");
    int ID_Number = Integer.parseInt(IdNumber);
    List<User> userList = UserDao.getUsers();

    for (int i = 0; i < userList.size(); i++) {
        if (ID_Number == userList.get(i).getID_Number()) {
            obj.setFirst_Name(userList.get(i).getFirst_Name());
            obj.setLast_Name(userList.get(i).getLast_Name());
            obj.setID_Number(userList.get(i).getID_Number());
            obj.setUser_ID(userList.get(i).getUser_ID());
            obj.setClass_Name(userList.get(i).getClass_Name());
            obj.setUser_Type_ID(userList.get(i).getUser_Type_ID());
            obj.setUser_ID(userList.get(i).getUser_ID());
            break;
        }
    }
    String role = UserDao.getUserType(obj.getUser_ID());
    Connection connection = null;
    connection = (Connection) DriverManager.getConnection(CONN_STRING, USERNAME, PASSWORD);
    PreparedStatement statement = connection.prepareStatement("delete  from users_subject_rel where User_ID=?");
    try {
        String redirect = "location='../Admin/AdminSettings.jsp?firstname="+obj.getFirst_Name()+"&lastname="+obj.getLast_Name() +"&ID_Number=" + obj.getID_Number() + "&role=" +role+"&User_ID=" + obj.getUser_ID()+ "';";
        statement.setInt(1,User_ID);
        int result = statement.executeUpdate();
        if(result==1){
        out.println("<script type=\"text/javascript\">");
        out.println("alert('საგანი ამოიშალა მასწავლებლისგან');");
        out.println(redirect);
        out.println("</script>");}
        else{
            out.println("<script type=\"text/javascript\">");
            out.println("alert('ცარიელი გრაფა');");
            out.println(redirect);
            out.println("</script>");
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }



%>
