<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script>
	$(function() {
		$('#check-btn').click(
				function(e) {
					e.preventDefault();
					var userId = $('#userId').val();
					if (userId == '') {
						alert('Please type in User Id.');
						return;
					}

					<c:url value="/idcheck" var ="idcheck" />
					$.get('${idcheck}', {
						userId : userId
					}, function(data) {
						console.log(data)
						if (!data) { //userid 중복 아님
							$(':submit').prop('disabled', false);
							$('#check-message').removeClass('error').html(
									'This ID is available.')
						} else { //userid 중복.
							$(':submit').prop('dsabled', true);
							$('#check-message').addClass('error').html(
									'This ID is already being used.')
						}
					})
				})
	});
</script>

<title>Insert title here</title>

<h2>JOIN THE BUTTER</h2>
<form:form commandName="member">
	<p>
		User Id
		<form:input path="userId" value="${member.userId}" />
		<form:errors path="userId" element="div" cssClass="error" />
	</p>
	<button class="btn btn-primary btn-sm" id="check-btn">Check
		User Id</button>
		<font class = "error"><span id = "check-message"></span></font>
	<p>
		Name
		<form:input path="name" value="${member.name}" />
	</p>
	<p>
		Password
		<form:password path="password" value="" />
		<form:errors path="password" element="div" cssClass="error" />
		<form:errors path="name" element="div" cssClass="error" />
	</p>
	<p>
		Cell Phone Number
		<form:input path="cellPhone" value="${member.cellPhone}" />
		<form:errors path="cellPhone" element="div" cssClass="error" />
	</p>
	<p>
		Email
		<form:input path="email" value="${member.email}" />
		<form:errors path="email" element="div" cssClass="error" />
	</p>
	<p>
		Address
		<form:input path="address" value="${member.address}" />
		<form:errors path="address" element="div" cssClass="error" />
	</p>


	<div class="md-form text-center">
		<button type="submit" class="btn btn-primary" disabled>
			<i class="fa fa-check"></i> Confirm
		</button>
		<a href="list?page=${param.page}" class="btn btn-primary"> <i
			class="fa fa-list"></i> Back-to-list
		</a>
	</div>
</form:form>