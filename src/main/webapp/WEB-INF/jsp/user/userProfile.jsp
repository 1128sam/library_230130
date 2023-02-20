<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
		<c:if test="${empty userId}">
			<jsp:include page="../main/main.jsp" />
		</c:if>
		<c:if test="${not empty userId}">
		<section class="section1 d-flex justify-content-center mt-5">
			<div class="profileBox d-flex">
				<div class="col-3 h-100 d-flex justify-content-center align-items-center">
					<img src="https://i.pinimg.com/originals/ca/52/e6/ca52e6e168595f767c2121a68cc227b0.jpg" alt="profile img" width="200">
				</div>
				<div class="col-9">
					<h4 class="pt-5">${userLoginId}</h4>
					<span>${userName}</span><br>
					<span>
						<c:if test="${userType == 1}">
							USER
						</c:if>
					</span>
					<div class="d-flex justify-content-end align-items-end mm-3"><input type="button" id="profileUpdateBtn" class="btn btn-info" value="update"></div>
				</div>
			</div>
		</section>
		</c:if>
		
		<div class="temp d-flex mr-5">
			<h1 class="pl-5 col-11"><i>Currently borrowed books</i></h1>
			<div class="col-1 d-flex align-items-end justify-content-end">
				<span>Available: </span>
			</div>
		</div>
		<c:forEach var="book" items="${borrowedBookList}" varStatus="vs">
		<section class="bookSection d-flex justify-content-center mt-2">
		<a href="/main/book_info_view?bookId=${book.id}">
			<div class="bookInfoBox d-flex">
				<div class="col-3 h-100 d-flex justify-content-center align-items-center">
					<img src="${book.imageUrl}" alt="borrowedBookImg" width="150">
				</div>
				<div class="col-9">
					<h4 class="pt-5">${book.title}</h4>
					<span>${book.author}</span><br>
					<span>${book.isbn}</span><br>
					<span>${book.publisher}</span><br>
					<span class="d-flex justify-content-end align-items-end"><fmt:formatDate value="${dueDateList.get(vs.index)}" pattern="MM.dd"/> (O Days Left)</span>
				</div>
			</div>
		</a>
		</section>
		</c:forEach>
		
		<div class="temp d-flex mr-5">
			<h1 class="pl-5 col-11"><i>Reservation</i></h1>
			<div class="col-1 d-flex align-items-end justify-content-end">
				<span>Available: </span>
			</div>
		</div>
		<section class="section1 d-flex justify-content-center">
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
		</section>
		
		<div class="d-flex justify-content-center">
				<div class="col-10 section1">
					<h1><i>Recently Returned Books</i></h1>
						<div class="popularBooksBox d-flex justify-content-between pt-2">
					<c:forEach var="book" items="${returnedBookList}">
							<article class="bookDisplayBox">
								<c:if test="${book.imageUrl ne null}">
		                        <div class="d-flex justify-content-center mt-1"><img src="${book.imageUrl}" alt="bookImg" width="100"></div>
		                        </c:if>
		                        <c:if test="${book.imageUrl eq null}">
		                        	<div class="imgBox m-3 d-flex justify-content-center"></div>
		                        </c:if>
		                        <div class="ml-3 mt-1">${book.title}</div>
		                        <span class="ml-3 text-secondary"><small>${book.author}</small></span>
		                    </article>
	                </c:forEach>
						</div>
				</div>
			</div>

<!-- 단위 테스트
JUnit

TDD 테스트 주도 개발


String a = null;
a.isEmpty();

=>
npe -->

<script>
$(document).ready(function() {
	$('#profileUpdateBtn').on('click', function() {
		location.href = "/user/profile_update_view";
	});
});
</script>