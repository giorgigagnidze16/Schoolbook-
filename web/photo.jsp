<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="Model.User.User" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.UserDao" %>
<%
    String IdNumber = (String) request.getSession().getAttribute("currentUser");
    int ID_Number = Integer.parseInt(IdNumber);
    List<User> userList = UserDao.getUsers();
    int id_user=0;
    for(int i =0;i<userList.size();i++)
    {
        if(ID_Number==userList.get(i).getID_Number())
        {
            id_user = userList.get(i).getUser_ID();
            break;
        }
    }
    String USERNAME = "root";
    String PASSWORD = "password";
    String CONN_STRING = "jdbc:mysql://localhost:3306/mziuri?autoReconnect=true&useSSL=false";
    Blob image = null;
    Connection connection = null;
    byte[ ] imgData = null ;
    Statement statement = null;
    ResultSet rs = null;
    try {
        connection = DriverManager.getConnection(CONN_STRING,USERNAME,PASSWORD);
        PreparedStatement preparedStatement = connection.prepareStatement("select User_Avatar from user_avatar where User_ID =?");
         preparedStatement.setInt(1,id_user);
         rs=preparedStatement.executeQuery();
        if (rs.next()) {
            image = rs.getBlob(1);
            imgData = image.getBytes(1,(int)image.length());
        }
        else {
            out.println("Display Blob Example");
            out.println("image not found for given id>");
            return;
        }
        response.setContentType("image/jpg");
        OutputStream o = response.getOutputStream();
        o.write(imgData);
        o.flush();
        o.close();
    } catch (Exception e) {
        out.println("Unable To Display image");
        out.println("Image Display Error=" + e.getMessage());
        return;
    } finally {
        try {
            rs.close();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

