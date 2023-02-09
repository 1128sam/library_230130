<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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