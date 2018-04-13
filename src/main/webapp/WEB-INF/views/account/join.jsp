<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

<body>
	<h2>JOIN THE BUTTER</h2>
	<form:form commandName="member">
		<p>
			User Id
			<form:input path="userId" value="${member.userId}" />
			<form:errors path="userId" element="div" cssClass="error" />
		</p>
		<button class="btn btn-primary btn-sm" id="check-btn">Check
			User Id</button>
		<p>
			<span id="check-message"></span> Name
			<form:input path="name" value="${member.name}" />
			<form:errors path="name" element="div" cssClass="error" />
		</p>
		<p>
			Password
			<form:password path="password" value="" />
			<form:errors path="password" element="div" cssClass="error" />
		</p>
		<p>
			Cell Phone Number
			<form:input path="cellPhone" value="${member.cellPhone}" />
			<form:errors path="cellPhone" element="div" cssClass="error" />
		</p>
		<p>
			email
			<form:input path="email" value="${member.email}" />
			<form:errors path="email" element="div" cssClass="error" />
		</p>
		<p>
			Address
			<form:input path="address" value="${member.address}" />
			<form:errors path="address" element="div" cssClass="error" />
		</p>
		<p>
			Picture
			<form:input path="profilePic" value="${member.profilePic}" />
		</p>
		<input type="submit" value="Submit" class="btn btn-primary btn-md">
	</form:form>
</body>
</html>