<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--JSTL-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="edit-form" id="edit-form">

	<h1 class="pb-4">Edit Profile</h1>
	<form:form commandName="member">
		<div class="row">
			<div class="col-md-2">User-id</div>
			<div class="col-md-10">${member.userId}
				<form:hidden path="userId" />
			</div>
		</div>

		<div class="row">
			<div class="col-md-2">Name</div>
			<div class="col-md-10">${member.name}
				<form:hidden path="name" />
			</div>
		</div>

		<div class="row">
			<div class="col-md-2">Password</div>
			<div class="col-md-10">
				<form:password path="password" />
			</div>
		</div>

		<div class="row">
			<div class="col-md-2">Email</div>
			<div class="col-md-10">
				<form:input path="email" />
				<form:errors path="email" />
			</div>
		</div>
		<div class="row">
			<div class="col-md-2">Cell Phone</div>
			<div class="col-md-10">
				<form:input path="cellPhone" />
				<form:errors path="cellPhone" />
			</div>
		</div>

		<div class="row">
			<div class="col-md-2">Address</div>
			<div class="col-md-10">
				<form:input path="address" />
				<form:errors path="address" />
			</div>
		</div>


		<form:errors cssClass="error" element="div" />
		<input type="submit" value="Edit Profile"
			class="btn btn-primary btn-md">
	</form:form>

</div>
