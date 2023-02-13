<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="signUp d-flex justify-content-center">
	<div class="newPostBox">
		<h4 class="mt-3">추천하기</h4>

			<label for="title" class="subject-text my-2">Title</label>
			<input type="text" id="title" name="title" class="form-control" placeholder="Title" maxlength="128">
			
			<label for="content" class="subject-text my-2">Content</label>
			<textarea id="content" name="content" rows="12" class="w-100" placeholder="Please write the content."></textarea>
			<div id="contentLengthWarn" class="text-info d-none"><small>내용을 입력하세요.</small></div>

			<div class="d-flex justify-content-between">
			<a href="/post/post_list_view?type=rec" type="button" id="deleteBtn" class="btn btn-danger mt-3">삭제</a>
			<button type="button" id="newRecBtn" class="btn btn-info mt-3">추천하기</button>
			</div>
	</div>
</section>

<script>
$(document).ready(function() {
	$('#newRecBtn').on('click', function() {
		let title = $('#title').val().trim();
		if (title == '') {
			alert("Please enter the title.");
			return;
		}
		let content = $('#content').val().trim();
		if (content == '') {
			alert("write something.");
			return;
		}

		$.ajax({
			type:"get",
			url: "/post/add_post",
			data: {"title":title, "content":content, "type":1},
			success: function(data) {
				if (data.code == 1) {
					location.href="/post/post_list_view?type=rec";
				} else {
					alert(data.result);
				}
			},
			error: function(error) {
				alert("failed to insert. please inquire to admins.");
			}
		});
	});
});
</script>