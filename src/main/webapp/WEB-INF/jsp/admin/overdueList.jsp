<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="section1">
	<div class="radio w-50 d-flex justify-content-center">
		<label><input type="checkbox" id="isPassDueDate" value="O" <c:if test="${checked ne null}">checked</c:if>>  passed</label>
	</div>
	<table class="table">
		<thead>
			<tr>
				<th class="col-7">Title</th>
				<th class="col-2">Return Date</th>
				<th class="col-1">User ID</th>
				<th class="col-2">days left / passed</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="bookList" items="${overdueBookList}" varStatus="vs">
			<tr>
				<td class="col-7"><a href="/main/book_info_view?bookId=${bookList.id}">${bookList.title}</a></td>
				<td class="col-2"><small><fmt:formatDate value="${overdueBookStatusList.get(vs.index).dueDate}" pattern="MM.d"/></small></td>
				<td class="col-1">${overdueUserList.get(vs.index).getUserId()}</td>

					<fmt:formatNumber var="date" type="number" value="${Math.floor((overdueBookStatusList.get(vs.index).dueDate.getTime() - nowDate.getTime()) / (1000 * 60 * 60 * 24)) + 1}"/>
					<c:if test="${date < 0}">
						<td class="col-2 text-danger">
							${-date} days passed
						</td>
					</c:if>
					<c:if test="${date > 0}">
						<td class="col-2 text-primary">
							${date} days left
						</td>
					</c:if>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>

<script>
$(document).ready(function() {
	$('#isPassDueDate').on('change', function() {
		var cb = document.querySelector('#isPassDueDate');
		if (cb.checked) {
			var isPassedCheck = "passed";
		} else if (!cb.checked) {
			var isPassedCheck = null;
		}

		if (isPassedCheck != null) {
			$.ajax({
				url: "/admin/overdue_user_view?isPassedCheck=passed",
				data: {"isPassedCheck" : isPassedCheck},
				success: function(data) {
					location.href="/admin/overdue_user_view?isPassedCheck=passed"
				},
				error: function(error) {
					alert("failed filtering. please inquire to admins.");
				}
			});
		} else {
			$.ajax({
				url: "/admin/overdue_user_view",
				data: {"isPassedCheck" : isPassedCheck},
				success: function(data) {
					location.href="/admin/overdue_user_view"
				},
				error: function(error) {
					alert("failed filtering. please inquire to admins.");
				}
			});
		}
	});
});
</script>