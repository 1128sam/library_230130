<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="section1 d-flex justify-content-center">
	<div class="postBorder mt-5 pb-4">
	<input class="d-none" id="bookId" value="${book.id}">
		<div class="d-flex">
			<h2 class="col-6">Update Book</h2>
			<div class="col-6 d-flex justify-content-center"><img src="${book.imageUrl}" width="200"></div>
		</div>
		<label for="title" class="subject-text my-2">Title</label>
		<input type="text" id="title" name="title" class="form-control" placeholder="Title" maxlength="128" value="${book.title}">
		<label for="author" class="subject-text my-2">Author</label>
		<input type="text" id="author" name="author" class="form-control" placeholder="Author" maxlength="64" value="${book.author}">
		<label for="isbn" class="subject-text my-2">ISBN/ISSN</label>
		<input type="text" id="isbn" name="author" class="form-control" maxlength="20" value="${book.isbn}">
		<label for="publisher" class="subject-text my-2">Publisher</label>
		<input type="text" id="publisher" name="publisher" class="form-control" placeholder="Publisher" maxlength="50" value="${book.publisher}">
		<label for="year" class="subject-text my-2">Year</label>
		<input type="number" id="year" name="year" class="form-control" placeholder="Year" maxlength="4" value="${book.year}">
		<label for="category" class="subject-text my-2">Category</label>
		<input type="text" id="category" name="category" class="form-control" maxlength="16" value="${book.category}">

		<div class="d-flex justify-content-between">
			<a href="/main/template" type="button" id="deleteBtn" class="btn btn-danger mt-3">DELETE</a>
			<button type="button" id="updateBookBtn" class="btn btn-info mt-3">UPDATE</button>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	$('#updateBookBtn').on('click', function() {
		let id = $('#bookId').val();
		alert(id);
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
		let isbn = $('#isbn').val().trim();
		if (isbn == '') {
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

		let formData = new FormData();
		formData.append("id", id);
		formData.append("title", title);
		formData.append("author", author);
		formData.append("isbn", isbn);
		formData.append("publisher", publisher);
		formData.append("year", year);
		formData.append("category", category);

		$.ajax({
			type:"POST",
			url: "/admin/update_book",
			data: formData,
			enctype: "multipart/form-data",
			processData: false,
			contentType: false,
			success: function(data) {
				if (data.code == 1) {
					alert(data.result);
					location.href="/main/book_info_view?bookId=" + data.id;
				} else {
					alert(data.result);
				}
			},
			error: function(error) {
				alert("failed to update. please inquire to admins.");
			}
		});
	});
});
</script>