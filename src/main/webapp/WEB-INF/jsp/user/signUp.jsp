<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section class="signUp d-flex justify-content-center">
	<div class="sign-up-box">
		<h1 class="d-flex justify-content-center mt-3">Sign Up</h1>

		<form id="signUpForm" method="post" action="/user/sign_up">
			<label for="name" class="subject-text my-2">Your Name</label>
			<input type="text" id="name" name="name" class="form-control" placeholder="First and last name" maxlength="9">
			
			<label for="userId" class="subject-text my-2">User ID</label>
			<input type="text" id="userId" name="userId" class="form-control" placeholder="at least 6 characters" maxlength="16">
			<div id="idLengthWarn" class="text-info d-none">
				<small>User Id should be longer than 4 characters.</small>
			</div>
			<div id="idValCheckWarn" class="text-info d-none">
				<small class="text-danger">In use.</small>
			</div>
			<div id="idValCheckPermit" class="text-info d-none">
				<small>This user ID is available.</small>
			</div>

			<label for="password" class="subject-text my-2">Password</label> <input
				type="password" id="password" name="password"
				class="form-control" placeholder="Enter your Password"> <label
				for="passwordCheck" class="subject-text my-2">Re-enter password</label> <input
				type="password" id="passwordCheck" name="passwordCheck"
				class="form-control">
			<div id="passwordValidWarn" class="text-danger d-none">
				<small>Password doesn't match.</small>
			</div>

			<label for="email" class="subject-text my-2">Email</label> <input
				type="email" id="email" name="email" class="form-control"
				placeholder="Enter your email address.">
			<div id="emailValidMessage" class="text-danger d-none">
				<small>Enter a valid email address.</small>
			</div>

			<label for="selfVerQue" class="subject-text my-2">Identification Question</label>
						<select id="selfVerQue" name="selfVerQue" class="form-control mb-1">
						  <option value="selectX">-- OPTIONS --</option>
						  <option value="que1">What is your favorite Movie?</option>
						  <option value="que2">What is your father's name?</option>
						  <option value="que3">Who was your childhood hero?</option>
						  <%-- <option value="audi" <c:if test="${question eq 'audi'}">selected</c:if>>Audi</option> --%>
						</select>
						<input type="text" id="selfVerAns" name="selfVerAns" class="form-control" placeholder="Answer the Question" maxlength="256" value="${answer}">
			<div id="emailValidMessage" class="text-danger d-none">
				<small>Enter a valid email address.</small>
			</div>

			<button type="submit" id="signUpBtn"
				class="btn btn-info w-100 mt-3">Sign in</button>
		</form>
		<div class="d-flex justify-content-end my-2">
			<a href="/user/sign_in_view">Log in</a>
		</div>
	</div>
</section>

<script>
$(document).ready(function() {
	$('#userId').on('change', function(e) {
		e.preventDefault();
		$('#idLengthWarn').addClass("d-none");
		$('#idValCheckWarn').addClass("d-none");
		$('#idValCheckPermit').addClass("d-none");

		var userId = $('#userId').val().trim();
		if (userId.length < 4) {
			$('#idLengthWarn').removeClass("d-none");
			return;
		}

		$.ajax({
			url: "/user/userId_validation",
			data: {"userId" : userId},
			success: function(data) {
				if (data.result == "taken") {
					$('#idValCheckWarn').removeClass("d-none");
				} else {
					$('#idValCheckPermit').removeClass("d-none");
				}
			},
			error: function(error) {
				alert("failed to check userId validation. please inquire to admins.");
			}
		});
	});

	$('#signUpForm').on('submit', function(e) {
		e.preventDefault();

		var name = $('#name').val().trim();
		var userId = $('#userId').val().trim();
		var password = $('#password').val();
		var passwordCheck = $('#passwordCheck').val();
		var email = $('#email').val().trim();
		var selfVerQue = $('#selfVerQue').val();
		var selfVerAns = $('#selfVerAns').val().trim();
		
		if (name.length < 1) {
			alert("Enter your name.");
			return;
		}
		if (userId.length < 1) {
			alert("Enter your User ID.");
			return;
		}
		if (password.length < 1 || passwordCheck.length < 1) {
			alert("Enter your password.");
			return;
		} else if (password != passwordCheck) {
			alert("Your password doesn't match.");
			return;
		}
		if (email.length < 1) {
			alert("Please enter your email address.");
			return;
		}
		if (selfVerQue == "selectX") {
			alert("Please choose an Identification question.");
			return;
		}
		if (selfVerAns.length < 1) {
			alert("Please enter your answer to Identification Question.");
			return;
		}
		
		if ($('#idLengthWarn').hasClass('d-none') == false) {
			alert("Please confirm your ID validation.");
			return;
		} else if ($('#idValCheckPermit').hasClass('d-none')) {
			alert("your user ID is currently being used.");
			return;
		}

		let url = $(this).attr("action");
		let params = $(this).serialize();
		console.log(params);

		$.post(url, params)
		.done(function(data) {
			if (data.result == "success") {
				alert("Successfully signed up. Please log in.");				
				location.href="/user/sign_in_view";
			} else {
				alert("Failed to sign up. Please retry.");
			}
		});
	});
	
	$('#passwordCheck').on('change', function() {
		var password = $('#password').val();
		var passwordCheck = $('#passwordCheck').val();
		if (password != passwordCheck) {
			$('#passwordValidWarn').removeClass("d-none");
			return;
		} else {
			$('#passwordValidWarn').addClass("d-none");
		}
	});
});
</script>