<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<html>
  <head>
    <meta charset="utf-8">
    <title>Eventos</title>
    <c:import url="/WEB-INF/jsp/shared/css.jsp" />
    <c:import url="/WEB-INF/jsp/shared/js.jsp" />
    <style>
    .event-description {
      text-align: justify; 
      height: 7em; 
      overflow: hidden;
    }
    </style>
  </head>
  <body>
    <c:import url="/WEB-INF/jsp/shared/header.jsp" />
    
    <div class="container theme-showcase" role="main">
    
      <c:if test="${empty events}">
        <div class="jumbotron" style="text-align: center">
          <h3>Nenhum evento encontrado</h3>
        </div>
      </c:if>
    
    <p><c:set var="dateAtual" value="<%=new java.util.Date()%>"/></p>
    <c:set var="temEvento" scope="session" value="${0}"/>
    <c:set var="tempoExpirado" scope="session" value="${1}"/>
      <div class="row">
        <c:forEach var="event" items="${events}">
        <c:choose>
        	<c:when test="${empty event.dateEnd}">
        		<c:if test="${event.dateStart > dateAtual}">
        			<c:set var="tempoExpirado" scope="session" value="${0}"/>
        		</c:if>
        	</c:when>
        	<c:otherwise>
        		<c:if test="${event.dateEnd > dateAtual}">
        			<c:set var="tempoExpirado" scope="session" value="${0}"/>
        		</c:if>
			</c:otherwise>
		</c:choose>
        <c:if test="${tempoExpirado==0}">
          	<div class="col-md-4 col-sm-6">
           	 <div style="border-style: solid; border-width: thin; padding: 15px; margin: 10px;">
           	 <h3 style="text-align: center;">${event.name}</h3>
				<p style="text-align: center;">
				  <span style="font-weight: bold;">Quando? </span>
				  <fmt:formatDate value="${event.dateStart}" pattern="dd/MM/yyyy hh:mm" />
				</p>
       	     <p style="text-align: center;"><span style="font-weight: bold;">Onde? </span>${event.local.name}</p>
       	     <p class="event-description">${event.description}</p>
       	     <div class="text-center">
       	       <a href="/pmr2490/events/${event.id}" class="btn btn-primary btn-sm" role="button">Ver evento</a>
       	       
       	       <c:if test="${event.creator.email == username}">
       	         <a href="/pmr2490/events/${event.id}/edit" class="btn btn-warning btn-sm" role="button">Editar evento</a>
       	       </c:if>
       	       <security:authorize access="hasRole('ADMIN')">
       	         <form class="crud-buttons" action="/pmr2490/events/${event.id}/destroy" method="post">
       	           <input type="submit" value="Deletar" class="btn btn-danger btn-sm" />
       	         </form>
       	       </security:authorize>
       	     </div>
       	     </div>
       	   </div>
       	   <c:set var="temEvento" scope="session" value="${1}"/>
       	   </c:if>
       	 </c:forEach>
      </div>
    </div>
    <c:if test="${temEvento==0}">
        <div class="jumbotron" style="text-align: center">
          <h3>Nenhum evento encontrado</h3>
        </div>
    </c:if>
      
    
    <c:import url="/WEB-INF/jsp/shared/footer.jsp" />
    
  </body>
</html>