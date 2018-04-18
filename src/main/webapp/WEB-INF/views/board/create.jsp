<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/resources/bower_components/tinymce/tinymce.min.js"
	var="tinymce" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script src="${tinymce}"></script>
<script>
	$(function() {
		tinymce.init({
			selector : 'textarea',
			height : "300"
		});
	})
</script>
<h2 class="mt-5 mb-4">Write Article</h2>
<form:form commandName="board" enctype="multipart/form-data">

	<div class="md-form">
		<label>Title</label>
		<form:input path="title" required="required" />
		<form:errors path="title" />
	</div>
	<div class="mb-3">
		<label>Writer : ${USER.userId}</label> <input type="hidden" name="writer"
			value="${USER.userId}" />
	</div>
	<div class="md-form">
	</div>
	<div>
		<label>Attach Files</label> <input type="file" name="files" multiple="multiple" value ="Choose File">
	</div>
	<form:textarea path="content"/>
	<div class="text-center mt-3">
		<button type="submit" class="btn btn-primary btn-md">
			<i class="fa fa-undo mr-2"></i> Confirm
		</button>
		<a href="javascript:history.back()" class="btn btn-primary btn-md">
			<i class="fa fa-undo mr-2"></i> Go Back
		</a>
	</div>
</form:form>