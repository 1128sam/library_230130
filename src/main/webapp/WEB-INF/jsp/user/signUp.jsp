<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

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
				<h1 class="d-flex justify-content-center mt-3">회원가입</h1>

				<form id="signUpForm" method="post" action="/user/sign_up">
					<label for="name" class="subject-text my-2">
	                        이름
	                </label>
	                <input type="text" id="name" name="name" class="form-control" placeholder="이름을 입력하세요" maxlength="9">
	
					<label for="userId" class="subject-text my-2">
	                        아이디
	                </label>
	                <input type="text" id="userId" name="userId" class="form-control" placeholder="아이디를 입력하세요" maxlength="16">
	                <div id="idLengthWarn" class="text-info d-none"><small>아이디를 4자 이상 입력하세요.</small></div>
	                <div id="idValCheckWarn" class="text-info d-none"><small>사용중인 아이디입니다.</small></div>
	                <div id="idValCheckPermit" class="text-info d-none"><small>사용 가능한 아이디입니다.</small></div>
	
					<label for="password" class="subject-text my-2">
	                        비밀번호
	                </label>
	                <input type="password" id="password" name="password" class="form-control" placeholder="비밀번호를 입력하세요">

					<label for="passwordCheck" class="subject-text my-2">
	                        비밀번호 확인
	                </label>
	                <input type="password" id="passwordCheck" name="passwordCheck" class="form-control" placeholder="비밀번호를 다시 입력하세요">
	                <div id="passwordValidWarn" class="text-info d-none"><small>비밀번호가 일치하지 않습니다.</small></div>

					<label for="email" class="subject-text my-2">
	                        이메일
	                </label>
	                <input type="text" id="email" name="email" class="form-control" placeholder="이메일 주소를 입력하세요">
	                <div id="emailValidMessage" class="text-info d-none"><small>정확한 이메일 주소를 입력해주세요.</small></div>

	                <button type="submit" id="signUpBtn" class="btn btn-info w-100 mt-3">가입하기</button>
                </form>
				<div class="d-flex justify-content-end my-2">
					<a href="/user/sign_in_view">로그인하기</a>
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
	$('#email').on('change', function() {
		alert("something");
	});
	$('#userId').on('change', function() {
		alert("fdsfs");
		#('idLengthWarn').addClass("d-none");
		#('idValCheckWarn').addClass("d-none");
		#('idValCheckPermit').addClass("d-none");

		var userId = $('#userId').val().trim();
		if (userId.length < 4) {
			$('#idLengthWarn').removeClass("d-none");
		}

		$.ajax({
			url: "/user/userId_validation",
			data: {"userId" : userId},
			success: function(data) {
				if (data.result == true) {
					#('idValCheckWarn').removeClass("d-none");
				} else {
					#('idValCheckPermit').removeClass("d-none");
				}
			},
			error: function(error) {
				alert("failed to check userId validation. please inquire to admins.");
			}
		});
	});

	$('#signUpForm').on('click', function() {
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
		
		/* if ($('#idCheckOk').hasClass('d-none')) {
			alert("아이디 중복확인을 다시 해주세요.");
			return false;
		} */

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
</body>
</html>