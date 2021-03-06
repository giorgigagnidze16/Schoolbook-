import DAO.UserDao;
import Model.User.User;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)
public class ProfileServlet extends HttpServlet {

    Connection conn = null;
    private String dbURL = "jdbc:mysql://localhost:3306/mziuri?autoReconnect=true&useSSL=false";
    private String dbUser = "root";
    private String dbPass = "password";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String IdNumber = (String) request.getSession().getAttribute("currentUser");
        int ID_Number = Integer.parseInt(IdNumber);
        List<User> userList = UserDao.getUsers();
        int id_user = 0;
        for (int i = 0; i < userList.size(); i++) {
            if (ID_Number == userList.get(i).getID_Number()) {
                id_user = userList.get(i).getUser_ID();

                break;
            }

        }
        InputStream inputStream = null;
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
            inputStream = filePart.getInputStream();
        }

        try {
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
            String sql = "INSERT INTO user_avatar (User_ID, User_Avatar) values (?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, id_user);
            if (inputStream != null) {
                statement.setBlob(2, inputStream);
            }
            int row = statement.executeUpdate();
            if (row > 0) {
                System.out.println("File uploaded and saved into database");
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        int User_Type_ID=0;
         List<User> userList1 = UserDao.getUsers();
        for(int i=0;i<userList1.size();i++){
            if(userList1.get(i).getUser_ID() ==id_user){
                User_Type_ID = userList1.get(i).getUser_Type_ID();
            }
        }
        if(User_Type_ID==3) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("profile.jsp");
            requestDispatcher.forward(request, response);
        }
        if(User_Type_ID==2) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("teacherprofile.jsp");
            requestDispatcher.forward(request, response);
        }
        if(User_Type_ID==1) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("studentprofile.jsp");
            requestDispatcher.forward(request, response);
        }
    }


    protected void doGet(HttpServletResponse response, HttpServletRequest request) throws ServletException, IOException {
        doPost(request, response);
    }
}
