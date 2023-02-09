<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="signUp d-flex justify-content-center">
	<div class="sign-up-box">
		<h1 class="mt-5">Login</h1>

	<form method="post" action="/user/sign_in" id="signInForm">
		<label for="userId" class="subject-text my-2 mt-2">
                      User ID
              </label>
              <input type="text" id="userId" name="userId" class="form-control" placeholder="아이디를 입력하세요">

		<label for="password" class="subject-text my-2">
                      Password
              </label>
              <input type="password" id="password" name="password" class="form-control" placeholder="비밀번호를 입력하세요">

              
              <button type="submit" id="signInBtn" class="btn btn-info w-100 mt-3">Login</button>
              </form>
		<section class="d-flex justify-content-between my-2">
			<a href="/user/sign_up_view">Don't have an account?</a><br>
			<a href="/user/email_validation_view">Forgot Password?</a>
		</section>
	</div>
</section>

<script>
$(document).ready(function() {
	$('#signInForm').on('submit', function(e) {
		e.preventDefault();

		let userId = $('#userId').val().trim();
		let password = $('#password').val();

		if (userId == '') {
			alert("아이디를 입력해주세요");
			return false;
		}
		
		if (password.length < 1) {
			alert("비밀번호를 입력해주세요");
			return false;
		}
		
		let url = $(this).attr("action");
		let params = $(this).serialize();
		console.log(url + " " + params);
		
		$.post(url, params)   // request
		.done(function(data) {  // response
			if (data.code == 1) { // 성공
				alert(data.result);
				location.href = "/main/template";
			} else { // 실패
				alert(data.errorMessage);
			}
		});
	});
});
</script>