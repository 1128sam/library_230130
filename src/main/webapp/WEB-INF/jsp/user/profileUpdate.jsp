<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Digital Lib. Profile Update</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="/static/css/style.css">
</head>
<body>
<%-- <jsp:include page="../include/header.jsp" /> --%>
<div class="container">
	<div id="wrap" class="bg-light">
		<header class="d-flex bgTemp">
			<jsp:include page="../include/header.jsp" />
		</header>

		<div id="menu1" class="bgTemp d-flex justify-content-center">
			<jsp:include page="../include/nav.jsp" />
		</div>

		<c:if test="${empty userId}">
			<jsp:include page="../main/main.jsp" />
		</c:if>
		<c:if test="${not empty userId}">
		<section class="section1 d-flex justify-content-center mt-5">
			<div class="profileUpdateBox d-flex">
				<div class="col-6 h-100 d-flex justify-content-center align-items-center">
					<img src="https://i.pinimg.com/originals/ca/52/e6/ca52e6e168595f767c2121a68cc227b0.jpg" alt="profile img" width="200">
				</div>
				<div class="col-6 d-flex justify-content-center">
				<div class="w-50">
						<label for="userId" class="subject-text my-2">New UserId</label>
						<input type="text" id="userId" name="userId" class="form-control" placeholder="Enter your new user ID." maxlength="16">
						<div id="idLengthWarn" class="text-info d-none">
							<small>아이디를 4자 이상 입력하세요.</small>
						</div>
						<div id="idValCheckWarn" class="text-info d-none">
							<small>사용중인 아이디입니다.</small>
						</div>
						<div id="idValCheckPermit" class="text-info d-none">
							<small>사용 가능한 아이디입니다.</small>
						</div>
						<div id="currentIdWarn" class="text-info d-none">
							<small>same as current user Id.</small>
						</div>

						<label for="password" class="subject-text my-2">Password</label>
						<input type="password" id="password" name="password" class="form-control" placeholder="비밀번호를 입력하세요">
						<label for="passwordCheck" class="subject-text my-2">Re-enter Your Password</label>
						<input type="password" id="passwordCheck" name="passwordCheck" class="form-control" placeholder="비밀번호를 다시 입력하세요">
						<div id="passwordValidWarn" class="text-info d-none">
							<small>비밀번호가 일치하지 않습니다.</small>
						</div>

						<label for="selfVerQue" class="subject-text my-2">Self Vertification Question</label>
						<select id="selfVerQue" name="selfVerQue" class="form-control mb-1">
						  <option value="selectX">-- OPTIONS --</option>
						  <option value="volvo" <c:if test="${question eq 'volvo'}">selected</c:if>>Volvo</option>
						  <option value="saab" <c:if test="${question eq 'saab'}">selected</c:if>>Saab</option>
						  <option value="fiat" <c:if test="${question eq 'fiat'}">selected</c:if>>Fiat</option>
						  <option value="audi" <c:if test="${question eq 'audi'}">selected</c:if>>Audi</option>
						</select>
						<input type="text" id="selfVerAns" name="selfVerAns" class="form-control" placeholder="Answer the Question" maxlength="256" value="${answer}">
						<div class="fileAttachBox d-flex justify-content-between">
							<span>Profile img.</span>
							<span class="d-flex justify-content-end"><input type="button" id="fileAttach" class="btn btn-secondary fileAttach form-control" value="file"></span>
						</div>
						<button type="button" id="updateBtn" class="btn btn-info w-100 mt-3">변경하기</button>
				</div>
				</div>
			</div>
		</section>
		</c:if>
		<footer class="bgTemp">
			<jsp:include page="../include/footer.jsp" />
		</footer>
	</div>
</div>

<script>
$(document).ready(function() {
	$('#userId').on('change', function(e) {
		e.preventDefault();
		let userLoginId = '<%=(String)session.getAttribute("userLoginId")%>';
		$('#idLengthWarn').addClass("d-none");
		$('#idValCheckWarn').addClass("d-none");
		$('#idValCheckPermit').addClass("d-none");
		$('#currentIdWarn').addClass("d-none");

		let userId = $('#userId').val().trim();
		if (userId.length < 4) {
			$('#idLengthWarn').removeClass("d-none");
			return;
		}

		$.ajax({
			url: "/user/userId_validation",
			data: {"userId" : userId},
			success: function(data) {
				if (data.result == "taken") {
					if (userId == userLoginId) {
						$('#currentIdWarn').removeClass("d-none");
						return;
					}
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

	$('#updateBtn').on('click', function() {

		let userId = $('#userId').val().trim();
		let password = $('#password').val();
		let passwordCheck = $('#passwordCheck').val();
		let selfVerQue = $('#selfVerQue').val();
		let selfVerAns = $('#selfVerAns').val().trim();
		let fileAttach = $('#fileAttach').val();

		if (userId.length < 1) {
			alert("Please enter your new userID.");
			return;
		}
		if (password.length < 1 || passwordCheck.length < 1) {
			alert("Please enter your new password.");
			return;
		} else if (password != passwordCheck) {
			alert("Your password doesn't match.");
			return;
		}
		if (selfVerQue == "selectX") {
			alert("Please choose a self vertification question.");
			return;
		}
		if (selfVerAns.length < 1) {
			alert("Please write your answer to self vertification Q.");
			return;
		}

		if ($('#idLengthWarn').hasClass('d-none') == false) {
			alert("Please confirm your id validation.");
			return;
		} else if ($('#idValCheckPermit').hasClass('d-none')) {
			 if ($('#currentIdWarn').hasClass('d-none') == false) {
			 	return;
			 }
			alert("your userid is currently being used.");
			return;
		}

		$.ajax({
			type:"get",
			url: "/user/profile_update",
			data: {"userId":userId, "password":password, "selfVerQue":selfVerQue, "selfVerAns":selfVerAns, "fileAttach":fileAttach},
			success: function(data) {
				if (data.code == 1) {
					alert(data.result);				
					location.href="/user/sign_in_view";
				} else {
					alert(data.result);
				}
			},
			error: function(error) {
				alert("failed to check userId validation. please inquire to admins.");
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

	$('#password').on('change', function() {
		var password = $('#password').val();
		var passwordCheck = $('#passwordCheck').val();
		if (passwordCheck.length > 0) {
			if (password != passwordCheck) {
				$('#passwordValidWarn').removeClass("d-none");
				return;
			} else {
				$('#passwordValidWarn').addClass("d-none");
			}
		}
	});
});
</script>
</body>
</html>