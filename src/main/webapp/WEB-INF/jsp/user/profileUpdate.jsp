<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
							<div class="file-upload d-flex">
							<%-- file 태그는 숨겨두고 이미지를 클릭하면 file 태그를 클릭한 것처럼 이벤트를 줄 것이다. --%>
							<input type="file" id="file" accept=".jpg,.jpeg,.png,.gif">
							<%-- 이미지에 마우스 올리면 마우스커서가 링크 커서가 변하도록 a 태그 사용 --%>
							<a href="#" id="fileUploadBtn"><img width="30" src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-image-512.png"></a>
		
							<%-- 업로드 된 임시 파일 이름 저장될 곳 --%>
							<div id="fileName" class="ml-2">
							</div>
						</div>
						</div>
						
						<button type="button" id="updateBtn" class="btn btn-info w-100 mt-3">변경하기</button>
				</div>
				</div>
			</div>
		</section>
		</c:if>

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

	$('#file').on('change', function(e) {
		//alert("파일 선택");
		let fileName = e.target.files[0].name; // 07_30_01.png
		//alert(fileName);
		
		// 확장자 유효성 확인
		let ext = fileName.split(".").pop().toLowerCase();
		if (ext != 'jpg' && ext != 'jpeg' && ext != 'gif' && ext != 'png') {
			alert("이미지 파일만 업로드 할 수 있습니다.");
			$('#file').val(''); // 파일 태그에 실제 파일 제거
			$("#fileName").text(''); // 파일 이름 비우기
			return;
		}
		
		// 유효성 통과한 이미지는 상자에 업로드 된 파일 이름 노출
		$('#fileName').text(fileName);
	});

	$('#updateBtn').on('click', function() {

		let userId = $('#userId').val().trim();
		let password = $('#password').val();
		let passwordCheck = $('#passwordCheck').val();
		let selfVerQue = $('#selfVerQue').val();
		let selfVerAns = $('#selfVerAns').val().trim();
		let file = $('#file').val();
		
		if (file != '') {
			let ext = file.split(".").pop().toLowerCase();
			if ($.inArray(ext, ['jpg', 'jpeg', 'png', 'gif']) == -1) {
				alert("이미지 파일만 업로드 할 수 있습니다.");
				$('#file').val(""); // 파일을 비운다.
				return;
			}
		}

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
			 /* if ($('#currentIdWarn').hasClass('d-none') == false) {
			 	return;
			 } */
			alert("your userid is currently being used.");
			return;
		}
		alert(userId + " " + password + " " + passwordCheck + " " + selfVerQue + " " + selfVerAns + " " + file);
		let formData = new FormData();
		formData.append("userId", userId);
		formData.append("password", password);
		formData.append("selfVerQue", selfVerQue);
		formData.append("selfVerAns", selfVerAns);
		formData.append("file", $('#file')[0].files[0]);

		$.ajax({
			type:"POST",
			url: "/user/profile_update",
			data: formData,
			enctype: "multipart/form-data",
			processData: false,
			contentType: false,
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