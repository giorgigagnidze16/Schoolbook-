<%@ page import="DAO.UserDao" %>
<%@ page import="Model.User.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="u" class="Model.Subject.Subject"/>
<jsp:useBean id="obj" class="Model.User.User"/>
<%
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
    String redirect = "location='../Admin/AdminClasses.jsp?firstname="+obj.getFirst_Name()+"&lastname="+obj.getLast_Name() +"&ID_Number=" + obj.getID_Number() + "&role=" +role+"&User_ID=" + obj.getUser_ID()+ "';";
    int Subject_ID  =Integer.parseInt(  request.getParameter("Subject_ID"));
    u.setSubject_ID(Subject_ID);
    u.setName("null");
    int re=UserDao.deleteSubject(u);
    System.out.println(re);
   if(re==1){
       out.println("<script type=\"text/javascript\">");
       out.println(redirect);
       out.println("</script>");
   }else{
       out.println("<script type=\"text/javascript\">");
       out.println("alert('წაუშალეთ მასწავლებელს საგანი!');");
       out.println(redirect);
       out.println("</script>");
   }
%>