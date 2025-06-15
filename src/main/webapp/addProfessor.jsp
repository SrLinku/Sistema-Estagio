<%@ page import="com.sistemaestagio.dao.ProfessorDao"%>
<%@ page import="javax.servlet.RequestDispatcher"%>
<jsp:useBean id="p" class="com.sistemaestagio.bean.Professor" />
<jsp:setProperty property="*" name="p" />

<%
String statusParam = request.getParameter("status");
if (statusParam == null) {
	p.setStatus(false); // checkbox desmarcado
} else {
	p.setStatus(true); // checkbox marcado
}

int i = ProfessorDao.addProfessor(p);
request.setAttribute("resultado", i > 0 ? "sucess" : "error");
RequestDispatcher rd = request.getRequestDispatcher("formProfessor.jsp");
rd.forward(request, response);
%>
