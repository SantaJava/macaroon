<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ attribute name="pagination" required="true"
	type="edu.iot.butter.model.Pagination"%>
<%@ attribute name="link" required="true" type="String"%>
<%@ attribute name="params" required="false" type="String"%>

<!-- 여기 전달된 link로 list를 바꿔줘서 그때그때 마다 페이지네이션을 쓸 수 있도록 한다. -->

<div class="text-center mt-4 mb-4">
	<c:if test="${pagination.currentBlock > 1}">
		<a href="${link}?page=1${params}">FIRST</a>
		<a href="${link}?page=${pagination.prevBlockPage}${params}">◀</a>
	</c:if>

	<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}"
		var="i">
		<c:if test="${i == pagination.page}">
${i}
</c:if>
		<c:if test="${i != pagination.page}">
			<a href="${link}?page=${i}${params}">${i}</a>
		</c:if>
	</c:forEach>
	<c:if test="${pagination.currentBlock < pagination.totalBlock}">
		<a href="${link}?page=${pagination.nextBlockPage}${params}">▶</a>
		<a href="${link}?page=${pagination.totalPage}${params}">LAST</a>
	</c:if>
</div>