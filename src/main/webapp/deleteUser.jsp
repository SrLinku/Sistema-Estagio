<%@ page import="com.sistemaestagio.dao.UserDao"%>
<jsp:useBean id="u" class="com.sistemaestagio.bean.User"> </jsp:useBean>
<jsp:setProperty property="*" name="u"/>property

<%
UserDao.deleteUser(u);
response.sendRedirect("viewUser.jsp");	
%>