<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="todayStr" />

<c:forEach var="image" items="${list}" varStatus="status">
	<fmt:formatDate value="${image.regDate}" pattern="yyyy-MM-dd"
			var="regDate" />
<tr>
	<td style="width: 50px"><a href="image/${image.imageId}"
		data-lightbox="roadtrip"> <img src="thumb/${image.imageId}"
			width="150" alt="${image.title}" class="z-depth-2 rounded" />
	</a></td>
	<td>
		<p>
			<a href="download/${image.imageId}"> <c:if test="${todayStr==regDate}">
				<span class="badge badge-danger"><i class="fa fa-tag"></i>New</span>
			</c:if>
			<i class="fa fa-download"></i>
				${image.title}
			</a>
			(Registration Date : <fmt:formatDate value = "${image.regDate}" ></fmt:formatDate>)
		</p>
	</td>
</tr>
</c:forEach>
