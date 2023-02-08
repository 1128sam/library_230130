<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section class="search d-flex justify-content-center">
	<div class="col-5 input-group d-flex justify-content-center align-items-end mb-3">
		<div id="search1" class="d-flex w-100">
			<input type="text" id="search" name="search" class="form-control">
			<button id="searchBtn" class="btn btn-secondary" type="button">검색</button>
		</div>
	</div>
</section>

<div class="radio mt-1 d-flex justify-content-center">
	<div class="col-7 d-flex justify-content-around align-items-start">
		<label for="general">
			<input type="radio" id="searchType" name="searchType" value="general" checked>
			<span class="searchTypeRadio">전체</span>
		</label>
		<label for="title">
			<input type="radio" id="searchType" name="searchType" value="title">
			<span class="searchTypeRadio">서명</span>
		</label>
		<label for="author">
			<input type="radio" id="searchType" name="searchType" value="author">
			<span class="searchTypeRadio">저자</span>
		</label>
		<label for="publisher">
			<input type="radio" id="searchType" name="searchType" value="publisher">
			<span class="searchTypeRadio">발행처</span>
		</label>
		<label for="issn">
			<input type="radio" id="searchType" name="searchType" value="issn">
			<span class="searchTypeRadio">ISBN/ISSN</span>
		</label>
	</div>
</div>

<c:forEach var="item" items="${list}" varStatus="vs">
		<section class="bookSection mt-4">
		<div class="d-flex justify-content-center">
			<div class="bookInfoBox d-flex">
				<div class="col-3 h-100 d-flex justify-content-center align-items-center">
					<div class="bookImgBox m-3 d-flex justify-content-center"></div>
				</div>
				<div class="col-9">
					<h4 class="pt-5">서명 1</h4>
					<span>홍길동</span><br>
					<span>
						...
					</span>
				</div>
			</div>
		</div>
		</section>
</c:forEach>

		<section class="bookSection">
		<div class="d-flex justify-content-center">
			<div class="bookInfoBox d-flex">
				<div class="col-3 h-100 d-flex justify-content-center align-items-center">
					<div class="bookImgBox m-3 d-flex justify-content-center"></div>
				</div>
				<div class="col-9">
					<h4 class="pt-5">서명 2</h4>
					<span>홍길동2</span><br>
					<span>
						...
					</span>
				</div>
			</div>
		</div>
		</section>

<script>
$(document).ready(function() {
	$('#searchBtn').on('click', function() {
		var search = $('#search').val().trim();
		var searchType = $("input[name='searchType']:checked").val();

		/* $.ajax({
			type:"get",
			url: "/user/search_list",
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
		}); */
	});
});
</script>