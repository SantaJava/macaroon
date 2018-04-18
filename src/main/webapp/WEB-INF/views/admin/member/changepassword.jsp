<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--JSTL-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script>
	$(function() {
		$('#password').submit(function(e) {
			//비밀번호 일치 검사
			var password1 = $('#newPassword').val();
			var password2 = $('#newPassword2').val();

			if (password1 != password2) {
				alert('비밀번호가 일치하지 않습니다.');
				$('#newPassword').focus();
				e.preventDefault();
			}
		});

	});
</script>
<body>
<div id="password" class="password">

	<title>change password</title>

	<div class="login-form">
		<form:form commandName="password">
			<input type="hidden" path="userId" />

			<div class="md-form">
				<label for="oldPassword"> ADMIN Password </label>
				<form:password path="oldPassword" class="form-control" />
				<form:errors path="oldPassword" />
			</div>

			<div class="md-form">
				<label for="newPassword"> New Password </label>
				<form:password path="newPassword" class="form-control" />
				<form:errors path="newPassword" />
			</div>

			<div class="md-form">
				<label for="newPassword2"> New Password Confirm </label> <input
					type="password" id="newPassword2" class="form-control" />
			</div>

			<form:errors element="div" cssClass="error" />
			<input type="submit" value="Edit Password"
				class="btn btn-primary btn-sm">
			<a href="../view/${password.userId}?page=${param.page}"  class="btn btn-primary btn-sm">Cancel</a>
		</form:form>
	</div>
</div>
