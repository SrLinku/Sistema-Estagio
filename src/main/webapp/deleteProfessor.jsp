<%@ page import="com.sistemaestagio.dao.ProfessorDao"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    try {
        String idParam = request.getParameter("id");
        if (idParam != null && !idParam.isEmpty()) {
            int id = Integer.parseInt(idParam);
            ProfessorDao.deleteProfessor(id);
        }
    } catch (Exception e) {
        out.println("Erro ao excluir professor: " + e.getMessage());
    }

    // Redireciona para a listagem
    response.sendRedirect("viewProfessor.jsp");
%>
