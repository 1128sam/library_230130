<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="d-flex justify-content-center">
	<div class="postBorder mt-5">
		<div class="d-flex">
			<input type="number" id="postId" class="d-none" value="${post.id}">
			<h2 class="col-10">${post.title}</h2>
			<span class="col-1">${postUserName}</span>
			<c:if test="${post.userId eq sessUserId}">
				<div class="col-1"><button type="button" id="postDeleteBtn" class="btn btn-danger">Delete</button><a href="/post/update_post_view?postId=${post.id}" id="postUpdateBtn" class="btn btn-secondary mt-1">Update</a></div>
			</c:if>
		</div>
		<div class="d-flex justify-content-center">
			<img src="${post.filePath}" alt="image" width="400">
		</div>
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
	
	$('#postDeleteBtn').on('click', function() {
		confirm("Are you sure you want to delete this post?");
		let postId = $('#postId').val();
		alert(postId);

		$.ajax({
			type:"delete",
			url: "/post/delete_post",
			data: {"postId":postId},
			success: function(data) {
				if (data.code == 1) {
					alert(data.result);
					location.href = "/post/post_list_view?type=rec";
				} else {
					alert(data.result);
				}
			},
			error: function(error) {
				alert("failed to delete.");
			}
		});
	});
});
</script>