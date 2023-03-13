<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@1,200;1,300&family=Kanit:wght@700&display=swap');
</style>
<nav class="menu col-8">
	<ul class="nav nav-fill">
		<c:if test="${userType eq 0}">
		<li class="nav-item"><a href="/admin/admin_view" id="font2" class="nav-link"><b>Admin</b></a></li></c:if>
		<li class="nav-item"><a href="/main/category_list_view" id="font2" class="nav-link"><b>Category</b></a></li>
		<li class="nav-item"><a href="/post/post_list_view?type=info&page=1" id="font2" class="nav-link"><b>Notice</b></a></li>
		<li class="nav-item"><a href="/post/post_list_view?type=rec&page=1" id="font2" class="nav-link"><b>Recommendation</b></a></li>
	</ul>
</nav>