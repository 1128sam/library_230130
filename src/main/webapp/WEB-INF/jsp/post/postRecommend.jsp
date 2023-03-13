<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="postBorder d-flex justify-content-center ml-5">
	<div class="w-100 mt-3">
		<h4 class="text-center" id="font1">Recommend</h4>
		<table class="table">
			<thead>
				<tr id="font1">
					<th class="col-10">Title</th>
					<th class="text-center col-1">Writer</th>
					<th class="text-center col-1">Date</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="list" items="${list}" varStatus="vs">
					<tr id="font2">
						<td><a href="/post/post_view?postId=${list.id}">${list.title}</a></td>
						<td class="text-center">${userNameList.get(vs.index)}</td>
						<td class="text-center"><fmt:formatDate value="${list.updatedAt}" pattern="yyyy.MM.dd"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="d-flex justify-content-center">
			<div class="d-flex col-2 justify-content-between">
				<c:if test="${page != 1}">
					<a href="/post/post_list_view?type=rec&page=${page - 1}"><<</a>
				</c:if>
				<c:if test="${postMax eq null}">
					<a href="/post/post_list_view?type=rec&page=${page + 1}">>></a>
				</c:if>
			</div>
		</div>
		<c:if test="${userId ne null}">
			<div class="d-flex justify-content-end mt-4 pb-2"><input type="button" id="newRecBtn" class="btn btn-info" value="Recommend"></div>
		</c:if>
	</div>
</div>

<script>
$(document).ready(function() {
	$('#newRecBtn').on('click', function() {
		location.href = "/post/new_post_view?type=1";
	});
});
</script>