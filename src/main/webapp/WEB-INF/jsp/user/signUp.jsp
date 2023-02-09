<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section class="signUp d-flex justify-content-center">
	<div class="sign-up-box">
		<h1 class="d-flex justify-content-center mt-3">회원가입</h1>

		<form id="signUpForm" method="post" action="/user/sign_up">
			<label for="name" class="subject-text my-2">Your Name</label>
			<input type="text" id="name" name="name" class="form-control" placeholder="First and last name" maxlength="9">
			
			<label for="userId" class="subject-text my-2"> 아이디 </label>
			<input type="text" id="userId" name="userId" class="form-control" placeholder="at least 6 characters" maxlength="16">
			<div id="idLengthWarn" class="text-info d-none">
				<small>아이디를 4자 이상 입력하세요.</small>
			</div>
			<div id="idValCheckWarn" class="text-info d-none">
				<small>사용중인 아이디입니다.</small>
			</div>
			<div id="idValCheckPermit" class="text-info d-none">
				<small>사용 가능한 아이디입니다.</small>
			</div>

			<label for="password" class="subject-text my-2">Password</label> <input
				type="password" id="password" name="password"
				class="form-control" placeholder="비밀번호를 입력하세요"> <label
				for="passwordCheck" class="subject-text my-2">Re-enter password</label> <input
				type="password" id="passwordCheck" name="passwordCheck"
				class="form-control" placeholder="비밀번호를 다시 입력하세요">
			<div id="passwordValidWarn" class="text-info d-none">
				<small>비밀번호가 일치하지 않습니다.</small>
			</div>

			<label for="email" class="subject-text my-2"> 이메일 </label> <input
				type="email" id="email" name="email" class="form-control"
				placeholder="이메일 주소를 입력하세요">
			<div id="emailValidMessage" class="text-info d-none">
				<small>정확한 이메일 주소를 입력해주세요.</small>
			</div>

			<button type="button" id="signUpBtn"
				class="btn btn-info w-100 mt-3">가입하기</button>
		</form>
		<div class="d-flex justify-content-end my-2">
			<a href="/user/sign_in_view">로그인하기</a>
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
		
		if (name.length < 1) {
			alert("이름을 입력해주세요.");
			return;
		}
		if (userId.length < 1) {
			alert("아이디를 입력해주세요.");
			return;
		}
		if (password.length < 1 || passwordCheck.length < 1) {
			alert("비밀번호를 입력해주세요.");
			return;
		} else if (password != passwordCheck) {
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}
		if (email.length < 1) {
			alert("이메일 주소를 입력해주세요.");
			return;
		}
		
		if ($('#idLengthWarn').hasClass('d-none') == false) {
			alert("Please confirm your id validation.");
			return;
		} else if ($('#idValCheckPermit').hasClass('d-none')) {
			alert("your userid is currently being used.");
			return;
		}

		let url = $(this).attr("action");
		let params = $(this).serialize();
		console.log(params);

		$.post(url, params)
		.done(function(data) {
			if (data.result == "success") {
				alert("가입을 환영합니다. 로그인해주세요.");				
				location.href="/user/sign_in_view";
			} else {
				alert("가입에 실패했습니다. 다시 시도해주세요.");
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