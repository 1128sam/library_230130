<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<div class="d-flex justify-content-center mt-3">
				<div class="d-flex col-1"><span class="d-flex justify-content-center align-items-center pl-3"><img src="https://www.pngfind.com/pngs/m/9-95287_double-left-chevron-svg-png-icon-free-download.png" alt="arrowLeft" width="30"></span></div>
				<div class="col-10 mt-5">
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
				<div class="d-flex col-1"><span class="d-flex justify-content-center align-items-center pl-3"><img src="right_arrow.png" alt="arrowRight" width="30"></span></div>
				</div>

				<div class="d-flex justify-content-center">
				<div class="col-10 section1">
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