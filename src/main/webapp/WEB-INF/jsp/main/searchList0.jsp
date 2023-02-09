<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${bookList eq null}">
	<div class="d-flex justify-content-center mt-5">No search results.</div>
</c:if>
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