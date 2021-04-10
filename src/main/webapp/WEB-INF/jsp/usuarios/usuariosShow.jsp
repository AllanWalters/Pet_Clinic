<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="cheapy" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link href='https://fonts.googleapis.com/css?family=Lobster' rel='stylesheet'>

<cheapy:layout pageName="usuario">

    <h2 style="text-align:center;padding:5px"><fmt:message key="usuario"/></h2>

    <table class="table table-striped" id="usuarioTable">
    	<thead>
        <tr>
            <th><fmt:message key="nombre"/></th>
            <td><c:out value="${usuario.nombre}"/></td>
        </tr>
        <tr>
            <th><fmt:message key="apellidos"/></th>
            <td><c:out value="${usuario.apellidos}"/></td>
        </tr>
		<tr>
            <th><fmt:message key="dni"/></th>
            <td><c:out value="${usuario.dni}"/></td>
        </tr>
        <tr>
            <th><fmt:message key="direccion"/></th>
            <td><c:out value="${usuario.direccion}"/> </td>
        </tr>
        <tr>
            <th><fmt:message key="telefono"/></th>
            <td><c:out value="${usuario.telefono}"/></td>
        </tr>
        <tr>
            <th><fmt:message key="email"/></th>
            <td><c:out value="${usuario.email}"/></td>
        </tr>
        </thead>
    </table>

    <div class="btn-menu">
	    
	<sec:authorize access="hasAnyAuthority('usuario')">
		<sec:authentication var="principal" property="principal" />
    	<div class="btns-edit">
			<spring:url value="edit" var="editUrl"/>
		    <button type="button" role="link" onclick="window.location='${fn:escapeXml(editUrl)}'" style="font-family: 'Lobster'; font-size: 20px;">
		    	<span class="glyphicon 	glyphicon glyphicon-edit" aria-hidden="true" style="padding: 5px"> </span>
		    Editar usuario</button>
		
	        <spring:url value="disable" var="deactivateUrl"/>
	        <button type="button" role="link" onclick="window.location='${fn:escapeXml(deactivateUrl)}'" style="font-family: 'Lobster'; font-size: 20px;">
	        	<span class="glyphicon glyphicon glyphicon-trash" aria-hidden="true" style="padding: 5px"> </span>
	         Desactivar usuario</button>
    	</div>
    </sec:authorize>
    <sec:authorize access="hasAnyAuthority('admin')">
		<sec:authentication var="principal" property="principal" />
    	<div class="btns-edit">
		
	        <spring:url value="/administrators/usuarios/{username}/disable" var="deactivateUrl">
	        	<spring:param name="username" value="${usuario.usuar.username}"/>
	        </spring:url>
	        <button type="button" role="link" onclick="window.location='${fn:escapeXml(deactivateUrl)}'" style="font-family: 'Lobster'; font-size: 20px;">
	        	<span class="glyphicon glyphicon glyphicon-trash" aria-hidden="true" style="padding: 5px"> </span>
	         Desactivar usuario</button>
    	</div>
    </sec:authorize>
    </div>
  	

</cheapy:layout>
