<%@ page import="com.sistemaestagio.dao.ProfessorDao" %>
<%@ page import="com.sistemaestagio.bean.Professor" %>

<jsp:useBean id="p" class="com.sistemaestagio.bean.Professor" />
<jsp:setProperty name="p" property="*" />

<%
    // Trata checkbox manualmente
    String statusParam = request.getParameter("status");
    p.setStatus(statusParam != null); // true se marcado, false se nulo

    // Atualiza o professor
    int i = ProfessorDao.updateProfessor(p);

    // Redireciona após salvar
    response.sendRedirect("viewProfessor.jsp");
%>
