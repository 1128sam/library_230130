<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section class="signUp d-flex justify-content-center">
	<div class="sign-up-box">
		<h1 class="mt-5" id="font1">Login</h1>

	<form method="post" action="/user/sign_in" id="signInForm">
		<label for="userId" id="font2" class="subject-text my-2 mt-2">
                      User ID
              </label>
              <input type="text" id="userId" name="userId" class="form-control" placeholder="User ID">

		<label for="password" id="font2" class="subject-text my-2">
                      Password
              </label>
              <input type="password" id="password" name="password" class="form-control" placeholder="Password">

              
              <button type="submit" id="signInBtn" class="btn btn-info w-100 mt-3"><span id="font2">Sign in</span></button>
              </form>
		<section class="d-flex justify-content-between my-2">
			<a href="/user/sign_up_view" id="font2">Don't have an account?</a><br>
			<a href="/user/email_validation_view" id="font2">Forgot Your Password?</a>
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
			alert("please enter your user ID.");
			return false;
		}

		if (password.length < 1) {
			alert("Please enter your password.");
			return false;
		}

		let url = $(this).attr("action");
		let params = $(this).serialize();

		$.post(url, params)   // request
		.done(function(data) {  // response
			if (data.code == 1) { // success
				location.href = "/main/template";
			} else { // fail
				alert(data.errorMessage);
			}
		});
	});
});
</script>