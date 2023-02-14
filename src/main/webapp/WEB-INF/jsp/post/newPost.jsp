<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section class="signUp d-flex justify-content-center">
	<div class="newPostBox">
	<c:if test="${type eq 0}">
		<h4 class="mt-3">New Information</h4>
	</c:if>
	<c:if test="${type eq 1}">
		<h4 class="mt-3">New Recommendation</h4>
	</c:if>

			<label for="title" class="subject-text my-2">Title</label>
			<input type="text" id="title" name="title" class="form-control" placeholder="Title" maxlength="128">
			
			<label for="content" class="subject-text my-2">Content</label>
			<textarea id="content" name="content" rows="12" class="w-100" placeholder="Please write the content."></textarea>
			<div id="contentLengthWarn" class="text-info d-none"><small>내용을 입력하세요.</small></div>

				<div class="file-upload d-flex">
					<%-- file 태그는 숨겨두고 이미지를 클릭하면 file 태그를 클릭한 것처럼 이벤트를 줄 것이다. --%>
					<input type="file" id="file" class="d-none" accept=".gif, .jpg, .png, .jpeg">
					<%-- 이미지에 마우스 올리면 마우스커서가 링크 커서가 변하도록 a 태그 사용 --%>
					<a href="#" id="fileUploadBtn"><img width="30" src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-image-512.png"></a>

					<%-- 업로드 된 임시 파일 이름 저장될 곳 --%>
					<div id="fileName" class="ml-2">
					</div>
				</div>
			
			<div class="d-flex justify-content-between">
			<a href="/post/post_list_view?type=rec" type="button" id="deleteBtn" class="btn btn-danger mt-3">삭제</a>
			<c:if test="${type eq 0}">
				<button type="button" id="newInfoBtn" class="btn btn-info mt-3">POST</button>
			</c:if>
			<c:if test="${type eq 1}">
				<button type="button" id="newRecBtn" class="btn btn-info mt-3">POST</button>
			</c:if>
			</div>
	</div>
</section>

<script>
$(document).ready(function() {
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
	
	$('#newInfoBtn').on('click', function() {
		let title = $('#title').val().trim();
		if (title == '') {
			alert("Please enter the title.");
			return;
		}
		let content = $('#content').val().trim();
		if (content == '') {
			alert("write something.");
			return;
		}
		let file = $('#file').val();
		let ext = file.split('.').pop().toLowerCase(); // 파일 경로를 .으로 나누고 확장자가 있는 마지막 문자열을 가져온 후 모두 소문자로 변경
		if ($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
			alert("gif, png, jpg, jpeg 파일만 업로드 할 수 있습니다.");
			$('#file').val(''); // 파일을 비운다.
			return;
		}
		
		let formData = new FormData();
		formData.append("title", title);
		formData.append("content", content);
		formData.append("type", 0);
		formData.append("file", $('#file')[0].files[0]);
		console.log(formData);

		$.ajax({
			type:"POST",
			url: "/post/add_post",
			data: formData,
			enctype: "multipart/form-data",
			processData: false,
			contentType: false,
			success: function(data) {
				if (data.code == 1) {
					location.href="/post/post_list_view?type=info";
				} else {
					alert(data.result);
				}
			},
			error: function(error) {
				alert("failed to insert. please inquire to admins.");
			}
		});
	});

	$('#newRecBtn').on('click', function() {
		let title = $('#title').val().trim();
		if (title == '') {
			alert("Please enter the title.");
			return;
		}
		let content = $('#content').val().trim();
		if (content == '') {
			alert("write something.");
			return;
		}

		$.ajax({
			type:"get",
			url: "/post/add_post",
			data: {"title":title, "content":content, "type":1},
			success: function(data) {
				if (data.code == 1) {
					location.href="/post/post_list_view?type=rec";
				} else {
					alert(data.result);
				}
			},
			error: function(error) {
				alert("failed to insert. please inquire to admins.");
			}
		});
	});

	$('#fileUploadBtn').on('click', function(e) {
		e.preventDefault(); // a 태그의 올라가는 현상 방지
		$('#file').click(); // input file을 클릭한 것과 같은 효과
	});

	
});
</script>