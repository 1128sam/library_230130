<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="d-flex justify-content-center">
	<div class="postBorder mt-5">
		<div class="d-flex"><h2 class="col-10">${post.title}</h2><span class="col-2 d-flex align-items-end">${post.userId}</span></div>
		<div class="mt-4 ml-3">${post.content}</div>
	<c:if test="${post.type == 1}">
		<div class="commentsBorder mt-5">
			<div class="commentBox my-4">
				<span class="m-2">userId1</span><br>
				<span class="m-2">fdasfdsafdas...</span>
			</div>
			<div class="commentBox my-4">
				<span class="m-2">userId3</span><br>
				<span class="m-2">fdasfdsafdas...</span>
			</div>
			<div class="commentBox my-4">
				<span class="m-2">userId2</span><br>
				<span class="m-2">fdasfdsafdas...</span>
			</div>
		</div>
		<c:if test="${userId ne null}">
		<textarea id="newComment" name="newComment" rows="3" cols="120"></textarea>
		<button type="button" id="commentUploadBtn" class="btn btn-info mb-4">게시하기</button>
		</c:if>
	</c:if>
	</div>
</div>

<script>
$(document).ready(function() {
	$('#commentUploadBtn').on('click', function() {
		
	});
});
</script>