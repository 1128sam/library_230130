<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	                        <div class="imgBox m-3 d-flex justify-content-center">
	                        	<img src="https://miblart.com/wp-content/uploads/2020/01/crime-and-mystery-cover-scaled-1.jpeg">
	                        </div>
	                        <div class="ml-3">Fortress blood</div>
	                        <div class="ml-3"><small>L.D. Goffigan</small></div>
	                    </article>
	                    <article class="bookDisplayBox">
	                        <div class="imgBox m-3 d-flex justify-content-center">
	                        	<img src="https://d1csarkz8obe9u.cloudfront.net/posterpreviews/yellow-business-leadership-book-cover-design-template-dce2f5568638ad4643ccb9e725e5d6ff_screen.jpg?ts=1637017516">
	                        </div>
	                        <div class="ml-3">The Mind of a Leader</div>
	                        <div class="ml-3"><small>Kevin Andersen</small></div>
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
				<!-- <div class="d-flex col-1"><span class="d-flex justify-content-center align-items-center pl-3"><img src="right_arrow.png" alt="arrowRight" width="30"></span></div> -->
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
				<h1 class="ml-2"><i><a href="/post/post_list_view?type=info">Information</a></i></h1>
				<table class="table">
				<c:forEach var="list" items="${noticeList}">
					<tr>
						<td class="col-10 infoPost"><a href="/post/post_view?postId=${list.id}">${list.title}</a></td>
						<td class="col-2 d-flex justify-content-end"><small><fmt:formatDate value="${list.createdAt}" pattern="MM.d"/></small></td>
					</tr>
				</c:forEach>
				</table>
			</div>
			<div class="col-6 post">
				<h1 id="RecTitle"><i><a href="/post/post_list_view?type=rec">Recommendation</a></i></h1>
				<table class="table">
					<c:forEach var="list" items="${recList}">
					<tr>
						<td class="col-10 infoPost"><a href="/post/post_view?postId=${list.id}">${list.title}</a></td>
						<td class="col-2 d-flex justify-content-end"><small><fmt:formatDate value="${list.createdAt}" pattern="MM.d"/></small></td>
					</tr>
				</c:forEach>
				</table>
			</div>
</section>

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
					alert("This shit didn't work.");
				}
			},
			error: function(error) {
				alert("failed searching. please inquire to admins.");
			}
		});
		
		/* $.ajax({
			url: "/get_json",
			
			success: function(data) { // data: json으로 구성{"result": "데이터들"}
				$('#div').append("<div>" + data.result + "</div>");
			}
		});
		
		$.ajax({
			url: "/view",
			
			success: function(data) { // html 태그들 자체가 내려옴
				$('#div').html(data); // 이전 내용을 지우고 새로운 내용을 넣는다.
			}
		});
	});
	
	append로 넣은거
	=>
	$(document).on("click", "#addBtn", function() {
		alert();
	})
	
	application.yml을 .gitignore(github에 안올리기) */
});
</script>