<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section class="search d-flex justify-content-center">
			<div class="col-5 input-group d-flex justify-content-center align-items-end mb-3">
				<div id="search1" class="d-flex w-100">
					<input type="text" id="search" name="search" class="form-control">
					<button id="searchBtn" class="btn btn-secondary" type="button">Search</button>
				</div>
			</div>
		</section>

		<div class="radio mt-1 d-flex justify-content-center">
			<div class="col-7 d-flex justify-content-around align-items-start">
				<label for="general">
					<input type="radio" id="searchType" name="searchType" value="general" checked>
					<span class="searchTypeRadio">General</span>
				</label>
				<label for="title">
					<input type="radio" id="searchType" name="searchType" value="title">
					<span class="searchTypeRadio">Title</span>
				</label>
				<label for="author">
					<input type="radio" id="searchType" name="searchType" value="author">
					<span class="searchTypeRadio">Author</span>
				</label>
				<label for="publisher">
					<input type="radio" id="searchType" name="searchType" value="publisher">
					<span class="searchTypeRadio">Publisher</span>
				</label>
				<label for="issn">
					<input type="radio" id="searchType" name="searchType" value="issn">
					<span class="searchTypeRadio">ISBN</span>
				</label>
			</div>
		</div>
		
<script>
$(document).ready(function() {
	$('#searchBtn').on('click', function() {
		var search = $('#search').val().trim();
		var searchType = $("input[name='searchType']:checked").val();
		
		$.ajax({
			url: "/search/search_engine",
			data: {"search" : search, "searchType" : searchType},
			success: function(data) {
				if (data.code == 1) {
					location.href = "/main/search_list_view";
				} else {
					alert("Failed searching. Please retry.");
				}
			},
			error: function(error) {
				alert("failed searching. please inquire to admins.");
			}
		});
	});
});
</script>