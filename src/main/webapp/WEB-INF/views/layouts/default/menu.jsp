<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--JSTL-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<c:url value="/" var="root" />

<!--  <nav class="navbar navbar-expand-lg">
  <a class="navbar-brand" href="${root}">MELISSA.G</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>    
    </ul>
  </div>  
</nav>

-->






<title>Insert title here</title>
<nav class="navbar navbar-expand-md">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="nav-item" href="${root}">HOME</a>

		</div>
		<ul class="nav navbar-nav navbar-right">
			<li><c:if test="${empty USER}">
					<li class="nav-item"><a href="${root}login"> Log-in | </a></li>
					<li class="nav-item"><a href="${root}join">&nbsp;Sign-in |</a></li>
				</c:if><li class="nav-item"><a href="${root}gallery/lightbox">&nbsp;Gallery |</a>
			</li>
				<li class="nav-item"><a href="${root}gallery/flickr">&nbsp;Flickr | </a> </li>
				<c:if test="${not empty USER}">
					<li class="nav-item"><a href="${root}member/profile"> <i
						class="fa fa-user"></i> Profile |
					</a></li>
					<li class="nav-item"><a href="${root}logout"><i
						class="fa fa-sign-in-alt"></i> Log-out  |</a></li>
				</c:if>
				<!--<c:if test = "${USER.grade==0}">-->
				<!--</c:if>-->
				<li class = "nav item">
					<a href= "${root}admin/member/list"><i class = "fa fa-key"></i>
					Admin  |</a>
					</li>
				<li class = "nav item">
					<a href= "${root}board/list">
					&nbsp;List </a>
					</li>
				</ul>
		</div>
</nav>