<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Cadastro de Professor</title>
  <link rel="stylesheet" href="style.css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

  <h2>Cadastrar Professor</h2>

  <form action="addProfessor.jsp" method="post">
    <table>
      <tr>
        <td>Nome:</td>
        <td><input type="text" name="nome" required></td>
      </tr>
      <tr>
        <td>Email:</td>
        <td><input type="email" name="email" required></td>
      </tr>
      <tr>
        <td>Matrícula:</td>
        <td><input type="text" name="matricula" required></td>
      </tr>
      <tr>
        <td>Departamento:</td>
        <td><input type="text" name="departamento"></td>
      </tr>
      <tr>
        <td>Telefone:</td>
        <td><input type="text" name="telefone"></td>
      </tr>
      <tr>
        <td>Titulação:</td>
        <td><input type="text" name="titulacao"></td>
      </tr>
      <tr>
        <td>Área de Atuação:</td>
        <td><input type="text" name="area_atuacao"></td>
      </tr>
      <tr>
        <td>Status:</td>
        <td><input type="checkbox" name="status" checked></td>
      </tr>
      <tr>
        <td colspan="2"><input type="submit" value="Cadastrar"></td>
      </tr>
    </table>
  </form>

  <p><a href="viewProfessor.jsp">Voltar</a></p>

  <!-- SweetAlert2 Feedback -->
  <c:if test="${resultado == 'sucess'}">
    <script>
      Swal.fire({
        icon: 'success',
        title: 'Professor cadastrado!',
        text: 'O novo professor foi salvo com sucesso.',
        confirmButtonColor: '#3085d6'
      });
    </script>
  </c:if>

  <c:if test="${resultado == 'error'}">
    <script>
      Swal.fire({
        icon: 'error',
        title: 'Erro ao salvar',
        text: 'Não foi possível cadastrar o professor. Tente novamente.',
        confirmButtonColor: '#d33'
      });
    </script>
  </c:if>

</body>
</html>
