<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="d-flex justify-content-end col-2"></div>
<span class="display-4 d-flex justify-content-center col-8"><a href="/main/template">Digital Library</a></span>
<div class="d-flex justify-content-end col-2">
	<c:if test="${empty userId}">
		<div class="d-flex align-items-end">
			<a href="/user/sign_in_view" class="mr-3">로그인</a><a href="/user/sign_up_view" class="ml-3">회원가입</a>
		</div>
	</c:if>
	<section class="d-flex align-items-end">
	<c:if test="${not empty userId}">
		<div>
			<span>Hello <a href="/user/user_profile_view">${userName}</a>!</span><br>
			<a href="/user/sign_out" class="d-flex justify-content-end">Log out</a>
		</div>
		<%-- <c:if test="${empty id}">d-none</c:if> --%>
		<!-- I attempted to block the user from using the library when they are reseting their password. -->
	</c:if>
	</section>
</div>