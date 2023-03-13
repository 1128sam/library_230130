<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<section class="signUp d-flex justify-content-center">
			<div class="sign-up-box">
				<h1 class="mt-5">Password Assistance</h1>

				<label for="email" class="subject-text my-2 mt-2">
                        Email
                </label>
                <input type="text" id="email" name="email" class="form-control" placeholder="email address">

                <button type="button" id="continueBtn" class="btn btn-info w-100 mt-3">Continue</button>
				<div class="d-flex justify-content-end my-2">
					<a href="/user/sign_up_view">Create a new Account</a><br>
				</div>
			</div>
		</section>

		<footer class="bgTemp">
			<jsp:include page="../include/footer.jsp" />
		</footer>

<script>
$(document).ready(function() {
	$('#continueBtn').on('click', function(e) {
		e.preventDefault();
		let email = $('#email').val().trim();

		if (email == '') {
			alert("Please enter your email address.");
			return;
		}
		
		$.ajax({
			url: "/user/email_valid",
			data: {"email" : email},
			success: function(data) {
				if (data.code == 1) {
					location.href = "/user/account_restore_view";
				} else {
					alert("There is no account signed up with this email address. Please retry.");
				}
			},
			error: function(error) {
				alert("failed to check your email. please inquire to admin.");
			}
		});
	});
});
</script>