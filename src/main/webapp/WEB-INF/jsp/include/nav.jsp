<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="menu col-8">
	<ul class="nav nav-fill">
		<c:if test="${userType eq 0}">
		<li class="nav-item"><a href="/admin/add_book_view" class="nav-link">도서 추가</a></li></c:if>
		<li class="nav-item"><a href="/main/category_list_view" class="nav-link">분류별 보기</a></li>
		<li class="nav-item"><a href="/post/post_list_view?type=info" class="nav-link">공지사항</a></li>
		<li class="nav-item"><a href="/post/post_list_view?type=rec" class="nav-link">도서추천</a></li>
	</ul>
</nav>