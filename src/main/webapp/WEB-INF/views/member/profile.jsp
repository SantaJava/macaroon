<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--JSTL-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="profile-form">
	<div class="md-offset-4 mt-4 md-4">

		<h1 class="profile">Your Profile</h1>
		<div class="row">
			<div class="col-md-2">User-id</div>
			<div class="col-md-10">${member.userId}</div>
		</div>
		<div class="row">
			<div class="col-md-2">Name</div>
			<div class="col-md-10">${member.name}</div>
		</div>
		<div class="row">
			<div class="col-md-2">Email</div>
			<div class="col-md-10">${member.email}</div>
		</div>
		<div class="row">
			<div class="col-md-2">Phone</div>
			<div class="col-md-10">${member.cellPhone}</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-2">Address</div>
		<div class="col-md-10">${member.address}</div>
	</div>
	<div class="row">
		<div class="col-md-2">Registration</div>
		<div class="col-md-10">${member.regDate}</div>
	</div>
	<div class="row">
		<div class="col-md-2">Updated At</div>
		<div class="col-md-10">${member.updateDate}</div>
	</div>
	<a href = "changepassword" class = "btn btn-primary btn-sm" >Change Password</a> 
	<a href = "edit" class = "btn btn-primary btn-sm"> Edit Profile</a> 	
</div>

