<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account Restore aka Q&A</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="/static/css/style.css">
</head>
<body>
<div class="container">
<input type="hidden" id="legitAnswer" value="${answer}">
<input type="hidden" id="email" value="${email}">
	<div id="wrap" class="bg-light">
		<header class="d-flex bgTemp">
			<jsp:include page="../include/header.jsp" />
		</header>

		<div id="menu1" class="bgTemp d-flex justify-content-center">
			<jsp:include page="../include/nav.jsp" />
		</div>

		<section class="signUp d-flex justify-content-center">
			<div class="sign-up-box">
				<h1 class="mt-5">Account Restore</h1>

				<label for="email" class="subject-text my-2 mt-2">
                        ${question}
                </label>
                <input type="text" id="answer" name="answer" class="form-control" placeholder="Your answer">

                <button id="confirmBtn" class="btn btn-info w-100 mt-3">Confirm</button>
				<div id="suggestNewAccount" class="d-flex justify-content-end my-2 d-none">
					<a href="/user/sign_up_view">Create a new account</a><br>
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
	$('#confirmBtn').on('click', function(e) {
		e.preventDefault();

		let answer = $('#answer').val().trim();
		let legitAnswer = $('#legitAnswer').val().trim();
		let email = $('#email').val().trim();

		if (answer == '') {
			alert("Please enter your answer.");
			return;
		}
		if (answer != legitAnswer) {
			$('#suggestNewAccount').removeClass("d-none");
			return;
		}

		$.ajax({
			url: "/user/profile_update_view1",
			data: {"email" : email},
			success: function(data) {
				if (data.code == 1) {
					location.href = "/user/profile_update_view";
				} else {
					alert("failed. Please retry.");
				}
			},
			error: function(error) {
				alert("failed to check userId validation. please inquire to admins.");
			}
		});
	});
});
</script>
</body>
</html>