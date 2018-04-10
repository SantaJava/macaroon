<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:url value="/" var="root" />

<style>
#demo {
	margin: 10px auto;
	width: 80%;
}

#demo img {
	width: 100%;
}
</style>

<div class="container">
	<h1>Gallery</h1>
	<a href="lightbox" class="btn btn-primary btn-sm">lightbox</a>
	<hr>

	<h3>MEXICO _ THE LAND OF NACHOS AND MUCHACHO</h3>
	<br>
	<!-- <img src="images/background.jpg" width=50% />-->
	<br>


	<div id="demo" class="carousel slide" data-ride="carousel">

		<!--Indicators-->
		<ol class="carousel-indicators">
			<c:forEach items="${list}" varStatus="status">
				<li data-target="#demo" data-slide-to="${status.index}"
					<c:if test = "${status.first}">class="active"</c:if>></li>
			</c:forEach>
		</ol>

	
		<!--  The Slideshow -->
		<div class="carousel-inner">

			<c:forEach var="image" items="${list}" varStatus="status">
				<div
					class="carousel-item <c:if test = "${status.first}">active </c:if>">
					<img src="image/${image.imageId}" alt="${image.title}" />
				</div>
			</c:forEach>
		</div>

		<!-- Left and right controls -->
		<a class="carousel-control-prev" href="#demo" data-slide="prev"> <span
			class="carousel-control-prev-icon"></span>
		</a> <a class="carousel-control-next" href="#demo" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>
	</div>
</div>



