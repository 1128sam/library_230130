<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="postBorder d-flex justify-content-center ml-5">
	<div class="w-100 mt-3">
		<h4 class="text-center">Notice</h4>
		<table class="table">
			<thead>
				<tr>
					<th class="col-10">제목</th>
					<th class="text-center col-1">글쓴이</th>
					<th class="text-center col-1">날짜</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="list" items="${list}">
					<tr>
						<td><a href="/post/post_view?postId=${list.id}">${list.title}</a></td>
						<td class="text-center">${list.userId}</td>
						<td class="text-center"><fmt:formatDate value="${list.updatedAt}" pattern="yyyy.MM.dd"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>