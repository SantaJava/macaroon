<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--JSTL-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="Login-form">
	<div class="col-lg-6">
		<c:if test="${not empty login.url}">
			<div class="mt-4 mb-4">
				<h4>login is needed. please log in.</h4>
			</div>
		</c:if>
		<form:hidden path="url" />

		<h1>
			<i class="fa fa-sign-in-alt"></i> Log In
		</h1>
		<form:form commandName="login">
			<input type="hidden" name="url" value="${url}"></input>
			<div>
				<label for="userId">User ID </label> <input type="text"
					name="userId" id="userId" required value="${userId}">
			</div>
			<div>
				<label for="password">Password </label> <input type="password"
					name="password" id="password" required>
			</div>
			<c:if test="${not empty error}">
				<div class="error">${error}</div>
			</c:if>
			<div>
				<input type="submit" value="Submit" class="btn btn-primary btn-md">
			</div>
		</form:form>
	</div>
</div>

