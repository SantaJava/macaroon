<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--JSTL-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="loginBack">
	<div class="login-form">
		<c:if test="${not empty login.url}">
			<div class="mt-4 mb-4">
				<h4>Login is needed, please Login.</h4>
			</div>
		</c:if>
	</div>
	<h2>
		<i class="fa fa-sign-in-alt"></i>&nbsp;Login
	</h2>
	<hr>
	<form:form commandName="login">
		<form:hidden path="url" />
		<div class="md-form">
			<i class="fa fa-user prefix grey-text"></i> <label for="userId">User
				ID</label>
			<form:input path="userId" class="form-control"
				value="${login.userId}" />
			<form:errors path="userId" cssClass="error" />
		</div>
		<div class="md-form">
			<i class="fa fa-lock prefix grey-text"></i> <label for="password">Password</label>
			<form:password path="password" class="form-control" />
			<form:errors path="password" cssClass="error" />
		</div>
		<div class="md-form text-center">
			<button type="submit" class="btn btn-primary">
				<i class="fa fa-check"></i> Login
			</button>
		</div>
	</form:form>
</div>
