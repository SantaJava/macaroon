<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--JSTL-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<div class="jumbotron text-center">
	<h1>BUTTER</h1>
	<p>lightbox / carousel / flickr</p>
	<div class="container text-right">
		<c:if test="${not empty USER}">
			<i>Welcome, ${USER.userId} </i>
		</c:if>
	</div>
</div>
