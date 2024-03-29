<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
		<section class="section1">
			<div class="d-flex justify-content-center mt-3">
				<!-- <div class="d-flex col-1"><span class="d-flex justify-content-center align-items-center pl-3"><img src="https://www.pngfind.com/pngs/m/9-95287_double-left-chevron-svg-png-icon-free-download.png" alt="arrowLeft" width="30"></span></div> -->
				<div class="col-10 mt-3">
					<h1 id="font1">Popular</h1>
					<div class="popularBooksBox d-flex justify-content-between pt-2">
					<c:forEach var="book" items="${popular5}" varStatus="vs">
						<a href="/main/book_info_view?bookId=${book.id}">
							<article class="bookDisplayBox">
							<c:if test="${book.imageUrl ne null}">
								<img src="${book.imageUrl}" alt="book${vs}" width="100" height="120" class="d-flex justify-content-center mt-4 ml-4 mr-4 mb-1">
							</c:if>
							<c:if test="${book.imageUrl eq null}">
								<div class="imgBox mt-4 ml-4 mr-4 mb-1 d-flex justify-content-center"></div>
							</c:if>
								<c:if test="${book.title.length() < 32}">
		                        	<div class="ml-3">${book.title}</div>
		                        </c:if>
								<c:if test="${book.title.length() >= 32}">
		                        	<div class="ml-3">${fn:substring(book.title, 0, 32)}...</div>
		                        </c:if>
		                        <small class="ml-3 text-secondary">${book.author}</small>
		                    </article>
	                    </a>
	                   </c:forEach>
					</div>
				</div>
				</div>
				<div class="d-flex justify-content-center mt-1">
					<div class="col-10 mt-1">
						<h1 id="font1">High Ratings</h1>
						<div class="popularBooksBox d-flex justify-content-between pt-2">
						<c:forEach var="book" items="${rating5}" varStatus="vs">
							<a href="/main/book_info_view?bookId=${book.id}">
								<article class="bookDisplayBox">
								<c:if test="${book.imageUrl ne null}">
									<img src="${book.imageUrl}" alt="book${vs}" width="100" height="120" class="d-flex justify-content-center mt-4 ml-4 mr-4">
								</c:if>
								<c:if test="${book.imageUrl eq null}">
									<div class="imgBox mt-4 ml-4 mr-4 mb-1 d-flex justify-content-center"></div>
								</c:if>
			                        <c:if test="${book.title.length() < 32}">
			                        	<div class="ml-3">${book.title}</div>
			                        </c:if>
									<c:if test="${book.title.length() >= 32}">
			                        	<div class="ml-3">${fn:substring(book.title, 0, 32)}...</div>
			                        </c:if>
			                        <small class="ml-3 text-secondary">${book.author}</small><br>
			                        <small class="ml-3">${book.point}</small>
			                    </article>
		                    </a>
		                   </c:forEach>
						</div>
					</div>
				<!-- <div class="d-flex col-1"><span class="d-flex justify-content-center align-items-center pl-3"><img src="right_arrow.png" alt="arrowRight" width="30"></span></div> -->
				</div>

				<div class="d-flex justify-content-center">
				<div class="col-10 section1">
					<h1 id="font1">Recently Returned Books</h1>
						<div class="popularBooksBox d-flex justify-content-between pt-2">
						<c:forEach var="book" items="${recent5}" varStatus="vs">
						<a href="/main/book_info_view?bookId=${book.id}">
							<article class="bookDisplayBox">
							<c:if test="${book.imageUrl ne null}">
								<img src="${book.imageUrl}" alt="book${vs}" width="100" height="120" class="d-flex justify-content-center mt-4 ml-4 mr-4">
							</c:if>
							<c:if test="${book.imageUrl eq null}">
								<div class="imgBox mb-1 mt-4 ml-4 mr-4 d-flex justify-content-center"></div>
							</c:if>
		                        <c:if test="${book.title.length() < 32}">
		                        	<div class="ml-3">${book.title}</div>
		                        </c:if>
								<c:if test="${book.title.length() >= 32}">
		                        	<div class="ml-3">${fn:substring(book.title, 0, 32)}...</div>
		                        </c:if>
		                        <small class="ml-3 text-secondary">${book.author}</small>
		                    </article>
	                    </a>
	                   </c:forEach>
					</div>
				</div>
			</div>
		</section>

		<section class="section2 d-flex">
			<div class="col-6 post">
				<h1 class="ml-2" id="font1"><a href="/post/post_list_view?type=info&page=1">Information</a></h1>
				<table class="table">
				<c:forEach var="list" items="${noticeList}">
					<tr>
						<td class="col-10 infoPost">
							<a href="/post/post_view?postId=${list.id}">
								<c:if test="${list.title.length() < 55}">
		                        	<div>${list.title}</div>
		                        </c:if>
								<c:if test="${list.title.length() >= 55}">
		                        	<div>${fn:substring(list.title, 0, 55)}...</div>
		                        </c:if>
							</a>
						</td>
						<td class="col-2 d-flex justify-content-end"><small><i><fmt:formatDate value="${list.createdAt}" pattern="MM.d"/></i></small></td>
					</tr>
				</c:forEach>
				</table>
			</div>
			<div class="col-6 post">
				<h1 id="font1"><a href="/post/post_list_view?type=rec&page=1">Recommendation</a></h1>
				<table class="table">
					<c:forEach var="list" items="${recList}">
					<tr>
						<td class="col-10 infoPost">
							<a href="/post/post_view?postId=${list.id}">
								<c:if test="${list.title.length() < 55}">
		                        	<div>${list.title}</div>
		                        </c:if>
								<c:if test="${list.title.length() >= 55}">
		                        	<div>${fn:substring(list.title, 0, 55)}...</div>
		                        </c:if>
							</a>
						</td>
						<td class="col-2 d-flex justify-content-end"><small><i><fmt:formatDate value="${list.createdAt}" pattern="MM.d"/></i></small></td>
					</tr>
				</c:forEach>
				</table>
			</div>
</section>
<input type="text" id="obsl" class="d-none" value="${temp}">

<script>
$(document).ready(function() {
	if ($('#obsl').val() == "1") { /* if there are no obsl list on session, it doesn't show the popup screen */
		window.open('../main/popup','popup','width=1400,height=600');
	}

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
					alert("This didn't work.");
				}
			},
			error: function(error) {
				alert("failed searching. please inquire to admins.");
			}
		});
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