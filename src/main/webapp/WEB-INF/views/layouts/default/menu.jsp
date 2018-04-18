<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--JSTL-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<c:url value="/" var="root" />





<!-- Brand -->
	<a class="navbar-brand" href="${root}">HOME</a>

<!-- Toggler/collapsibe Button -->
<button class="navbar-toggler" type="button" data-toggle="collapse"
	data-target="#collapsibleNavbar">
	<span class="navbar-toggler-icon"></span>
</button>

<!-- Navbar links -->
<div class="collapse navbar-collapse" id="collapsibleNavbar">
	<ul class="navbar-nav ml-auto">
		<li><c:if test="${empty USER}">
				<li class="nav-link"><a href="${root}login">Log-in</a></li>
				<li class="nav-link"><a href="${root}join">&nbsp;Sign-in</a></li>
			</c:if>
		<li class="nav-link"><a href="${root}gallery/lightbox">&nbsp;Gallery
				</a></li>
		<li class="nav-link"><a href="${root}gallery/flickr">Flickr
				</a></li>
		<c:if test="${not empty USER}">
			<li class="nav-link"><a href="${root}member/profile">  Profile 
			</a></li>
			<li class="nav-link"><a href="${root}logout"><i
					class="fa fa-sign-in-alt"></i>&nbsp;Log-out </a></li>
		</c:if>
		<!--<c:if test = "${USER.grade==0}">-->
		<!--</c:if>-->
		<li class="nav-link"><a href="${root}admin/member/list"><i
				class="fa fa-key"></i> Admin </a></li>
		<li class="nav-link"><a href="${root}board/list">List&nbsp;
		</a></li>

	</ul>


</div>