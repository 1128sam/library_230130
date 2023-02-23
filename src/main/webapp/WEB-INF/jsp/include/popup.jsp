<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Borrowed Books</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="/static/css/style.css">
</head>
<body>
<div class="section1 bg-white">
	<table class="table">
		<thead>
			<tr>
				<th class="col-8">Title</th>
				<th class="col-2">Return Date</th>
				<th class="col-1">UserId</th>
				<th class="col-1">days left/passed</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="bookList" items="${overdueBookList}" varStatus="vs">
			<tr>
				<td class="col-8"><a href="/main/book_info_view?bookId=${bookList.id}">${bookList.title}</a></td>
				<td class="col-2"><small><fmt:formatDate value="${bsl.get(vs.index).dueDate}" pattern="MM.d"/></small></td>
				<td class="col-1">${overdueUserList.get(vs.index).getUserId()}</td>

					<fmt:formatNumber var="date" type="number" value="${Math.floor((overdueBookStatusList.get(vs.index).dueDate.getTime() - nowDate.getTime()) / (1000 * 60 * 60 * 24)) + 1}"/>
					<c:if test="${date < 0}">
						<td class="col-1 text-danger">
							${-date} days passed
						</td>
					</c:if>
					<c:if test="${date > 0}">
						<td class="col-1 text-primary">
							${date} days left
						</td>
					</c:if>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>