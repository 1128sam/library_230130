<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Digital Lib. Search Result</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

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

<c:forEach var="book" items="${bookList}" varStatus="vs">
		<section class="bookSection mt-4">
		<div class="d-flex justify-content-center">
			<div class="bookInfoBox d-flex">
				<div class="col-3 h-100 d-flex justify-content-center align-items-center">
					<div class="bookImgBox m-3 d-flex justify-content-center"></div>
				</div>
				<div class="col-9">
					<h4 class="pt-5">${book.title}</h4>
					<span>${book.author}</span><br>
					<span>ISBN : ${book.isbn}</span><br>
					<span>publisher : ${book.publisher}</span>
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

<footer class="bgTemp">
			<jsp:include page="../include/footer.jsp" />
		</footer>
	</div>
</div>
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
</body>
</html>