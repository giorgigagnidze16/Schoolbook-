<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="DAO.UserDao" %>
<%@ page import="Model.Homework.Homework" %>
<%@ page import="Model.Class.School_Class" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String davaleba = request.getParameter("editDavaleba");
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    Date giveDate = formatter.parse(request.getParameter("giveDate"));
    Date deadline = formatter.parse(request.getParameter("deadLine"));
    String Class_Name = request.getParameter("Class_Name");
    int Subject_ID =Integer.parseInt(request.getParameter("Subject_ID"));
    int Homework_ID = Integer.parseInt(request.getParameter("hmid"));
    UserDao.updateHomework(davaleba,Class_Name,Subject_ID,UserDao.convertUtilToSql(giveDate),UserDao.convertUtilToSql(deadline),Homework_ID);

    int Class_ID = 0;
    List<School_Class> classList = UserDao.getClasses();
    for(int i = 0;i<classList.size();i++){
        if(Class_Name.equals(classList.get(i).getClass_Name())){
            Class_ID=classList.get(i).getClass_ID();
        }
    }
    String url = "Teacher/viewDavalebaTeacher.jsp?Class_Name="+Class_Name+"&Class_ID="+Class_ID+"&Subject_ID="+Subject_ID;
    response.sendRedirect(url);
%>
