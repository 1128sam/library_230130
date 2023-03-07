<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="section1 d-flex justify-content-center">
	<div class="postBorder mt-5 pb-4">
		<h3>Add Book</h3>
		<label for="title" class="subject-text my-2">Title</label>
		<input type="text" id="title" name="title" class="form-control" placeholder="Title" maxlength="128">
		<label for="author" class="subject-text my-2">Author</label>
		<input type="text" id="author" name="author" class="form-control" placeholder="Author" maxlength="64">
		<label for="issn" class="subject-text my-2">ISBN/ISSN</label>
		<input type="text" id="issn" name="author" class="form-control" maxlength="20">
		<label for="publisher" class="subject-text my-2">Publisher</label>
		<input type="text" id="publisher" name="publisher" class="form-control" placeholder="Publisher" maxlength="50">
		<label for="year" class="subject-text my-2">Year</label>
		<input type="number" id="year" name="year" class="form-control" placeholder="Year" maxlength="4">
		<label for="category" class="subject-text my-2">Category</label>
		<input type="text" id="category" name="category" class="form-control" maxlength="16">

		<div class="file-upload d-flex">
			<input type="file" id="file" accept=".jpg,.jpeg,.png,.gif">
			<a href="#" id="fileUploadBtn"><img width="30" src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-image-512.png"></a>

			<div id="fileName" class="ml-2"></div>
		</div>

			<div class="d-flex justify-content-between">
			<a href="/main/template" type="button" id="deleteBtn" class="btn btn-danger mt-3">DELETE</a>
				<button type="button" id="newBookBtn" class="btn btn-info mt-3">POST</button>
			</div>
	</div>
</div>

<script>
$(document).ready(function() {
	$('#file').on('change', function(e) {
		let fileName = e.target.files[0].name; // 07_30_01.png
		//alert(fileName);

		let ext = fileName.split(".").pop().toLowerCase();
		if (ext != 'jpg' && ext != 'jpeg' && ext != 'gif' && ext != 'png') {
			alert("이미지 파일만 업로드 할 수 있습니다.");
			$('#file').val(''); // 파일 태그에 실제 파일 제거
			$("#fileName").text(''); // 파일 이름 비우기
			return;
		}

		$('#fileName').text(fileName);
	});

	$('#newBookBtn').on('click', function() {
		let title = $('#title').val().trim();
		if (title == '') {
			alert("Please enter the title.");
			return;
		}
		let author = $('#author').val().trim();
		if (author == '') {
			alert("write something.");
			return;
		}
		let issn = $('#issn').val().trim();
		if (issn == '') {
			alert("write something.");
			return;
		}
		let publisher = $('#publisher').val().trim();
		if (publisher == '') {
			alert("write something.");
			return;
		}
		let year = $('#year').val().trim();
		if (year == '') {
			alert("write the year.");
			return;
		}
		let category = $('#category').val().trim();
		let file = $('#file').val();

		if (file != '') {
			let ext = file.split(".").pop().toLowerCase();
			if ($.inArray(ext, ['jpg', 'jpeg', 'png', 'gif']) == -1) {
				alert("이미지 파일만 업로드 할 수 있습니다.");
				$('#file').val(""); // 파일을 비운다.
				return;
			}
		}

		let formData = new FormData();
		formData.append("title", title);
		formData.append("author", author);
		formData.append("issn", issn);
		formData.append("publisher", publisher);
		formData.append("year", year);
		formData.append("category", category);
		formData.append("file", $('#file')[0].files[0]);

		$.ajax({
			type:"POST",
			url: "/admin/add_book",
			data: formData,
			enctype: "multipart/form-data",
			processData: false,
			contentType: false,
			success: function(data) {
				if (data.code == 1) {
					alert(data.result);
					location.href="/main/template";
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
		e.preventDefault();
		$('#file').click();
	});
});
</script>