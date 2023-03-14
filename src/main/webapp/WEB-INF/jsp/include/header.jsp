<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@1,700&display=swap" rel="stylesheet">
<div class="d-flex justify-content-end col-2"></div>
<span class="display-4 d-flex justify-content-center col-8"><a href="/main/template" id="font1">Digital Library</a></span>
<div class="d-flex justify-content-end col-2">
	<c:if test="${empty userId}">
		<div class="d-flex align-items-end">
			<a href="/user/sign_in_view" id="font2" class="mr-3">Log in</a><a href="/user/sign_up_view" id="font2" class="ml-3">Sign Up</a>
		</div>
	</c:if>
	<section class="d-flex align-items-end">
	<c:if test="${not empty userId}">
		<div>
			<span id="font2"><b>Hello <a id="font2" href="/user/user_profile_view"><span id="font2">${userName}</span></a>!</b></span><br>
			<a href="/user/sign_out" class="d-flex justify-content-end" id="font2"><b>Log out</b></a>
		</div>
		<%-- <c:if test="${empty id}">d-none</c:if> --%>
		<!-- I attempted to block the user from using the library when they are reseting their password. -->
	</c:if>
	</section>
</div>