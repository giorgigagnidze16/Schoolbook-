<%@ page import="java.util.List" %>
<%@ page import="Model.Question" %>
<%@ page import="Model.User.User" %>
<%@ page import="DAO.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Question> list = UserDao.getTodaysQuiz();
    int pasuxi = list.get(0).getPasuxi();
    System.out.println(pasuxi + " pasuxi");
    int User_ID = Integer.parseInt(request.getParameter("User_ID"));
    List<User> quizRegistered = UserDao.quizRegistered();
    int Quiz_ID = Integer.parseInt(request.getParameter("Quiz_ID"));
    boolean registered = false;
    for(int i=0;i<quizRegistered.size();i++){
        if(User_ID==quizRegistered.get(i).getUser_ID()){
            registered=true;
        }
    }
    String c1 = request.getParameter("c1");
    String c2 = request.getParameter("c2");
    String c3 = request.getParameter("c3");
    String c4 = request.getParameter("c4");
    if (c1==null){
        c1="0";
    }
    if (c2==null){
        c2="0";
    }
    if (c3==null){
        c3="0";
    }
    if (c4==null) {
        c4 = "0";
        UserDao.linkQuiz(User_ID, Quiz_ID);
        if (registered == true) {
            if (pasuxi == 1) {

                if (c1.equals("1")) {
                    UserDao.AddScoreQuiz(User_ID);
                    response.sendRedirect("../Student/studentprofile.jsp");
                }else{
                    response.sendRedirect("../Student/studentprofile.jsp");
                }
            } else {
                if (pasuxi == 2) {

                    if (c2.equals("2")) {
                        UserDao.AddScoreQuiz(User_ID);
                        System.out.println("sworia");
                        response.sendRedirect("../Student/studentprofile.jsp");
                    }else{
                        response.sendRedirect("../Student/studentprofile.jsp");
                    }
                } else {
                    if (pasuxi == 3) {

                        if (c3.equals("3")) {
                            UserDao.AddScoreQuiz(User_ID);
                            response.sendRedirect("../Student/studentprofile.jsp");
                        }else{
                            response.sendRedirect("../Student/studentprofile.jsp");
                        }

                    } else {
                        if (pasuxi == 4) {

                            if (c4.equals("4")) {
                                UserDao.AddScoreQuiz(User_ID);
                                response.sendRedirect("../Student/studentprofile.jsp");
                            }else{
                                response.sendRedirect("../Student/studentprofile.jsp");
                            }
                        }
                    }
                }
            }
        } else {
            UserDao.QuizRegister(User_ID);
            if (pasuxi == 1) {

                if (c1.equals("1")) {
                    UserDao.AddScoreQuiz(User_ID);
                    response.sendRedirect("../Student/studentprofile.jsp");
                }else{
                    response.sendRedirect("../Student/studentprofile.jsp");
                }
            } else {
                if (pasuxi == 2) {

                    if (c2.equals("2")) {
                        UserDao.AddScoreQuiz(User_ID);
                        response.sendRedirect("../Student/studentprofile.jsp");
                        System.out.println("sworia");

                    }else{
                        response.sendRedirect("../Student/studentprofile.jsp");
                    }
                } else {
                    if (pasuxi == 3) {

                        if (c3.equals("3")) {
                            UserDao.AddScoreQuiz(User_ID);
                            response.sendRedirect("../Student/studentprofile.jsp");
                        }else{
                            response.sendRedirect("../Student/studentprofile.jsp");
                        }
                    } else {
                        if (pasuxi == 4) {

                            if (c4.equals("4")) {
                                UserDao.AddScoreQuiz(User_ID);
                                response.sendRedirect("../Student/studentprofile.jsp");
                            }else{
                                response.sendRedirect("../Student/studentprofile.jsp");
                            }
                        }
                    }
                }
            }
        }
    }
%>
