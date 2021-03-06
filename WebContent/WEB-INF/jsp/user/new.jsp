<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
  <head>
    <meta charset="utf-8">
    <title>Novo usu�rio</title>
    <c:import url="/WEB-INF/jsp/shared/css.jsp" />
    <c:import url="/WEB-INF/jsp/shared/js.jsp" />
    <style>
      .center-form {
        max-width: 600px;
        margin: 0 auto;
      }
    </style>
  </head>
  <body>
    <c:import url="/WEB-INF/jsp/shared/header.jsp" />
    
    <div class="container theme-showcase" role="main">
    
      <c:import url="/WEB-INF/jsp/shared/alert.jsp" />
      <div class="center-form">
        <form:form class="form-horizontal" action="new" modelAttribute="userDto">
          <div class="form-group">
            <label for="firstNameInput" class="control-label col-xs-4">Nome * </label>
            <div class="col-xs-8">
			  <form:input path="firstName" class="form-control" id="firstNameInput" placeholder="Nome" required="true" autofocus="true" />
			</div>
		    <form:errors path="firstName" cssClass="error" />
		  </div>
		  <div class="form-group">
            <label for="lastNameInput" class="control-label col-xs-4">Sobrenome * </label>
            <div class="col-xs-8">
			  <form:input path="lastName" class="form-control" id="lastNameInput" placeholder="Sobrenome" required="true" />
			</div>
		    <form:errors path="lastName" cssClass="error" />
		  </div>
		  <div class="form-group">
            <label for="birthDayInput" class="control-label col-xs-4">Data de nascimento </label>
            <div class="col-xs-8">
              <div class="input-group">
			  <form:input path="birthDay" class="form-control" id="birthDayInput" placeholder="DD" />
			  <span class="input-group-addon">/</span>
			  <form:input path="birthMonth" class="form-control" id="birthMonthInput" placeholder="MM" />
			  <span class="input-group-addon">/</span>
			  <form:input path="birthYear" class="form-control" id="birthYearInput" placeholder="YYYY" />
			  </div>
			</div>
		    <form:errors path="birthDay" cssClass="error" />
		  </div>
		  <div class="form-group">
            <label for="genderOptions" class="control-label col-xs-4">Sexo </label>
            <div class="col-xs-8">
			  <form:select path="gender" class="form-control" id="genderOptions">
			    <form:option value="">Selecione seu sexo</form:option>
			    <form:option value="m">Masculino</form:option>
			    <form:option value="f">Feminino</form:option>
		      </form:select>
			</div>
		    <form:errors path="gender" cssClass="error" />
		  </div>
		  <div class="form-group">
            <label for="phoneDddInput" class="control-label col-xs-4">Telefone </label>
            <div class="col-xs-2">
			  <form:input path="phoneDdd" class="form-control" id="phoneDddInput" placeholder="DDD" />
			</div>
			<div class="col-xs-6">
			  <form:input path="phoneNumber" class="form-control" id="phoneNumberInput" placeholder="Telefone" />
			</div>
		    <form:errors path="phoneNumber" cssClass="error" />
		  </div>
		  <div class="form-group">
            <label for="emailInput" class="control-label col-xs-4">E-mail * </label>
            <div class="col-xs-8">
			  <form:input path="email" class="form-control" id="emailInput" placeholder="E-mail" required="true" />
			</div>
		    <form:errors path="email" cssClass="error" />
		  </div>
		  <div class="form-group">
            <label for="passwordInput" class="control-label col-xs-4">Senha * </label>
            <div class="col-xs-8">
			  <form:input path="password" class="form-control" id="passwordInput" placeholder="Senha" type="password" required="true" />
			</div>
		    <form:errors path="password" cssClass="error" />
		  </div>
		  <div class="form-group">
            <label for="passwordConfirmationInput" class="control-label col-xs-4">Confirma��o da senha * </label>
            <div class="col-xs-8">
			  <form:input path="passwordConfirmation" class="form-control" id="passwordConfirmationInput" placeholder="Confirma��o da senha" type="password" required="true" />
			</div>
		    <form:errors path="passwordConfirmation" cssClass="error" />
		  </div>
		  <div class="form-group">
            <label for="professionOptions" class="control-label col-xs-4">Ocupa��o * </label>
            <div class="col-xs-8">
			  <form:select path="professionId" class="form-control" id="professionOptions">
			    <form:option value="">Selecione sua ocupa��o</form:option>
          		<form:options items="${professions}" itemValue="id" itemLabel="name" required="true" />
		      </form:select>
			</div>
		    <form:errors path="professionId" cssClass="error" />
		  </div>
		  <div class="form-group">
            <label for="collegeOptions" class="control-label col-xs-4">Faculdade</label>
            <div class="col-xs-8">
			  <form:select path="collegeId" class="form-control" id="collegeOptions"> 
			    <form:option value="">Selecione sua faculdade</form:option>
			    <form:options items="${colleges}" itemValue="id" itemLabel="name" />
		      </form:select>
			</div>
		    <form:errors path="collegeId" cssClass="error" />
		  </div>
		  <div class="form-group">
		    <div class="col-xs-offset-4">
              <input class="form-control btn btn-primary" type="submit" value="Cadastrar" />
            </div>
		  </div>
		
      </form:form>
      </div>

    </div>
    
    <c:import url="/WEB-INF/jsp/shared/footer.jsp" />
    
  </body>
</html>