<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Digital Lib.</title>
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
			<div class="d-flex justify-content-end col-2"></div>
			<span class="display-4 d-flex justify-content-center col-8">Digital Library</span>
			<div class="d-flex justify-content-end col-2"><div class="d-flex align-items-end"><a href="#" class="mr-3">로그인</a><a href="#" class="ml-3">회원가입</a></div></div>
		</header>

		<div id="menu1" class="bgTemp d-flex justify-content-center">
			<nav class="menu col-8">
				<ul class="nav nav-fill">
		        	<li class="nav-item"><a href="#" class="nav-link">도서관 소개</a></li>
		            <li class="nav-item"><a href="#" class="nav-link">분류별 보기</a></li>
		            <li class="nav-item"><a href="#" class="nav-link">공지사항</a></li>
		            <li class="nav-item"><a href="#" class="nav-link">도서추천</a></li>
		        </ul>
			</nav>
		</div>

		<section class="search d-flex justify-content-center">
			<div class="col-5 input-group d-flex justify-content-center align-items-end mb-3">
				<div id="search" class="d-flex w-100">
					<input type="text" class="form-control">
					<button id="searchBtn" class="btn btn-secondary" type="button">검색</button>
				</div>
			</div>
		</section>

		<div class="radio mt-1 d-flex justify-content-center">
			<div class="col-7 d-flex justify-content-around align-items-start">
				<label for="general">
					<input type="radio" id="general" name="searchType" value="general" checked>
					<span class="searchTypeRadio">전체</span>
				</label>
				<label for="title">
					<input type="radio" id="title" name="searchType" value="title">
					<span class="searchTypeRadio">서명</span>
				</label>
				<label for="author">
					<input type="radio" id="author" name="searchType" value="author">
					<span class="searchTypeRadio">저자</span>
				</label>
				<label for="publisher">
					<input type="radio" id="publisher" name="searchType" value="publisher">
					<span class="searchTypeRadio">발행처</span>
				</label>
				<label for="issn">
					<input type="radio" id="issn" name="searchType" value="issn">
					<span class="searchTypeRadio">ISBN/ISSN</span>
				</label>
			</div>
		</div>

		<section class="section1">
			<div class="d-flex justify-content-center mt-3 bg-primary">
				<div class="d-flex col-1"><span class="d-flex justify-content-center align-items-center"><img src="file:///C:/AseowonLee/00_library_project/clone/src/main/resources/static/images/left_arrow.png" alt="arrowLeft" width="25"></span></div>
				<div class="col-10 mt-5 bg-warning">
					<h1><i>Popular</i></h1>
					<div class="popularBooksBox d-flex justify-content-between pt-2">
						<a href="#">
							<article id="" class="bookDisplayBox">
		                        <div class="imgBox m-3 d-flex justify-content-center"></div>
		                        <div class="ml-3">Title 1</div>
		                        <!-- <div class="text-secondary ml-3"><del>리처드 도킨스</del></div> -->
	                    	</article>
	                    </a>

	                    <article class="bookDisplayBox">
	                        <div class="imgBox m-3 d-flex justify-content-center"></div>
	                        <div class="ml-3">Title 2</div>
	                    </article>
	                    <article class="bookDisplayBox">
	                        <div class="imgBox m-3 d-flex justify-content-center"></div>
	                        <div class="ml-3">Title 3</div>
	                    </article>
	                    <article class="bookDisplayBox">
	                        <div class="imgBox m-3 d-flex justify-content-center"></div>
	                        <div class="ml-3">Title 4</div>
	                    </article>
	                    <article class="bookDisplayBox">
	                        <div class="imgBox m-3 d-flex justify-content-center"></div>
	                        <div class="ml-3">Title 5</div>
	                    </article>
					</div>
				</div>
				<div class="d-flex col-1 bg-danger"><span class="d-flex justify-content-center align-items-center">fdsafds</span></div>
				</div>

				<div class="d-flex justify-content-center">
				<div class="col-9 section1">
					<h1><i>Recently Returned Books</i></h1>
						<div class="popularBooksBox d-flex justify-content-between pt-2">
							<article class="bookDisplayBox">
		                        <div class="imgBox m-3 d-flex justify-content-center"></div>
		                        <div class="ml-3">Title 1</div>
		                    </article>
	
		                    <article class="bookDisplayBox">
		                        <div class="imgBox m-3 d-flex justify-content-center"></div>
		                        <div class="ml-3">Title 2</div>
		                    </article>
		                    <article class="bookDisplayBox">
		                        <div class="imgBox m-3 d-flex justify-content-center"></div>
		                        <div class="ml-3">Title 3</div>
		                    </article>
		                    <article class="bookDisplayBox">
		                        <div class="imgBox m-3 d-flex justify-content-center"></div>
		                        <div class="ml-3">Title 4</div>
		                    </article>
		                    <article class="bookDisplayBox">
		                        <div class="imgBox m-3 d-flex justify-content-center"></div>
		                        <div class="ml-3">Title 5</div>
		                    </article>
					</div>
				</div>
			</div>
		</section>

		<section class="section2 d-flex">
			<div class="col-6 post">
				<h1 class="ml-2"><i>Information</i></h1>
				<table class="table">
					<tr>
						<td class="col-10 infoPost"><a href="#">다음주 웹사이트가 오픈합니다!</a></td>
						<td class="col-2"><small>02.01</small></td>
					</tr>
					<tr>
						<td class="col-10 infoPost"><a href="#">공지사항 1</a></td>
						<td class="col-2"><small>02.02</small></td>
					</tr>
					<tr>
						<td class="col-10 infoPost"><a href="#">공지사항 2</a></td>
						<td class="col-2"><small>02.02</small></td>
					</tr>
					<tr>
						<td class="col-10 infoPost"><a href="#">제목 4</a></td>
						<td class="col-2"><small>02.02</small></td>
					</tr>
					<tr>
						<td class="col-10 infoPost"><a href="#">제목 5</a></td>
						<td class="col-2"><small>02.02</small></td>
					</tr>
				</table>
			</div>
			<div class="col-6 post">
				<h1><i>Recommendation</i></h1>
				<table class="table">
					<tr>
						<td class="col-10 infoPost"><a href="#">OOO 책 추천합니다.</a></td>
						<td class="col-2"><small>01.31</small></td>
					</tr>
					<tr>
						<td class="col-10 infoPost"><a href="#">OOOO 정말 인생책!!</a></td>
						<td class="col-2"><small>02.01</small></td>
					</tr>
					<tr>
						<td class="col-10 infoPost"><a href="#">제목 3</a></td>
						<td class="col-2"><small>02.02</small></td>
					</tr>
					<tr>
						<td class="col-10 infoPost"><a href="#">제목 4</a></td>
						<td class="col-2"><small>02.02</small></td>
					</tr>
					<tr>
						<td class="col-10 infoPost"><a href="#">제목 5</a></td>
						<td class="col-2"><small>02.02</small></td>
					</tr>
				</table>
			</div>
		</section>

		<footer class="bgTemp">
			<div class="d-flex justify-content-center align-items-end"><small>2023. DigLib. ©</small></div>
		</footer>
	</div>
</div>
</body>

<!-- 단위 테스트
JUnit

TDD 테스트 주도 개발


String a = null;
a.isEmpty();

=>
npe -->

<script>
	$(document).ready(function() {
		$('input[name=searchType]').change(function() {
			alert($(this).val());
		});
	});
</script>
</html>