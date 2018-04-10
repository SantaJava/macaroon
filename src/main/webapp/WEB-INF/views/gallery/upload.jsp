<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div style="width: 70%" class="mt-4 mb-3 ml-auto mr-auto">
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

	<h1>Image Upload</h1>
	<form:form commandName="image" enctype="multipart/form-data">
		<div class="md-form">
			<label for="title">Title </label>
			<form:input path="title" required="required" />
			<form:errors path="title" />
		</div>
		<div>
			<label for="description">Description</label>
			<form:textarea path="description" rows="4" />
		</div>
		<div>
			<label>Image Files</label>
		</div>
		<div>
			<input type="file" name="imageFiles" multiple="multiple"
				accept="image/*" required>
		</div>
		<div class="text-center">
			<button type="submit" class="btn btn-primary btn-sm">
				<i class="fa fa-check-circle mr-2"></i> Confirm
			</button>
			<a href="javascript:history.back()" class="btn btn-primary btn-md">Go Back</a>
		</div>
	</form:form>
</div>