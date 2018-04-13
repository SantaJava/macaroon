<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h2 class="mt-5 mb-4">Discussions</h2>
<div class="text-right">
	(total : ${pagination.totalCount} / <c:if test ="${not empty USER}"><a href="create"></c:if><i
		class="fas fa-pencil-alt"></i>write</a>)
</div>
<table class="table table-stripped">
	<thead>
		<tr>
			<th style="width: 60px">No</th>
			<th>title</th>
			<th style="width: 100px">writer</th>
			<th style="width: 90px">count</th>
			<th style="width: 120px">reg-date</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="board" items="${list}" varStatus="status">
			<tr>
				<td>${board.boardId}</td>
				<td><a href="view/${board.boardId}">${board.title}</a></td>
				<td>${board.writer}</td>
				<td>${board.readCnt}</td>
				<td><fmt:formatDate value="${board.regDate}"
						pattern="yyyy-MM-dd" /></td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<%@ taglib tagdir="/WEB-INF/tags/util" prefix="iot"%>
<iot:pagination pagination="${pagination}" link="list" />
