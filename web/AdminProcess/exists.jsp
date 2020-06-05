<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%
    try {
        Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/mziuri?autoReconnect=true&useSSL=false", "root", "password");
        PreparedStatement ps = con.prepareStatement("SELECT  * FROM users WHERE " +
                "ID_Number = ?");
        ps.setInt(1, Integer.parseInt(request.getParameter("ID_Number")));
        ResultSet res = ps.executeQuery();
        if (res.first()) {
            out.print("მომხმარებელი არსებობს");
        }
    } catch (Exception e) {
        System.out.println(e);
    }
%>