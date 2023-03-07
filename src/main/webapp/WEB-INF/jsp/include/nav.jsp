<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="menu col-8">
	<ul class="nav nav-fill">
		<c:if test="${userType eq 0}">
		<li class="nav-item"><a href="/admin/admin_view" class="nav-link">Admin</a></li></c:if>
		<li class="nav-item"><a href="/main/category_list_view" class="nav-link">Category</a></li>
		<li class="nav-item"><a href="/post/post_list_view?type=info&page=1" class="nav-link">Notice</a></li>
		<li class="nav-item"><a href="/post/post_list_view?type=rec&page=1" class="nav-link">Recommendation</a></li>
	</ul>
</nav>