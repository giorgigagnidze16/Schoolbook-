<%
    HttpSession session1 = request.getSession(false);
    if (session1 != null) {
        session1.invalidate();
    }
    response.sendRedirect("index.jsp");
%>