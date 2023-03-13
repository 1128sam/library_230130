<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="d-flex justify-content-center">
	<div class="postBorder mt-5">
		<div class="d-flex">
			<input type="number" id="postId" class="d-none" value="${post.id}">
			<div class="col-10">
				<h1 id="font1">${post.title}</h><br>
				<span id="font2">${postUserName}</span>
			</div>
			<c:if test="${post.userId eq sessUserId}">
				<div class="col-1"><button type="button" id="postDeleteBtn" class="btn btn-danger">Delete</button><a href="/post/update_post_view?postId=${post.id}" id="postUpdateBtn" class="btn btn-secondary mt-1">Update</a></div>
			</c:if>
		</div>
		<div class="d-flex justify-content-center">
			<c:if test="${post.filePath ne null}">
				<img src="${post.filePath}" alt="image" width="400">
			</c:if>
		</div>
		<span class="mt-4 ml-3">${post.content}</span>
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
					location.href = "/post/post_list_view?type=rec&page=1";
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