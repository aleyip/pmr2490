<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<html>
  <head>
    <meta charset="utf-8">
    <title>Home page</title>
    <c:import url="/WEB-INF/jsp/shared/css.jsp" />
    <c:import url="/WEB-INF/jsp/shared/js.jsp" />
  </head>
  <body>
    <c:import url="/WEB-INF/jsp/shared/header.jsp" />
    
    <div class="container theme-showcase" role="main">
    
    <c:import url="/WEB-INF/jsp/shared/alert.jsp" />

      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron" style="text-align: center">
        <h1>Eventos Poli USP</h1>
        
        <security:authorize access="isAuthenticated()">
          <p>Esta � a p�gina inicial do projeto de SI PMR2490.</p>
          <p>Gerenciador de eventos da Escola Polit�cnica da Universidade de S�o Paulo</p>
          <p><a href="users" class="btn btn-primary btn-lg" role="button">User</a></p>
        </security:authorize>
        
        <security:authorize access="!isAuthenticated()">
          <p></p>
          <p>Bem vindo ao gerenciador de eventos da Escola Polt�cnica da Universidade de S�o Paulo.</p>
          <p>Para come�ar a utilizar o sistema, fa�a o seu cadastro.</p>
          <p><a href="users/new" class="btn btn-primary btn-lg" role="button">Cadastre-se</a></p>
          <p>Caso j� esteja cadastrado, fa�a seu login e comece a utilizar o sistema.</p>
          <p><a href="login" class="btn btn-primary btn-lg" role="button">Login</a></p>
        </security:authorize>
      </div>
    </div>
    
    <c:import url="/WEB-INF/jsp/shared/footer.jsp" />
    
  </body>
</html>