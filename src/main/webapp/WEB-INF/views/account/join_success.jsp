<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>join_successPage</title>

<div class = "mt-4 md-4" >
	<h1>Hello, ${member.userId}</h1>
	<h2> You have now entered the <strong class = "yellow" style = "font-weight:bold;">Butter Pool.</p></strong> </h2>
</div>

<c:url value = "/login" var = "login"/>
<a href = "${login}" class = "btn btn-primary btn-md">
	Log-in
</a>
