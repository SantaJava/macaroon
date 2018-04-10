<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="text-right">
	(Total Count ${pagination.totalCount} / <a
		href="create?page=${param.page}"><i class="fa fa-user-plus"></i>
		ADD </a>)
</div>

<table class="table table-stripped">
	<thead>
		<tr>
			<th style="width: 60">No</th>
			<th>USER ID</th>
			<th>NAME</th>
			<th>EMAIL</th>
			<th>CELL-PHONE</th>
			<th>REG-DATE</th>
		</tr>
	</thead>
	<tbody>
		<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="todayStr" />

		
		<c:forEach var="member" items="${list}" varStatus="status">
			<fmt:formatDate value="${member.regDate}" pattern="yyyy-MM-dd"
				var="regDate" />
			<tr>
				<td>${pagination.start + status.index}</td>
				
				<td><a href="view/${member.userId}?page=${param.page}">${member.userId}</a> 
				<c:if
						test="${todayStr==regDate}">
						<span class="badge badge-danger"><i class="fa fa-tag"></i>New</span>
					</c:if></td>
				<td>${member.name}</td>
				<td>${member.email}</td>
				<td>${member.cellPhone}</td>
				<td>${regDate}</td>
			</tr>
		</c:forEach>
	</tbody>

</table>

<%@ taglib tagdir="/WEB-INF/tags/util" prefix="iot"%>
<iot:pagination pagination="${pagination}" link="list" />

