<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<section class="section1 d-flex justify-content-center mt-3 pb-2">
	<input type="text" class="d-none" id="bookId" value="${book.id}">
	<div class="bookInfoBox2">
	<h1 id="font1" class="ml-5">${book.title}</h1>
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
				<div class="col-9 mt-5" id="font2">
					<div class="d-flex align-items-center">
						<div id="font2">
							<h4 class="font-weight-normal">Author : ${book.author}</h4>
							<h4 class="font-weight-normal">ISBN : ${book.isbn}</h4>
							<h4 class="font-weight-normal">Publisher : ${book.publisher}</h4>
							<h4 class="font-weight-normal">Date : ${book.year}</h4>
							<h4 class="font-weight-normal">Category : ${book.category}</h4>
						</div>
					</div>
						

				</div>
					<c:if test="${book.status ne 0}">
						<div class="d-flex justify-content-end align-items-start mr-5"><img src="https://cdn.pixabay.com/photo/2016/01/20/18/35/x-1152114_960_720.png" width="35"></div>
					</c:if>
					<c:if test="${book.status eq 0}">
						<div class="d-flex justify-content-end align-items-start mr-5"><img src="https://cdn.pixabay.com/photo/2016/01/20/18/59/confirmation-1152155_960_720.png" width="35"></div>
					</c:if>
			</div>
		</div>
		<div class="d-flex justify-content-center mt-5">
			<div class="bookStatusBox ml-5">
				<div class="d-flex"><h4>Status : </h4>
							<c:if test="${book.status eq 0}">
								<span class="d-flex align-items-center ml-3 mb-1 text-success">Available</span>
							</c:if>
							<c:if test="${book.status eq 1}">
								<span class="d-flex align-items-center ml-3 text-warning">Borrowed</span>
							</c:if>
							<c:if test="${book.status eq 2}">
								<span class="d-flex align-items-center ml-3 text-danger">In Reservation</span>
							</c:if>
						</div>
						<c:if test="${borrowedUser eq userLoginId}">
							<div class="d-flex my-2"><h4>Return Date : </h4><span class="d-flex align-items-center ml-3"><fmt:formatDate value="${dueDate}" pattern="MM.dd(E)" /></span></div>
						</c:if>
						<c:if test="${book.status ne 0}">
							<div class="d-flex my-2"><h4>Reservation Number : </h4><span class="d-flex align-items-center ml-3" id="resNum">${registerNum}</span></div>
							<c:if test="${userType eq 0}">
								<div class="d-flex my-2"><h4>Borrower : </h4><span class="d-flex align-items-center ml-3">${borrowedUser}</span></div>
							</c:if>
						</c:if>
							<div class="d-flex mt-4"><h4>Rating : <c:if test="${book.point ne 0}">${book.point}</c:if></h4></div>
						<div class="d-flex justify-content-end">
							<c:if test="${temp ne null && firstInLine eq null}"><span class="text-danger">There is a waiting list. Please try another day.</span></c:if>
							<c:if test="${(book.status eq 0 && temp eq null) || (firstInLine ne null && temp ne null)}"><button type="button" id="borrowBtn" class="btn btn-success">Borrow</button></c:if>
							<c:if test="${(book.status eq 1 || book.status eq 2) && borrowedUser eq null && registeredUser eq null}"><button type="button" id="reserveBtn" class="mx-4 btn btn-primary">Place Hold</button></c:if>
							<c:if test="${book.status eq 2 && registeredUser ne null}"><button type="button" id="cancelReserveBtn" class="mx-4 btn btn-danger">Cancel Reservation</button></c:if>
							<c:if test="${borrowedUser eq userLoginId}">
								<button type="button" id="returnBtn1" class="mx-4 btn btn-danger">Return</button>
								<div class="d-flex justify-content-end" id="returnConfirm">
									<!-- <input type="number" min='0' max="5" name="point" id="point" class="form-control d-none" placeholder="1 to 5"> -->
									<div class="star-rating d-none" id="point" name="point">
										<input type="radio" id="5-star" name="rating" value="5" />
										<label for="5-star" class="star">★</label>
										<input type="radio" id="4-star" name="rating" value="4" />
										<label for="4-star" class="star">★</label>
										<input type="radio" id="3-star" name="rating" value="3" />
										<label for="3-star" class="star">★</label>
										<input type="radio" id="2-star" name="rating" value="2" />
										<label for="2-star" class="star">★</label>
										<input type="radio" id="1-star" name="rating" value="1" />
										<label for="1-star" class="star">★</label>
									</div>
									<button type="button" id="returnBtn2" class="d-none mx-4 btn btn-danger">Return</button>
								</div>
							</c:if>
							<c:if test="${userType eq 0}"><button type="button" id="modifyBtn" class="btn btn-secondary">Edit</button></c:if>
						</div>
			</div>
		</div>
	</div>
</section>
<script>
$(document).ready(function() {
	$('#modifyBtn').on('click', function() {
		alert("수정하기(admin)");
		location.href="/admin/update_book_view?bookId=" + $('#bookId').val();
	});

	$('#returnBtn1').on('click', function() {
		$('#point').removeClass("d-none");
		$('#returnBtn1').addClass("d-none");
		$('#returnBtn2').removeClass("d-none");
	});

	$('#returnBtn2').on('click', function(e) {
		e.preventDefault();
		/* var confirm = confirm("return?"); */
		let isTrue = confirm("Are you sure to return this book?");
		if (isTrue) {
		let bookId = $('#bookId').val();
		let point = $('input[name=rating]:checked').val();
		if (point == "") {
			alert("Please enter your rating of this book.");
			return;
		} else if (point < 0.1 || point > 5) {
			alert("Your ratings should be between 1 to 5.");
			return;
		}

		$.ajax({
			url: "/book/return_book",
			data: {"bookId" : bookId, "point" : point},
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
		}
	});
	
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
				} else if (data.code == 403) {
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
		let isTrue = confirm("Are you sure to cancel your reservation?");
		if (isTrue) {
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
		}
	});
});
</script>