<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign In</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="/static/css/style.css">
</head>
<body>
<div class="container">
	<div id="wrap" class="bg-light">
		<header class="d-flex bgTemp">
			<jsp:include page="../include/header.jsp" />
		</header>

		<div id="menu1" class="bgTemp d-flex justify-content-center">
			<jsp:include page="../include/nav.jsp" />
		</div>

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
				<div class="d-flex justify-content-end my-2">
					<a href="/user/sign_up_view">Don't have an account?</a>
				</div>
			</div>
		</section>

		<footer class="bgTemp">
			<jsp:include page="../include/footer.jsp" />
		</footer>
	</div>
</div>


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
</body>
</html>