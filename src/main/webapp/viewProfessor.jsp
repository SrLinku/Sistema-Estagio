<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.sistemaestagio.bean.Professor"%>
<%@ page import="com.sistemaestagio.dao.ProfessorDao"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listagem de Professores</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%
	int currentPage = 1;
	int pageSize = 10;
	if (request.getParameter("page") != null) {
		try {
			currentPage = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException e) {
			currentPage = 1;
		}
	}
	List<Professor> list = ProfessorDao.getProfessoresByPage(currentPage, pageSize);
	int total = ProfessorDao.getProfessorCount();
	int totalPages = (int) Math.ceil((double) total / pageSize);
	request.setAttribute("list", list);
	request.setAttribute("currentPage", currentPage);
	request.setAttribute("totalPages", totalPages);
	%>
	<p>
		<a href="index.html" class="btn">[home]</a>
	</p>
	<h1>Listagem de Professores</h1>
	<p>
		<a href="formProfessor.jsp" class="btn">➕ Novo Professor</a>
	</p>
	<table class="table-user">
		<tr>
			<th>ID</th>
			<th>Nome</th>
			<th>Email</th>
			<th>Matrícula</th>
			<th>Departamento</th>
			<th>Status</th>
			<th>Ações</th>
		</tr>
		<c:forEach items="${list}" var="p">
			<tr>
				<td>${p.id_professor}</td>
				<td>${p.nome}</td>
				<td>${p.email}</td>
				<td>${p.matricula}</td>
				<td>${p.departamento}</td>
				<td>${p.status ? "Ativo" : "Inativo"}</td>
				<td><a href="editformProfessor.jsp?id=${p.id_professor}"
					class="btn">✏️ Editar</a> <a
					href="deleteProfessor.jsp?id=${p.id_professor}" class="btn"
					onclick="return confirm('Deseja excluir este professor?');">🗑️
						Excluir</a></td>
			</tr>
		</c:forEach>
	</table>
	<div class="pagination">
		<c:if test="${currentPage > 1}">
			<a href="viewProfessor.jsp?page=${currentPage - 1}">⬅ Anterior</a>
		</c:if>
		<c:forEach begin="1" end="${totalPages}" var="i">
			<a href="viewProfessor.jsp?page=${i}"
				class="${i == currentPage ? 'active' : ''}">${i}</a>
		</c:forEach>
		<c:if test="${currentPage < totalPages}">
			<a href="viewProfessor.jsp?page=${currentPage + 1}">Próxima ➡</a>
		</c:if>
	</div>
</body>
</html>