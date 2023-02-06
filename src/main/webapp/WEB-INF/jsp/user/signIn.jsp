<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign In</title>
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
				<h1 class="mt-5">로그인</h1>

			<form method="post" action="/user/sign_in" id="signInForm">
				<label for="userId" class="subject-text my-2 mt-2">
                        아이디
                </label>
                <input type="text" id="userId" name="userId" class="form-control" placeholder="아이디를 입력하세요">

				<label for="password" class="subject-text my-2">
                        비밀번호
                </label>
                <input type="password" id="password" name="password" class="form-control" placeholder="비밀번호를 입력하세요">

                
                <button type="submit" id="signInBtn" class="btn btn-info w-100 mt-3">로그인</button>
                </form>
				<div class="d-flex justify-content-end my-2">
					<a href="/user/sign_up_view">회원가입하기</a>
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
	$('#signInForm').on('submit', function() {
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
		alert(userId + " " + password);
		
		let url = $(this).attr('action');
		let params = $(this).serialize();
		console.log(url + " " + params);
		
		$.post(url, params)   // request
		.done(function(data) {  // response
			if (data.code == 1) { // 성공
				alert(data.result);
				document.location.href = "/main/template";
			} else { // 실패
				alert(data.errorMessage);
			}
		});
	});
});
</script>
</body>
</html>