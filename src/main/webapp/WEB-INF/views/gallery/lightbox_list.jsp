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
				width="150" alt="${image.title}" class=" rounded hoverable" />
		</a></td>
		<td>
			<div class="row d-inline bg-success">
			<div class = "col-md-4 col-lg-4">
				<a href="download/${image.imageId}"> <c:if
						test="${todayStr==regDate}">
						<span class="badge badge-danger"><i class="fa fa-tag"></i>New</span>
					</c:if> <i class="fa fa-download"></i></a>
					</div>
					<div class="col-md-8 col-lg-8">${image.title} (Registration
				Date :
				<fmt:formatDate value="${image.regDate}"></fmt:formatDate>
				) <br>${image.description} <br>
			</div>
			</div>

		</td>
	</tr>
</c:forEach>
