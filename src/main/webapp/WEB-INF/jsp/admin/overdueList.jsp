<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="section1">
	<table class="table">
		<thead>
			<tr>
				<th class="col-8">Title</th>
				<th class="col-2">Return Date</th>
				<th class="col-1">UserId</th>
				<th class="col-1">rand</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="bookList" items="${overdueBookList}" varStatus="vs">
			<tr>
				<td class="col-8"><a href="/post/post_view?postId=${bookList.id}">${bookList.title}</a></td>
				<td class="col-2"><small><fmt:formatDate value="${overdueBookStatusList.get(vs.index).dueDate}" pattern="MM.d"/></small></td>
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