<%@ page import="DAO.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String c1 = request.getParameter("c1");
    String c2 = request.getParameter("c2");
    String c3 = request.getParameter("c3");
    String c4 = request.getParameter("c4");
    String question = request.getParameter("question");
    String a1 = request.getParameter("a1");
    String a2 = request.getParameter("a2");
    String a3 = request.getParameter("a3");
    String a4 = request.getParameter("a4");
    if (c1==null){
    c1="0";
}
    if (c2==null){
        c2="0";
    }
    if (c3==null){
        c3="0";
    }
    if (c4==null){
        c4="0";
    }
    if(c1.equals("1")){
        UserDao.SaveQuiz(question,a4,a2,a3,a1,1);
        response.sendRedirect("../Admin/QuestionOftheDay.jsp");
    }{
        if(c2.equals("2")){
            UserDao.SaveQuiz(question,a1,a4,a3,a2,2);
            response.sendRedirect("../Admin/QuestionOftheDay.jsp");

        }else{
            if(c3.equals("3")){
                UserDao.SaveQuiz(question,a1,a4,a3,a2,3);
                response.sendRedirect("../Admin/QuestionOftheDay.jsp");
            }else{
                if(c4.equals("4")){
                    UserDao.SaveQuiz(question,a1,a2,a3,a4,4);
                    response.sendRedirect("../Admin/QuestionOftheDay.jsp");

                }
            }

        }

    }

%>