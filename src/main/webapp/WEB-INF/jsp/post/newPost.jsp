<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="signUp d-flex justify-content-center">
	<div class="newPostBox bg-warning">
		<h4 class="mt-3">추천하기</h4>

		<form id="signUpForm" method="post" action="/user/sign_up">
			<label for="title" class="subject-text my-2">Title</label>
			<input type="text" id="title" name="title" class="form-control" placeholder="Title" maxlength="128">
			
			<label for="content" class="subject-text my-2">Content</label>
			<textarea id="content" name="content" rows="12" class="w-100" placeholder="Please write the content."></textarea>
			<div id="contentLengthWarn" class="text-info d-none"><small>내용을 입력하세요.</small></div>

			<div class="d-flex justify-content-end">
			<button type="submit" id="newRecBtn" class="btn btn-info mt-3">추천하기</button>
			</div>
		</form>
	</div>
</section>