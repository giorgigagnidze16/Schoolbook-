package DAO;

import Model.Absent.Gacdena_User_Rel;
import Model.Class.School_Class;
import Model.Homework.Homework;
import Model.Homework.Homework_Rel;
import Model.Homework.Homework_User_Rel;
import Model.Mark.Mark;
import Model.Mark.Mark_User_Rel;
import Model.Question;
import Model.Subject.Subject;
import Model.Subject.Users_Subject_Rel;
import Model.User.User;
import Model.User.User_Type;


import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class UserDao {

    private static final String USERNAME = "root";
    private static final String PASSWORD = "password";
    private static final String CONN_STRING = "jdbc:mysql://localhost:3306/mziuri?autoReconnect=true&useSSL=false";


    private static Connection getConnection() {

        Connection connection = null;
        try {

            connection = (Connection) DriverManager.getConnection(CONN_STRING, USERNAME, PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return connection;

    }

    public static boolean Validate(User user) {
        boolean status = false;
        try {
            PreparedStatement preparedStatement = getConnection().prepareStatement("select * from mziuri.users where ID_Number=? and password=?");
            preparedStatement.setInt(1, user.getID_Number());
            preparedStatement.setString(2, user.getPassword());
            ResultSet rs = preparedStatement.executeQuery();
            status = rs.next();
        } catch (Exception e) {
              e.printStackTrace();
        }
        return status;
    }

    public static int saveUser(User user) {
        int result = -1;

        try {
            PreparedStatement statement = getConnection().prepareStatement("insert into  mziuri.users(ID_Number,Password,First_Name,Last_Name,User_Type_ID,Class_Name)values(?,?,?,?,?,?)");

            statement.setInt(1, user.getID_Number());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getFirst_Name());
            statement.setString(4, user.getLast_Name());
            statement.setInt(5, user.getUser_Type_ID());
            statement.setString(6, user.getClass_Name());
            result = statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static int saveSubject(Subject subject) {
        int result = -1;

        try {
            PreparedStatement statement = getConnection().prepareStatement("insert into subject(Subject_Name) values(?)");
            statement.setString(1, subject.getName());
            result = statement.executeUpdate();
            System.out.println("done");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public  static  int linkSubjectToTeacher(Users_Subject_Rel user){
        int result = -1;
        try{
            PreparedStatement statement = getConnection().prepareStatement("insert into users_subject_rel(User_ID,Subject_ID) values(?,?)");
            statement.setInt(1,user.getUser_ID());
            statement.setInt(2,user.getSubject_ID());
            result = statement.executeUpdate();

        }catch (SQLException e){
            e.printStackTrace();
        }
        return result;
    }

    public static List<Subject> getSubjects() {
        List<Subject> subjectList = new ArrayList<>();
        try {
            PreparedStatement statement = getConnection().prepareStatement("select * from mziuri.subject");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Subject subject = new Subject();
                subject.setSubject_ID(resultSet.getInt("Subject_ID"));
                subject.setName(resultSet.getString("Subject_Name"));
                subjectList.add(subject);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return subjectList;

    }

    public static List<User> getUsers() {
        List<User> userList = new ArrayList<>();
        try {
            PreparedStatement statement = getConnection().prepareStatement("select * from mziuri.users");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                User user = new User();

                user.setID_Number(resultSet.getInt("ID_Number"));
                user.setFirst_Name(resultSet.getString("First_Name"));
                user.setLast_Name(resultSet.getString("Last_Name"));
                user.setPassword(resultSet.getString("Password"));
                user.setClass_Name(resultSet.getString("Class_Name"));
                user.setUser_ID(resultSet.getInt("User_ID"));
                user.setUser_Type_ID(resultSet.getInt("User_Type_ID"));
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userList;

    }

    public static List<User> getStudents(String Class_Name) {
        List<User> studentlist = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = getConnection().prepareStatement("Select * From users where Class_Name=?");
            preparedStatement.setString(1, Class_Name);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                User u = new User();
                u.setFirst_Name(rs.getString("First_Name"));
                u.setLast_Name(rs.getString("Last_Name"));
                u.setUser_Type_ID(rs.getInt("User_Type_ID"));
                u.setPassword(rs.getString("Password"));
                u.setID_Number(rs.getInt("ID_Number"));
                u.setUser_ID(rs.getInt("User_ID"));
                u.setClass_Name(rs.getString("Class_Name"));
                studentlist.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return studentlist;
    }

    public static List<School_Class> getClasses() {
        List<School_Class> classList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = getConnection().prepareStatement("select * from mziuri.class");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                School_Class c = new School_Class();
                c.setClass_ID(resultSet.getInt("Class_ID"));
                c.setClass_Name(resultSet.getString("Class_Name"));
                classList.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return classList;
    }

     public static List<User> getTeachersWithSubjects() {
         List<User> teacherList = new ArrayList<>();
         try {
             PreparedStatement statement = getConnection().prepareStatement("select * from users a  inner join users_subject_rel b inner join subject c on a.User_ID = b. User_ID and c.Subject_ID = b.Subject_ID and a.User_Type_ID=2");
             ResultSet rs = statement.executeQuery();
             while (rs.next()) {
                 User u = new User();
                 u.setFirst_Name(rs.getString("First_Name"));
                 u.setLast_Name(rs.getString("Last_Name"));
                 u.setUser_Type_ID(rs.getInt("User_Type_ID"));
                 u.setPassword(rs.getString("Password"));
                 u.setID_Number(rs.getInt("ID_Number"));
                 u.setUser_ID(rs.getInt("User_ID"));
                 u.setClass_Name(rs.getString("Class_Name"));
                 u.setSubject(rs.getString("Subject_Name"));
                 teacherList.add(u);
             }
         }catch (SQLException e) {
             System.out.println(e.getMessage());
         }
         return teacherList;
     }
     public static List<User> getTechersWithSubjectByClass(int Class_ID){
        List<User> userList = new ArrayList<>();
        try {
            PreparedStatement statement = getConnection().prepareStatement("select * from users a  inner join users_subject_rel b inner join subject c inner join user_classes_rel d on a.User_ID = b. User_ID and c.Subject_ID = b.Subject_ID and a.User_Type_ID=2  and b.User_ID=d.User_ID and d.Class_ID=?");
            statement.setInt(1,Class_ID);
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                User u = new User();
                u.setFirst_Name(rs.getString("First_Name"));
                u.setLast_Name(rs.getString("Last_Name"));
                u.setUser_Type_ID(rs.getInt("User_Type_ID"));
                u.setPassword(rs.getString("Password"));
                u.setID_Number(rs.getInt("ID_Number"));
                u.setUser_ID(rs.getInt("User_ID"));
                u.setClass_Name(rs.getString("Class_Name"));
                u.setSubject(rs.getString("Subject_Name"));
                userList.add(u);
            }
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }
        return userList;
     }
    public static List<User> getTeachers(){
        List<User> teacherList = new ArrayList<>();
        try{
            PreparedStatement statement = getConnection().prepareStatement("select * from users a left outer join users_subject_rel b on a.User_ID=b.User_ID  left join subject c  on c.Subject_ID= b.Subject_ID where a.User_Type_ID=2");
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                User u = new User();
                u.setFirst_Name(rs.getString("First_Name"));
                u.setLast_Name(rs.getString("Last_Name"));
                u.setUser_Type_ID(rs.getInt("User_Type_ID"));
                u.setPassword(rs.getString("Password"));
                u.setID_Number(rs.getInt("ID_Number"));
                u.setUser_ID(rs.getInt("User_ID"));
                u.setClass_Name(rs.getString("Class_Name"));
                u.setSubject(rs.getString("Subject_Name"));
                teacherList.add(u);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return teacherList;
    }

    public static int editUser(User user) {
        int result = -1;

        try {
            PreparedStatement statement = getConnection().prepareStatement("update users set  ID_Number=?, Password=?, First_Name=?, Last_Name=?, User_Type_ID=?, Class_Name=? where User_ID=?");
            statement.setInt(1, user.getID_Number());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getFirst_Name());
            statement.setString(4, user.getLast_Name());
            statement.setInt(5, user.getUser_Type_ID());
            statement.setString(6, user.getClass_Name());
            statement.setInt(7, user.getUser_ID());
            result = statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return result;


    }




    public static int deleteUser(User user) {
        int result = -1;
        try {
            PreparedStatement statement = getConnection().prepareStatement("delete from mziuri.users where User_ID=?");
            statement.setInt(1, user.getUser_ID());
            result = statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public static int deleteSubject(Subject subject)
    {
        int result = -1;
        try{
            PreparedStatement preparedStatement = getConnection().prepareStatement("delete from mziuri.subject where Subject_ID=?");
            preparedStatement.setInt(1,subject.getSubject_ID());
            result=preparedStatement.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
        return result;
    }

    public static User getUserById(int id) {

        User user = new User();
        try {
            PreparedStatement statement = getConnection().prepareStatement("select * from mziuri.users where User_ID=?");
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {

                user.setID_Number(resultSet.getInt("ID_Number"));
                user.setFirst_Name(resultSet.getString("First_Name"));
                user.setLast_Name(resultSet.getString("Last_Name"));
                user.setPassword(resultSet.getString("Password"));
                user.setClass_Name(resultSet.getString("Class_Name"));
                user.setUser_ID(resultSet.getInt("User_ID"));
                user.setUser_Type_ID(resultSet.getInt("User_Type_ID"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }
    public static int getSubject_ID(int id) {
        int id1 = 0;
        try {
            PreparedStatement statement = getConnection().prepareStatement("select * from users_subject_rel where User_ID=? ");
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                id1= resultSet.getInt("Subject_ID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return id1;
    }




    public static String  getSubject_byObject(User user) throws SQLException {
        User u = new User();
        PreparedStatement statement = getConnection().prepareStatement("select * from users_subject_rel a inner join subject b on a.Subject_ID = b.Subject_ID and User_ID=? ");
        statement.setInt(1, user.getUser_ID());
        ResultSet resultSet = statement.executeQuery();
        while(resultSet.next()){
            u.setSubject(resultSet.getString("Subject_Name"));
        }
        return u.getSubject() ;

    }
    public static String getUserType(int id) {
        User_Type u = new User_Type();
        try {
            PreparedStatement statement = getConnection().prepareStatement("select User_Type from user_types a inner join users b on a.User_Type_ID = b.User_Type_ID where b.User_ID=?");
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                resultSet.getString("User_Type");
                u.setUser_Type(resultSet.getString("User_Type"));
                u.setUser_Type_ID(0);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return u.getUser_Type();
    }


 public static List<Gacdena_User_Rel> getGacdenebi(LocalDate date){
        List<Gacdena_User_Rel> gacdenaList = new ArrayList<>();
        try {
            PreparedStatement statement = getConnection().prepareStatement("select * from gacdenebi where Gacdena_Date=?");
            statement.setDate(1, Date.valueOf(date));
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                Gacdena_User_Rel u = new Gacdena_User_Rel();
                u.setDate(rs.getDate("Gacdena_Date"));
                u.setGacdena(rs.getInt("Gacdena"));
                u.setSubject_ID(rs.getInt("Subject_ID"));
                u.setUser_ID(rs.getInt("User_ID"));
                u.setClass_Name(rs.getString("Class_Name"));
                gacdenaList.add(u);
            }
        }catch (SQLException e) {e.printStackTrace();}
        return gacdenaList;
 }
  public static List<School_Class> getTeacherClasses2(int User_ID){
      List<School_Class> classList = new ArrayList<>();
      try{
          PreparedStatement statement =getConnection().prepareStatement("select * from class a  inner join user_classes_rel b on a.Class_ID=b.Class_ID and b.User_ID = ?");
          statement.setInt(1,User_ID);
          ResultSet rs = statement.executeQuery();
          while(rs.next()) {
              School_Class u = new School_Class();
              u.setClass_ID(rs.getInt("Class_ID"));
              u.setClass_Name(rs.getString("Class_Name"));
              classList.add(u);
          }
      }catch (SQLException e){
          e.printStackTrace();

      }
      return classList;
  }
  public static  List<User> getStudentByClass (String Class_Name){
      List<User> userList = new ArrayList();
      try{
          PreparedStatement statement = getConnection().prepareStatement("select * from users where User_Type_ID=1 and Class_Name =?");
          statement.setString(1,Class_Name);
          ResultSet resultSet = statement.executeQuery();
          while (resultSet.next()){
              User user = new User();
              user.setID_Number(resultSet.getInt("ID_Number"));
              user.setFirst_Name(resultSet.getString("First_Name"));
              user.setLast_Name(resultSet.getString("Last_Name"));
              user.setPassword(resultSet.getString("Password"));
              user.setClass_Name(resultSet.getString("Class_Name"));
              user.setUser_ID(resultSet.getInt("User_ID"));
              user.setUser_Type_ID(resultSet.getInt("User_Type_ID"));
              userList.add(user);
          }
      }catch (SQLException e){e.printStackTrace();}
      return userList;
  }
  public static int SaveStudent_ClassRel(int User_ID , int Class_ID){
        int result = -1;
      try {
          PreparedStatement statement = getConnection().prepareStatement("insert into user_classes_rel(User_ID,Class_ID) values(?,?)");
          statement.setInt(1,User_ID);
          statement.setInt(2,Class_ID);
          result= statement.executeUpdate();
      }catch (SQLException e){
          e.printStackTrace();
      }
      return result;
  }
  public static int linkSbjProcess(int User_ID,int Class_ID){
        int result = -1;
      try{
          PreparedStatement statement = getConnection().prepareStatement("insert into user_classes_rel(User_ID,Class_ID) values(?,?)");
          statement.setInt(1,User_ID);
          statement.setInt(2,Class_ID);
          result = statement.executeUpdate();


      }catch (SQLException e){
          e.printStackTrace();
      }
      return result;
    }
    public static List<User> getTeacherByClass(int Class_ID){
        List<User> userList = new ArrayList<>();
        try {
            PreparedStatement statement = getConnection().prepareStatement("select * from user_classes_rel a inner join users b on a.User_ID = b.User_ID and b.User_Type_ID=2 and a.Class_ID=?");
            statement.setInt(1,Class_ID);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                User user = new User();
                user.setID_Number(resultSet.getInt("ID_Number"));
                user.setFirst_Name(resultSet.getString("First_Name"));
                user.setLast_Name(resultSet.getString("Last_Name"));
                user.setPassword(resultSet.getString("Password"));
                user.setClass_Name(resultSet.getString("Class_Name"));
                user.setUser_ID(resultSet.getInt("User_ID"));
                user.setUser_Type_ID(resultSet.getInt("User_Type_ID"));
                userList.add(user);
            }
        }catch (SQLException e) {e.printStackTrace();}
        return userList;
    }
  public static int saveHomework(int Class_ID, String Class_Name, int Subject_ID, String Homework, Date GiveDate, Date Deadline, int Teacher_Id){
        int result = -1;
        try{
            PreparedStatement statement = getConnection().prepareStatement("insert into homeworks(Homework,Class_ID,Subject_ID,DoneOrNot,HomeworkDate,Deadline,Class_Name,Teacher_ID) values(?,?,?,?,?,?,?,?)");
            statement.setString(1,Homework);
            statement.setInt(2,Class_ID);
            statement.setInt(3,Subject_ID);
            statement.setInt(4,0);
            statement.setDate(5,GiveDate);
            statement.setDate(6,Deadline);
            statement.setString(7,Class_Name);
            statement.setInt(8,Teacher_Id);
            result = statement.executeUpdate();
        }catch (SQLException e){e.printStackTrace();}
        return result;
    }

    public static java.sql.Date convertUtilToSql(java.util.Date uDate) {
        java.sql.Date sDate = new java.sql.Date(uDate.getTime());
        return sDate;
    }
    public static List<Gacdena_User_Rel> getDgevandeliGacdenebi(String Class_Name,int Subject_ID){
        List<Gacdena_User_Rel> gacdenaList = new ArrayList<>();
        try{
            PreparedStatement statement = getConnection().prepareStatement("select * from gacdenebi a inner join users b on a.User_ID = b.User_ID where Gacdena_Date = curdate() and a.Class_Name=? and a.Subject_ID=?");
            statement.setString(1,Class_Name);
            statement.setInt(2,Subject_ID);
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
              Gacdena_User_Rel g = new Gacdena_User_Rel();
              g.setClass_Name(rs.getString("Class_Name"));
              g.setDate(rs.getDate("Gacdena_Date"));
              g.setFirst_Name(rs.getString("First_Name"));
              g.setLast_Name(rs.getString("Last_Name"));
              g.setGacdena(rs.getInt("Gacdena"));
              g.setSubject_ID(rs.getInt("Subject_ID"));
              g.setUser_ID(rs.getInt("User_ID"));
               gacdenaList.add(g);
            }
        }catch (SQLException e) {e.printStackTrace();}
        return gacdenaList;
    }
    public static int DeleteDgevandeliGacdena(int User_ID,String Class_Name,int Subject_ID){
        int res = -1;
        try{
            PreparedStatement statement=getConnection().prepareStatement("delete from gacdenebi where Gacdena_Date=curdate() and Subject_ID=? and User_ID=? and Class_Name=?");
            statement.setInt(1,Subject_ID);
            statement.setInt(2,User_ID);
            statement.setString(3,Class_Name);
            res = statement.executeUpdate();
        }catch (SQLException e) {e.printStackTrace();}
        return res;
    }
    public static List<Mark_User_Rel> getTodaysMarks(String Class_Name, int Subject_ID){
        List<Mark_User_Rel> list = new ArrayList<>();
        try {
            PreparedStatement statement= getConnection().prepareStatement("select * from marks a inner join users b  on a.User_ID = b.User_ID and b.Class_Name=? and a.Subject_ID=? and Mark_Date=curdate()");
            statement.setString(1,Class_Name);
            statement.setInt(2,Subject_ID);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                Mark_User_Rel u = new Mark_User_Rel();
                u.setFirst_Name(rs.getString("First_Name"));
                u.setLast_Name(rs.getString("Last_Name"));
                u.setMark(rs.getInt("Mark"));
                u.setMarkDate(rs.getDate("Mark_Date"));
                u.setUser_ID(rs.getInt("User_ID"));
                u.setSubject_ID(rs.getInt("Subject_ID"));
                u.setClass_Name(rs.getString("Class_Name"));
                list.add(u);
            }
        }catch (SQLException e){e.printStackTrace();}
        return list;
    }
    public static int DeleteTodaysMark(int Subject_ID,int User_ID){
        int res = -1;
        try{
            PreparedStatement statement = getConnection().prepareStatement("delete from marks where User_ID=? and Subject_ID=? and Mark_Date=curdate()");
            statement.setInt(1,User_ID);
            statement.setInt(2,Subject_ID);
            res=statement.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }
    public static List<Homework> GethomeworkByClass (int Class_ID, int Subject_ID){
        List<Homework> list = new ArrayList<>();
        try{
            PreparedStatement statement = getConnection().prepareStatement("select * from Homeworks where Class_ID=? and Subject_ID=? ");
            statement.setInt(1,Class_ID);
            statement.setInt(2,Subject_ID);
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                Homework h = new Homework();
                h.setClass_ID(rs.getInt("Class_ID"));
                h.setClass_Name(rs.getString("Class_Name"));
                h.setDoneOrNot(rs.getInt("DoneOrNot"));
                h.setDeadline(rs.getDate("Deadline"));
                h.setHomeworkDate(rs.getDate("HomeworkDate"));
                h.setSubject_ID(rs.getInt("Subject_ID"));
                h.setTeacher_ID(rs.getInt("Teacher_ID"));
                h.setHomework(rs.getString("Homework"));
                h.setHomework_ID(rs.getInt("Homework_ID"));
                list.add(h);
            }
        }catch (SQLException e) {e.printStackTrace();}
        return list;
    }

   public static int updateHomework(String homework,String Class_Name,int Subject_ID,Date HomeworkDate,Date Deadline,int HomeworkID){
        int res = -1;
        try{
            PreparedStatement statement = getConnection().prepareStatement("update homeworks set Homework=?,HomeworkDate=?,Deadline=? where Homework_ID=?");
            statement.setString(1,homework);
            statement.setDate(2,HomeworkDate);
            statement.setDate(3,Deadline);
            statement.setInt(4,HomeworkID);
            res = statement.executeUpdate();
        }catch (SQLException e ) {System.out.println(e.getMessage());}
        return res;
   }
   public static int Homework_Rel(int Homework_ID,String Class_Name,int Subject_ID){
        int res=-1;
        try{
            PreparedStatement statement = getConnection().prepareStatement("insert into homework_user_rel( Homework_ID,User_ID,Subject_ID ,DoneOrNot)select ?,User_ID,?,0 from users where Class_Name=?");
            statement.setInt(1,Homework_ID);
            statement.setInt(2,Subject_ID);
            statement.setString(3,Class_Name);
            res=statement.executeUpdate();

        }catch (SQLException e) {System.out.println(e.getMessage());}
        return res;
   }
   public static List<Homework_User_Rel> NotMadeDavaleba(int User_ID){
        List<Homework_User_Rel> list = new ArrayList<>();
        try {
            PreparedStatement statement=getConnection().prepareStatement("select a.Homework_ID,a.Subject_ID,c.Subject_Name,b.Homework,Deadline,HomeworkDate from homework_user_rel a inner join homeworks b  inner join subject c on a.Homework_ID = b.Homework_ID and  a.User_ID=? and a.DoneOrNot=0 and a.Subject_ID=c.Subject_ID");
            statement.setInt(1,User_ID);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                Homework_User_Rel h = new Homework_User_Rel();
                h.setHomework(rs.getString("Homework"));
                h.setDeadline(rs.getDate("Deadline"));
                h.setHomeworkDate(rs.getDate("HomeworkDate"));
                h.setSubject(rs.getString("Subject_Name"));
                h.setHomework_ID(rs.getInt("Homework_ID"));
                h.setSubject_ID(rs.getInt("Subject_ID"));
                list.add(h);
            }
        }catch (SQLException e) {
            System.out.println(e.getMessage());}
            return list;

   }
   public static int MadeDavaleba(int Homework_ID,int User_ID,int Subject_ID){
        int res=-1;
        try{
            PreparedStatement statement = getConnection().prepareStatement("update homework_user_rel set DoneOrNot=1 where User_ID=? and Subject_ID=? and Homework_ID=?");
            statement.setInt(1,User_ID);
            statement.setInt(2,Subject_ID);
            statement.setInt(3,Homework_ID);
            res=statement.executeUpdate();
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }
        return res;
   }
   public static int SaveDefaultAvatar(int User_ID)  {
        int res=-1;
       Blob image = null;
       byte[ ] imgData = null ;
       ResultSet rs = null;
       String sql = "INSERT INTO user_avatar (User_ID, User_Avatar) values (?, ?)";
        try{
            InputStream imageFile = new FileInputStream("C:\\Users\\Giorgi\\IdeaProjects\\Schoolbook\\web\\images/avatar.png");
            PreparedStatement statement= getConnection().prepareStatement(sql);
            statement.setInt(1,User_ID);
            if (imageFile!=null){
                statement.setBlob(2, imageFile);
            }
            res = statement.executeUpdate();
            if (res > 0) {
                System.out.println("File uploaded and saved into database");
            }else{
                System.out.println("error uploading avatar");
            }
        }catch (FileNotFoundException | SQLException ex){
            System.out.println(ex.getMessage());
        }
        return res;
   }
   public static List<Mark> getMarkSubs(int User_ID){
        List<Mark> markList = new ArrayList<>();
        try{
            PreparedStatement statement= getConnection().prepareStatement("select * from marks where User_ID=?");
            statement.setInt(1,User_ID);
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                Mark m = new Mark();
                m.setMark(rs.getInt("Mark"));
                m.setUser_ID(rs.getInt("Subject_ID"));
                markList.add(m);
            }
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }
        return markList;
   }
   public static List<Gacdena_User_Rel> getAllGacdenaForUser(int User_ID){
        List<Gacdena_User_Rel> list = new ArrayList<>();
        try{
            PreparedStatement statement =getConnection().prepareStatement("select * from gacdenebi where User_ID=?");
            statement.setInt(1,User_ID);
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                Gacdena_User_Rel u = new Gacdena_User_Rel();
                u.setUser_ID(rs.getInt("User_ID"));
                u.setSubject_ID(rs.getInt("Subject_ID"));
                u.setClass_Name(rs.getString("Class_Name"));
                u.setDate(rs.getDate("Gacdena_Date"));
                u.setGacdena(rs.getInt("Gacdena"));
                list.add(u);
            }
        }catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
   }
   public static List<User> getWhoMadeDavaleba(int Homework_ID){
        List<User> list = new ArrayList<>();
        try{
            PreparedStatement statement = getConnection().prepareStatement("select * from homework_user_rel a inner join users b on a.User_ID = b.User_ID  where a.Homework_ID=? and a.DoneOrNot=1");
            statement.setInt(1,Homework_ID);
            ResultSet resultSet = statement.executeQuery();
            while(resultSet.next()){
                User user = new User();
                user.setID_Number(resultSet.getInt("ID_Number"));
                user.setFirst_Name(resultSet.getString("First_Name"));
                user.setLast_Name(resultSet.getString("Last_Name"));
                user.setPassword(resultSet.getString("Password"));
                user.setClass_Name(resultSet.getString("Class_Name"));
                user.setUser_ID(resultSet.getInt("User_ID"));
                user.setUser_Type_ID(resultSet.getInt("User_Type_ID"));
                list.add(user);
            }
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }
        return list;
   }
   public static int updatePassword(String password,int User_ID){
        int res = -1;
        try{
            PreparedStatement statement=getConnection().prepareStatement("update users set Password=? where User_ID=?");
            statement.setString(1,password);
            statement.setInt(2,User_ID);
            res=statement.executeUpdate();
        }catch (SQLException e) {
            System.out.println(e.getMessage());
        }
      return res;
   }
   public static List<Mark_User_Rel> getAllStudentMarks(int User_ID){
        List<Mark_User_Rel> list = new ArrayList<>();
        try{
            PreparedStatement statement = getConnection().prepareStatement("select * from marks a inner join subject b on a.Subject_ID = b.Subject_ID where a.User_ID=?");
            statement.setInt(1,User_ID);
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                Mark_User_Rel u = new Mark_User_Rel();
                u.setSubject_ID(rs.getInt("Subject_ID"));
                u.setSubject(rs.getString("Subject_Name"));
                u.setMark(rs.getInt("Mark"));
                u.setUser_ID(rs.getInt("User_ID"));
                u.setMarkDate(rs.getDate("Mark_Date"));
                list.add(u);
            }
        }catch (SQLException e ) {
            System.out.println(e.getMessage());
        }
        return list;
   }
   public static List<Mark_User_Rel> getAllMarks() {
        List<Mark_User_Rel> list = new ArrayList<>();
        try{
         PreparedStatement statement = getConnection().prepareStatement("select Mark_ID,First_Name,Last_Name,Subject_Name,Mark,Mark_Date from marks a inner join users b inner join subject c on a.User_ID = b.User_ID and a.Subject_ID = c.Subject_ID");
         ResultSet resultSet = statement.executeQuery();
         while (resultSet.next()){
             Mark_User_Rel u = new Mark_User_Rel();
             u.setFirst_Name(resultSet.getString("First_Name"));
             u.setLast_Name(resultSet.getString("Last_Name"));
             u.setSubject(resultSet.getString("Subject_Name"));
             u.setMark(resultSet.getInt("Mark"));
             u.setMarkDate(resultSet.getDate("Mark_Date"));
             u.setMark_ID(resultSet.getInt("Mark_ID"));
             list.add(u);
         }
        }catch (SQLException e ){
            System.out.println(e.getMessage());
        }
        return list;
   }
   public static List<Gacdena_User_Rel> getAllGacdenebi(){
        List<Gacdena_User_Rel> list = new ArrayList<>();
        try{
            PreparedStatement statement = getConnection().prepareStatement("select Gacdena_Date,First_Name,Last_Name,Subject_Name,Gacdena_ID from gacdenebi a inner join users b inner join subject c on a.User_ID = b.User_ID and a.Subject_ID = c.Subject_ID");
            ResultSet rs = statement.executeQuery();
           while (rs.next()){
               Gacdena_User_Rel  u = new Gacdena_User_Rel();
               u.setDate(rs.getDate("Gacdena_Date"));
               u.setFirst_Name(rs.getString("First_Name"));
               u.setLast_Name(rs.getString("Last_Name"));
               u.setSubject(rs.getString("Subject_Name"));
               u.setGacdena_ID(rs.getInt("Gacdena_ID"));
               list.add(u);
           }
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }
        return list;
   }
   public  static int DeleteMarkByID(int Mark_ID){
        int res = -1;
        try
        {
            PreparedStatement statement = getConnection().prepareStatement("delete from marks where Mark_ID = ?");
            statement.setInt(1,Mark_ID);
            res = statement.executeUpdate();

        }catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return res;
   }
    public  static int DeleteGacdena(int Gacdena_ID){
        int res = -1;
        try
        {
            PreparedStatement statement = getConnection().prepareStatement("delete from gacdenebi where Gacdena_ID = ?");
            statement.setInt(1,Gacdena_ID);
            res = statement.executeUpdate();

        }catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return res;
    }
   public static int waiveTeacher(int User_ID,int Class_ID){
        int res = -1;
        try{
            PreparedStatement statement=getConnection().prepareStatement("delete from user_classes_rel where User_ID=? and Class_ID=?");
            statement.setInt(1,User_ID);
            statement.setInt(2,Class_ID);
            res = statement.executeUpdate();
        }catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return res;
   }
   public static int SaveQuiz(String question,String answer1,String answer2,String answer3,String answer,int Checkbox){
        int res = -1;
        try{
            PreparedStatement statement=getConnection().prepareStatement("insert into quiz(Question,Answer1,Answer2,Answer3,Answer,checkboxID,Date) values(?,?,?,?,?,?,curdate())");
            statement.setString(1,question);
            statement.setString(2,answer1);
            statement.setString(3,answer2);
            statement.setString(4,answer3);
            statement.setString(5,answer);
            statement.setInt(6, Checkbox);
            res = statement.executeUpdate();
        }
        catch (SQLException e ){
            System.out.println(e.getMessage());
        }
        return res;
   }
   public static List<Question> getTodaysQuiz(){
        List<Question> list = new ArrayList<>();
        try {
            PreparedStatement statement= getConnection().prepareStatement("select * from quiz where Date = curdate()" );
            ResultSet resultSet = statement.executeQuery();
            while(resultSet.next()){
                Question u = new Question();
                u.setAnswer(resultSet.getString("Answer"));
                u.setAnswer1(resultSet.getString("Answer1"));
                u.setAnswer2(resultSet.getString("Answer2"));
                u.setAnswer3(resultSet.getString("Answer3"));
                u.setQuestion(resultSet.getString("Question"));
                u.setPasuxi(resultSet.getInt("checkboxID"));
                u.setQuiz_ID(resultSet.getInt("Quiz_ID"));
                list.add(u);
            }
        }catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
   }
   public static int QuizRegister(int User_ID){
        int res = -1;
        try{
            PreparedStatement statement = getConnection().prepareStatement("insert into quiz_rel (User_ID,Score) values(?,0)");
            statement.setInt(1,User_ID);
            res = statement.executeUpdate();
        }catch (SQLException e ){
            System.out.println(e.getMessage());
        }
        return res;
   }
   public static List<User> quizRegistered(){
        List<User> list = new ArrayList<>();
        try{
            PreparedStatement statement = getConnection().prepareStatement("select * from quiz_rel");
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                User u = new User();
                u.setUser_ID(rs.getInt("User_ID"));
                list.add(u);
            }
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }
        return list;
   }
    public static int AddScoreQuiz(int User_ID){
        int res = -1;
        try{
            PreparedStatement statement = getConnection().prepareStatement("update quiz_rel set score = score+1 where User_ID=?");
            statement.setInt(1,User_ID);
            res = statement.executeUpdate();
        }catch (SQLException e ){
            System.out.println(e.getMessage());
        }
        return res;
    }
    public static int linkQuiz(int User_ID,int Quiz_ID){
        int res = -1;
        try{
            PreparedStatement statement = getConnection().prepareStatement("insert into quiz_user_rel (Quiz_ID,User_ID) values(?,?)");
            statement.setInt(1,Quiz_ID);
            statement.setInt(2,User_ID);
            res = statement.executeUpdate();
        }catch (SQLException e ){
            System.out.println(e.getMessage());
        }
        return res;
    }
    public static List<Question> getWhoDoneToday(){
        List<Question> list = new ArrayList<>();
     try {
         PreparedStatement statement = getConnection().prepareStatement("select * from quiz_user_rel");
         ResultSet rs = statement.executeQuery();
         while (rs.next()) {
             Question u = new Question();
             u.setQuiz_ID(rs.getInt("Quiz_ID"));
             u.setUser_ID(rs.getInt("User_ID"));
             list.add(u);
         }
     }catch (SQLException e) {
         System.out.println(e.getMessage());
     }
     return list;
    }
    public static int getScoreByID(int User_ID){
        int score = 0;
        try{
            PreparedStatement statement=getConnection().prepareStatement("select * from quiz_rel where User_ID=? ");
            statement.setInt(1,User_ID);
            ResultSet resultSet = statement.executeQuery();
            while(resultSet.next()){
                score=resultSet.getInt("Score");
            }
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }
        return score;
    }
    public static List<Subject> getSubjectByClass(int Class_ID){
        List<Subject> list = new ArrayList<>();
        try{
            PreparedStatement statement = getConnection().prepareStatement("select Subject_Name,b.Subject_ID from user_classes_rel a inner join users_subject_rel b inner join subject  c inner join users d on a.User_ID=b.User_ID and b.Subject_ID=c.Subject_ID where a.Class_ID=? and d.User_ID=a.User_ID and d.User_Type_ID=2");
            statement.setInt(1,Class_ID);
            ResultSet resultSet = statement.executeQuery();
            while(resultSet.next()){
                Subject u = new Subject();
                u.setName(resultSet.getString("Subject_Name"));
                u.setSubject_ID(resultSet.getInt("Subject_ID"));
                list.add(u);
            }
        }catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    public static int saveQuizMark(int User_ID,int Subject_ID){
     int res = -1;
     try {
         PreparedStatement statement = getConnection().prepareStatement("insert into marks(Mark,User_ID,Subject_ID,Mark_Date) values(10,?,?,curdate())");
         statement.setInt(1,User_ID);
         statement.setInt(2,Subject_ID);
         res = statement.executeUpdate();
     }catch (SQLException e) {
         System.out.println(e.getMessage());
     }
     return res;
    }
    public static int removeScoreQuiz(int User_ID){
        int res = -1;
        try{
            PreparedStatement statement = getConnection().prepareStatement("update quiz_rel set score = score-10 where User_ID=?");
            statement.setInt(1,User_ID);
            res = statement.executeUpdate();
        }catch (SQLException e ){
            System.out.println(e.getMessage());
        }
        return res;
    }
    public static int deleteHomework(int Homework_ID){
        int res = -1;
        int er = Homework_ID;
        try{
            PreparedStatement statement = getConnection().prepareStatement("delete from homework_user_rel where Homework_ID=?");
            PreparedStatement statement1 = getConnection().prepareStatement("delete from homeworks where Homework_ID=?");
            statement.setInt(1,Homework_ID);
            statement1.setInt(1,er);
            res=statement.executeUpdate() + statement1.executeUpdate();
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }
        return res;
    }
}