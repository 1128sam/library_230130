<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<div class="d-flex justify-content-center">
		<section class="mt-4">
		<div class="categoryBox d-flex justify-content-between">
		<c:forEach var="var" begin="1" end="3">
			<div class="sectionBox"><a href="/main/search_list_view?category=${var*100}">
				<div class="h-100 d-flex justify-content-center align-items-center" id="font2">${var*100}</div></a>
			</div>
		</c:forEach>
		</div>
		<div class="categoryBox d-flex justify-content-between">
		<c:forEach var="var" begin="4" end="6">
			<div class="sectionBox"><a href="/main/search_list_view?category=${var*100}">
				<div class="h-100 d-flex justify-content-center align-items-center" id="font2">${var*100}</div></a>
			</div>
		</c:forEach>
		</div>
		<div class="categoryBox d-flex justify-content-between">
		<c:forEach var="var" begin="7" end="9">
			<div class="sectionBox"><a href="/main/search_list_view?category=${var*100}">
				<div class="h-100 d-flex justify-content-center align-items-center" id="font2">${var*100}</div></a>
			</div>
		</c:forEach>
		</div>
		</section>
		</div>

<script>
$(document).ready(function() {
	$('#searchBtn').on('click', function() {
		var search = $('#search').val().trim();
		var searchType = $("input[name='searchType']:checked").val();
		
		$.ajax({
			url: "/search/search_engine",
			data: {"search" : search, "searchType" : searchType},
			success: function(data) {
				if (data.code == 1) {
					location.href = "/main/search_list_view";
				} else {
					alert("This shit didn't work.");
				}
			},
			error: function(error) {
				alert("failed searching. please inquire to admins.");
			}
		});
		
		/* $.ajax({
			url: "/get_json",
			
			success: function(data) { // data: json으로 구성{"result": "데이터들"}
				$('#div').append("<div>" + data.result + "</div>");
			}
		});
		
		$.ajax({
			url: "/view",
			
			success: function(data) { // html 태그들 자체가 내려옴
				$('#div').html(data); // 이전 내용을 지우고 새로운 내용을 넣는다.
			}
		}); */
	});
});
</script>