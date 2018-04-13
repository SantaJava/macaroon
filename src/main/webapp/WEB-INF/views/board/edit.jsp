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

		$('.attachment').click(function(e) {
			e.preventDefault();
			var attachmentId = $(this).data('target')
			console.log(attachmentId);

			//form 을 ajox로 post할 때 데이터 추출 메서드 serialize.
			var data = $('#board').serialize();
			//data값을 ajox 메서드의 data필드에 지정.
			console.log(data);
			var parent = $(this).parent();
			
			
			$.ajax({
				url:'../delete_attachment/'+attachmentId,
				type:'delete',
				success : function(result){ 
					if(result){
						console.log(this); 
						parent.remove();
					}else{
						alert('Attached file delete has failed.');
					}
				}})			
		});
	});
</script>
<h2 class="mt-5 mb-4">Edit Document</h2>
<form:form commandName="board" enctype="multipart/form-data">
	<form:hidden path="boardId" />
	<form:hidden path="writer" />
	<div class="md-form">
		<label>Title</label>
		<form:input path="title" required="required" />
		<form:errors path="title" />
	</div>
	<div class="mb-3">
		<label>Writer : ${board.writer}</label>
	</div>
	<div class="md-form">
		<label>password</label>
		<form:password path="password" required="required" />
		<form:errors />
	</div>
	<div class="row">
		<div class="col-md-2">Attached File</div>
		<div class="col-md-10">
			<c:forEach var="file" items="${board.attachments}">
				<div>
					<i class="fa fa-file"></i> ${file.fileName} <a href="#"
						data-target="${file.attachmentId}" class="attachment"> <i
						class="fa fa-trash"></i>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
	<div>
		<label>Attach File</label> <input type="file" name="files"
			multiple="multiple">
	</div>
	<form:textarea path="content" />
	<div class="text-center mt-3">
		<button type="submit" class="btn btn-primary btn-md">
			<i class="fa fa-check mr-2"></i> Confirm
		</button>
		<a href="javascript:history.back()" class="btn btn-primary btn-md">
			<i class="fa fa-undo mr-2"></i> Go Back
		</a>
	</div>
</form:form>