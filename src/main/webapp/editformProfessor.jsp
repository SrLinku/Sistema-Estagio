<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.sistemaestagio.dao.ProfessorDao" %>
<%@ page import="com.sistemaestagio.bean.Professor" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Editar Professor</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
<%
  int id = Integer.parseInt(request.getParameter("id"));
  Professor p = ProfessorDao.getProfessorById(id);
%>

<h2>Editar Professor</h2>

<form action="editProfessor.jsp" method="post">
  <input type="hidden" name="id_professor" value="<%=p.getId_professor()%>" />
  <table>
    <tr>
      <td>Nome:</td>
      <td><input type="text" name="nome" value="<%=p.getNome()%>" required></td>
    </tr>
    <tr>
      <td>Email:</td>
      <td><input type="email" name="email" value="<%=p.getEmail()%>" required></td>
    </tr>
    <tr>
      <td>Matrícula:</td>
      <td><input type="text" name="matricula" value="<%=p.getMatricula()%>" required></td>
    </tr>
    <tr>
      <td>Departamento:</td>
      <td><input type="text" name="departamento" value="<%=p.getDepartamento()%>"></td>
    </tr>
    <tr>
      <td>Telefone:</td>
      <td><input type="text" name="telefone" value="<%=p.getTelefone()%>"></td>
    </tr>
    <tr>
      <td>Titulação:</td>
      <td><input type="text" name="titulacao" value="<%=p.getTitulacao()%>"></td>
    </tr>
    <tr>
      <td>Área de Atuação:</td>
      <td><input type="text" name="area_atuacao" value="<%=p.getArea_atuacao()%>"></td>
    </tr>
    <tr>
      <td>Status:</td>
      <td><input type="checkbox" name="status" <%=p.isStatus() ? "checked" : ""%>></td>
    </tr>
    <tr>
      <td colspan="2"><input type="submit" value="Atualizar"></td>
    </tr>
  </table>
</form>

<p><a href="viewProfessor.jsp">Voltar à lista</a></p>

</body>
</html>
