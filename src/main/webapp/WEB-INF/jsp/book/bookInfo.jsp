<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<section class="section1 d-flex justify-content-center mt-5">
	<div class="bookInfoBox2 d-flex">
		<div class="col-3 h-100 d-flex justify-content-center align-items-center">
			<div class="bookImgBox m-3 d-flex justify-content-center"></div>
		</div>
		<div class="col-9 d-flex align-items-center">
			<div>
				<h3>${book.title}</h3>
				<span class="mt-2">${book.author}</span><br>
				<span class="mt-2">ISBN: ${book.isbn}</span><br>
				<span class="mt-2">Publisher: ${book.publisher}</span><br>
				<span>published year: ${book.year}</span><br>
				<span>category: ${book.category}</span><br>
				<span>status : ${book.status}</span><br>
				<span>point : ${book.point}</span>
			</div>
		</div>
	</div>
</section>