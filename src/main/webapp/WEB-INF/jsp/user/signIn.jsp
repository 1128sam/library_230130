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

				<label for="userId" class="subject-text my-2 mt-2">
                        아이디
                </label>
                <input type="text" id="userId" class="form-control" placeholder="아이디를 입력하세요">
                <div id="idLengthWarn" class="text-info"><small>아이디를 4자 이상 입력하세요.</small></div>

				<label for="password" class="subject-text my-2">
                        비밀번호
                </label>
                <input type="password" id="password" class="form-control" placeholder="비밀번호를 입력하세요">

                
                <button type="button" id="signUpBtn" class="btn btn-info w-100 mt-3">로그인</button>
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
</body>
</html>