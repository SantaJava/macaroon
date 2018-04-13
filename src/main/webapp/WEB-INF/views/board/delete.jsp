<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:url value="/resources/bower_components/tinymce/tinymce.min.js"
	var="tinymce" />

<script src="${tinymce}"></script>
<script>
	$(function() {
		tinymce.init({
			selector : 'textarea',
			height : "300"
		});
	})
</script>
<h3 class="mt-5 mb-4">Do you want to delete this document?</h3>
<form:form commandName="board">
	<form:hidden path="boardId" />
	<form:hidden path="writer" />
	<form:hidden path="title" />
	<form:errors path="title" />

	<div class="md-form">
		Title : ${board.title}
	</div>


<!-- 	<div class="md-form">
		<label>Title</label>
		<form:input path="title" required="required" />
		<form:errors path="title" />
	</div>
	<div class="mb-3">
		<label>Writer : ${board.writer}</label>
	</div>
-->


	<div class="md-form">
		<label>Please Type in your Password</label>
		<form:password path="password" required="required" />
		<form:errors />
	</div>

	<div class="row">
		<div class="col-md-2">Attached File</div>
		<div class="col-md-10">
			<c:forEach var="file" items="${board.attachments}">
				<div>
					<i class="fa fa-file"></i> ${file.fileName} <a href="#"
						data-target="${file.attachmentId}"> </a>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="col-md-2">Content</div>
	<form:textarea path="content" />
	<div class="text-center mt-3">
		<button type="submit" class="btn btn-primary btn-md">
			<i class="fa fa-check mr-2"></i> YES
		</button>
		<a href="javascript:history.back()" class="btn btn-primary btn-md">
			<i class="fa fa-undo mr-2"></i> NO
		</a>
	</div>
</form:form>