<%@ page import="java.util.List" %>
<%@ page import="Model.User.User" %>
<%@ page import="DAO.UserDao" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="Model.Absent.Gacdena_User_Rel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int Class_ID = Integer.parseInt(request.getParameter("Class_ID"));
    String checkbox = request.getParameter("gacdena");
    String IdNumber = (String) request.getSession().getAttribute("currentUser");
    int ID_Number = Integer.parseInt(IdNumber);
    List<User> userList = UserDao.getUsers();
    String mark = request.getParameter("mark");
    String Student_User_Id = request.getParameter("User_ID");
    int Student_User_ID = Integer.parseInt(Student_User_Id);
    User u = new User();
    for (int i = 0; i < userList.size(); i++) {
        if (ID_Number == userList.get(i).getID_Number()) {
            u.setUser_ID(userList.get(i).getUser_ID());
        }
    }
    String Class_Name = request.getParameter("Class_Name");

    int Teacher_User_ID = u.getUser_ID();
    if(checkbox==null) {

        String USERNAME = "root";
        String PASSWORD = "password";
        String CONN_STRING = "jdbc:mysql://localhost:3306/mziuri?autoReconnect=true&useSSL=false";
        Connection connection = null;
        String sagani = null;
        int Subject_ID = 0;
        try {

            connection = DriverManager.getConnection(CONN_STRING, USERNAME, PASSWORD);
            PreparedStatement statement = connection.prepareStatement("select * from subject a inner join users_subject_rel b on b.Subject_ID = a.Subject_ID and  b.User_ID=?");
            statement.setInt(1, Teacher_User_ID);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                sagani = resultSet.getString("Subject_Name");
                Subject_ID = resultSet.getInt(("Subject_ID"));
            }

        } catch (SQLException e) {
            e.getMessage();
        }
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
        LocalDate localDate = LocalDate.now();
        List<Gacdena_User_Rel> gacdenaList = UserDao.getGacdenebi(localDate);
        boolean gacdena = false;
        for(int i=0;i<gacdenaList.size();i++){
            if(gacdenaList.get(i).getGacdena() == 1 && gacdenaList.get(i).getUser_ID() == Student_User_ID){
                gacdena=true;
            }
        }
        if(gacdena==true){
            out.println("<script type=\"text/javascript\">");
            out.println("alert('მოსწავლე აცდენს');");
            out.println("location='../Teacher/teacherprofile.jsp';");
            out.println("</script>");
        }else{


        // ---------------------  ნიშნის შენავხა ---------------------
        int result = -1;
        try {
            PreparedStatement statement = connection.prepareStatement("insert into marks(Mark,User_ID,Subject_ID,Mark_Date) values(?,?,?,curdate())");
            statement.setInt(1, Integer.parseInt(mark));
            statement.setInt(2, Student_User_ID);
            statement.setInt(3, Subject_ID);
            result = statement.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }

        if (result == 1) {

            String path ="../Teacher/viewClassTeacher.jsp?Class_Name="+Class_Name+"&Class_ID="+Class_ID;
            response.sendRedirect(path);
        }else{            out.println("<script type=\"text/javascript\">");
            out.println("alert('ოპერაცია არ განხორციელდა');");
            out.println("location='../Teacher/teacherprofile.jsp';");
            out.println("</script>");} }
    }else{
        String USERNAME = "root";
        String PASSWORD = "password";
        String CONN_STRING = "jdbc:mysql://localhost:3306/mziuri?autoReconnect=true&useSSL=false";
        Connection connection = null;
        String sagani = null;
        int Subject_ID = 0;
        try {

            connection = DriverManager.getConnection(CONN_STRING, USERNAME, PASSWORD);
            PreparedStatement statement = connection.prepareStatement("select * from subject a inner join users_subject_rel b on b.Subject_ID = a.Subject_ID and  b.User_ID=?");
            statement.setInt(1, Teacher_User_ID);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                sagani = resultSet.getString("Subject_Name");
                Subject_ID = resultSet.getInt(("Subject_ID"));
            }

        } catch (SQLException e) {
            e.getMessage();
        }
        int result=0;
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
        LocalDate localDate = LocalDate.now();
       List<Gacdena_User_Rel> gacdenaList = UserDao.getGacdenebi(localDate);
        boolean gacdena = false;
        for(int i=0;i<gacdenaList.size();i++){
            if(gacdenaList.get(i).getUser_ID() == Student_User_ID && gacdenaList.get(i).getSubject_ID() ==Subject_ID){
                gacdena = true;
            }
        }
        if(gacdena==true) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('მოსწავლეს უკვე ყავს არა');");
            out.println("location='../Teacher/teacherprofile.jsp';");
            out.println("</script>");

        }else{
        try{
            System.out.println(Class_Name);
            connection = DriverManager.getConnection(CONN_STRING,USERNAME,PASSWORD);
            PreparedStatement statement = connection.prepareStatement("insert into gacdenebi(Gacdena_Date,Subject_ID,Gacdena,User_ID,Class_Name)  values(curdate(),?,1,?,?)");
            statement.setInt(1,Subject_ID);
            statement.setInt(2,Student_User_ID);
            statement.setString(3,Class_Name);
            result = statement.executeUpdate();
        }catch (SQLException e) {e.getMessage();}
        if(result==1){
            String path ="../Teacher/viewClassTeacher.jsp?Class_Name="+Class_Name+"&Class_ID="+Class_ID;
           response.sendRedirect(path);
        }
        }

    }

%>
