<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:url value="/" var="root" />
<link
	href="${root}resources/bower_components/lightbox2/dist/css/lightbox.css"
	rel="stylesheet">
<script src="${root}resources/bower_components/lightbox2/dist/js/lightbox.js"></script>



<h1>Gallery</h1>
<a href="carousel" class="btn btn-primary btn-sm">carousel</a>

<div class="text-right">
	(Total Count ${pagination.totalCount} / <a
		href="upload"><i class="fa fa-plus"></i>
		Upload </a>)
</div>
<hr>

<div class = "text-right mb-2">
	list Setting :
	<a href = "lightbox?page=${param.page}&mode=tile"><i class = "fa fa-th"></i>tile / </a>
	<a href = "lightbox?page=${param.page}&mode=list"><i class = "fa fa-list"></i>list</a>
</div>

<c:if test = "${param.mode!='list'}"> <!-- 디폴트가 타일형. -->
	<jsp:include page="lightbox_tile.jsp" />
</c:if>
<c:if test = "${param.mode=='list'}">
	<jsp:include page="lightbox_list.jsp" />
</c:if>

<%@ taglib tagdir="/WEB-INF/tags/util" prefix="iot"%>

<iot:pagination pagination="${pagination}" params="&mode=${param.mode}" link = "" />


