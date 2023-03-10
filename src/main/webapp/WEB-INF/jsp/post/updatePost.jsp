<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="signUp d-flex justify-content-center">
	<div class="newPostBox">
		<h4 class="mt-3" id="font1">Modify</h4>

		<form id="updateForm" method="get" action="/post/update_post">
			<input type="number" id="postId" class="d-none" name="postId" value="${post.id}">
			<label for="title" id="font2" class="subject-text my-2">Title</label>
			<input type="text" id="title" name="title" class="form-control" placeholder="Title" maxlength="128" value="${post.title}">
			
			<label for="content" id="font2" class="subject-text my-2">Content</label>
			<textarea id="content" name="content" rows="12" class="w-100" placeholder="Please write the content.">${post.content}</textarea>
			<div id="contentLengthWarn" class="text-info d-none"><small>내용을 입력하세요.</small></div>

			<div class="d-flex justify-content-between">
			<a href="/post/post_list_view?type=rec" type="button" id="deleteBtn" class="btn btn-danger mt-3"><span id="font2">Delete</span></a>
			<button type="submit" id="updateRecBtn" class="btn btn-info mt-3"><span id="font2">Modify</span></button>
			</div>
		</form>
	</div>
</section>

<script>
$(document).ready(function() {
	$('#updateForm').submit(function(e) {
		e.preventDefault();

		let postId = $('#postId').val();
		let title = $('#title').val().trim();
		if (title == '') {
			alert("Please enter the title.");
			return false;
		}
		let content = $('#content').val().trim();
		if (content == '') {
			alert("write something.");
			return false;
		}

		let url = $(this).attr("action");
		let params = $(this).serialize();
		console.log(params);

		$.post(url, params)
		.done(function(data) {
			if (data.code == 1) {
				alert(data.result);
				if (data.type == "0") {
					location.href="/post/post_list_view?type=info&page=1";
				} else if (data.type == "1") {
					location.href="/post/post_list_view?type=rec&page=1";
				}
			} else {
				alert(data.result);
			}
		});
	});
});
</script>