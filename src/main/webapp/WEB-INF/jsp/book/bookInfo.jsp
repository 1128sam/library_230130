<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<section class="section1 d-flex justify-content-center mt-3 pb-2">
	<div class="bookInfoBox2">
	<input type="text" class="d-none" id="bookId" value="${book.id}">
	<h1>${book.title}</h1>
		<div class="d-flex justify-content-center">
			<div class="bookStatusBox d-flex">
				<div class="col-3 h-100 d-flex justify-content-center align-items-center">
					<c:if test="${book.imageUrl eq null}">
						<div class="bookImgBox m-3 d-flex justify-content-center"></div>
					</c:if>
					<c:if test="${book.imageUrl ne null}">
						<img src="${book.imageUrl}" alt="bookCoverImg" width="180">
					</c:if>
				</div>
				<div class="col-9 mt-5">
						<div class="d-flex"><h4>대출상태 : </h4>
							<c:if test="${book.status eq 0}">
								<span class="d-flex align-items-center ml-3 text-success">가능</span>
							</c:if>
							<c:if test="${book.status eq 1}">
								<span class="d-flex align-items-center ml-3 text-warning">대여중</span>
							</c:if>
							<c:if test="${book.status eq 2}">
								<span class="d-flex align-items-center ml-3 text-danger">예약중</span>
							</c:if>
						</div>
						<div class="d-flex my-2"><h4>반납기한 : </h4><span class="d-flex align-items-center ml-3"><fmt:formatDate value="${dueDate}" pattern="MM.dd(E)" /></span></div>
						<div class="d-flex my-2">
							<h4>예약상태 : </h4>
							<c:if test="${book.status eq 0}"><span class="d-flex align-items-center ml-3"></span></c:if>
							<c:if test="${book.status eq 1}"><span class="d-flex align-items-center ml-3">가능</span></c:if>
							<c:if test="${book.status eq 2}"><span class="d-flex align-items-center ml-3">예약중</span></c:if>
						</div>
						<div class="d-flex my-2"><h4>예약인원 : </h4><span class="d-flex align-items-center ml-3" id="resNum">${registerNum}</span></div>
						<c:if test="${userType eq 0}">
							<div class="d-flex my-2"><h4>대여자 : </h4><span class="d-flex align-items-center ml-3">${borrowedUser}</span></div>
						</c:if>
						<div class="d-flex mt-4"><h4>평점 : </h4><img src="https://cdn.searchenginejournal.com/wp-content/uploads/2021/08/a-guide-to-star-ratings-on-google-and-how-they-work-6123be39b9f2d-sej.jpg" class="ml-1" width="100"></div>
						<div class="d-flex justify-content-end">
							<c:if test="${book.status eq 0}"><button type="button" id="borrowBtn" class="btn btn-success">대출하기</button></c:if>
							<c:if test="${(book.status eq 1 || book.status eq 2) && borrowedUser eq null && registeredUser eq null}"><button type="button" id="reserveBtn" class="mx-4 btn btn-primary">Reserve</button></c:if>
							<c:if test="${book.status eq 2 && registeredUser ne null}"><button type="button" id="cancelReserveBtn" class="mx-4 btn btn-danger">Cancel Reservation</button></c:if>
							<c:if test="${borrowedUser eq userLoginId}"><button type="button" id="returnBtn" class="mx-4 btn btn-danger">반납하기</button></c:if>
							<c:if test="${userType eq 0}"><button type="button" id="modifyBtn" class="btn btn-secondary">수정하기</button></c:if>
						</div>
				</div>
					<div class="d-flex justify-content-end align-items-start mr-5"><img src="https://cdn.pixabay.com/photo/2016/01/20/18/35/x-1152114_960_720.png" width="35"></div>
			</div>
		</div>
		<div class="d-flex justify-content-center mt-5">
			<div class="bookStatusBox ml-5">
				<div class="d-flex align-items-center">
					<div>
						<h4 class="font-weight-normal">저자 : ${book.author}</h4>
						<h4 class="font-weight-normal">ISBN : ${book.isbn}</h4>
						<h4 class="font-weight-normal">출판사 : ${book.publisher}</h4>
						<h4 class="font-weight-normal">날짜 : ${book.year}</h4>
						<h4 class="font-weight-normal">분류 : ${book.category}</h4>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script>
