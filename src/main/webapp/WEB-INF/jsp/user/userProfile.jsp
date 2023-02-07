<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<%-- <jsp:include page="../include/header.jsp" /> --%>
<div class="container">
	<div id="wrap" class="bg-light">
		<header class="d-flex bgTemp">
			<jsp:include page="../include/header.jsp" />
		</header>

		<div id="menu1" class="bgTemp d-flex justify-content-center">
			<jsp:include page="../include/nav.jsp" />
		</div>

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
					<div class="d-flex justify-content-end align-items-end mm-3"><button type="button" class="btn btn-info">update</button></div>
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
		<section class="section1 d-flex justify-content-center mt-2">
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
		
		<div class="temp d-flex mr-5">
			<h1 class="pl-5 col-11"><i>Reservation</i></h1>
			<div class="col-1 d-flex align-items-end justify-content-end">
				<span>Available: </span>
			</div>
		</div>
		<section class="section1 d-flex justify-content-center mt-2">
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

		<footer class="bgTemp">
			<jsp:include page="../include/footer.jsp" />
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
</html>