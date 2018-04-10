<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:url value="/" var="root" />
<link
	href="${root}resources/bower_components/lightbox2/dist/css/lightbox.css"
	rel="stylesheet">
<script
	src="${root}resources/bower_components/lightbox2/dist/js/lightbox.js"></script>

<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="todayStr" />


<div class="row">
	<c:forEach var="image" items="${list}" varStatus="status">

		<fmt:formatDate value="${image.regDate}" pattern="yyyy-MM-dd"
			var="regDate" />
		<div class="col-md-4 col-sm-4 col-lg-4">
	
				<a href="image/${image.imageId}" data-lightbox="roadtrip"> 
				<img
					src="thumb/${image.imageId}" alt="${image.title}" width="200"
					alt="${image.title}" class=" rounded hoverable" />
				</a>
	
			
			<p>
				<a href="download/${image.imageId}"> <i class="fa fa-download"></i>
					${image.title}
				</a>
				<c:if test="${todayStr==regDate}">
					<span class="badge badge-danger"><i class="fa fa-tag"></i>New</span>
				</c:if>
			</p>
		</div>
	</c:forEach>
</div>