$(document).ready(function() {
	let resNum = $('#resNum').val();
	if (resNum > 2) {
		$('#reserveBtn').addClass("d-none");
		$('#cancelReserveBtn').addClass("d-none");
	}

	$('#borrowBtn').on('click', function(e) {
		e.preventDefault();
		let bookId = $('#bookId').val();
		
		$.ajax({
			url: "/book/rent_book",
			data: {"bookId" : bookId},
			success: function(data) {
				if (data.code == 1) {
					alert(data.result);
					location.href = "/main/book_info_view?bookId=" + bookId;
				} else if (data.code == 400) {
					alert(data.result);
				} else if (data.code == 401) {
					alert(data.result);
				} else if (data.code == 500) {
					alert(data.result);
				} else if (data.code == 501) {
					alert(data.result);
				} else if (data.code == 402) {
					alert(data.result);
				}
				else {
					alert("failed. Please retry.");
				}
			},
			error: function(error) {
				alert("failed to borrow. please inquire to admins.");
			}
		});
	});

	$('#reserveBtn').on('click', function() {
		let userId = <%= (Integer) session.getAttribute("userId") %>;
		if (userId == null) {
			alert("Your session has expired. Please log in again.");
			location.href = "/user/sign_in_view";
			return;
		}
		let bookId = $('#bookId').val();

		$.ajax({
			url: "/book/register_book",
			data: {"userId" : userId, "bookId":bookId},
			success: function(data) {
				if (data.code == 1) {
					alert(data.result);
					location.href = "/main/book_info_view?bookId=" + bookId;
				} else if (data.code == 2) {
					alert(data.result + data.registerNum);
					location.href = "/main/book_info_view?bookId=" + bookId;
				} else if (data.code == 401) {
					alert(data.result);
				} else {
					alert("failed. Please retry.");
				}
			},
			error: function(error) {
				alert("failed to borrow. please inquire to admins.");
			}
		});
	});

	$('#cancelReserveBtn').on('click', function() {
		let userId = <%= (Integer) session.getAttribute("userId") %>;
		if (userId == null) {
			alert("Your session has expired. Please log in again.");
			location.href = "/user/sign_in_view";
			return;
		}
		let bookId = $('#bookId').val();

		$.ajax({
			type: "DELETE",
			url: "/book/cancel_register_book",
			data: {"userId" : userId, "bookId":bookId},
			success: function(data) {
				if (data.code == 1) {
					alert(data.result);
					location.reload();
				}  else if (data.code == 401) {
					alert(data.result);
					location.reload();
				} else {
					alert("failed. Please retry.");
				}
			},
			error: function(error) {
				alert("failed to borrow. please inquire to admins.");
			}
		});
	});

	$('#modifyBtn').on('click', function() {
		alert("수정하기(admin)");
	});

	$('#returnBtn').on('click', function(e) {
		e.preventDefault();
		alert("return?");
		let bookId = $('#bookId').val();

		$.ajax({
			url: "/book/return_book",
			data: {"bookId" : bookId},
			success: function(data) {
				if (data.code == 1) {
					alert(data.result);
					location.href = "/main/book_info_view?bookId=" + bookId;
				} else if (data.code == 400) {
					alert(data.result);
				} else if (data.code == 401) {
					alert(data.result);
				} else if (data.code == 500) {
					alert(data.result);
				} else if (data.code == 501) {
					alert(data.result);
				}
				else {
					alert("failed. Please retry.");
				}
			},
			error: function(error) {
				alert("failed to return. please inquire to admins.");
			}
		});
	});
});
</script>