<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section class="search d-flex justify-content-center">
	<div
		class="col-5 input-group d-flex justify-content-center align-items-end mb-3">
		<div id="search" class="d-flex w-100">
			<input type="text" class="form-control">
			<button id="searchBtn" class="btn btn-secondary" type="button">검색</button>
		</div>
	</div>
</section>

<div class="radio mt-1 d-flex justify-content-center">
	<div class="col-7 d-flex justify-content-around align-items-start">
		<label for="general"> <input type="radio" id="general"
			name="searchType" value="general" checked> <span
			class="searchTypeRadio">전체</span>
		</label> <label for="title"> <input type="radio" id="title"
			name="searchType" value="title"> <span
			class="searchTypeRadio">서명</span>
		</label> <label for="author"> <input type="radio" id="author"
			name="searchType" value="author"> <span
			class="searchTypeRadio">저자</span>
		</label> <label for="publisher"> <input type="radio" id="publisher"
			name="searchType" value="publisher"> <span
			class="searchTypeRadio">발행처</span>
		</label> <label for="issn"> <input type="radio" id="issn"
			name="searchType" value="issn"> <span class="searchTypeRadio">ISBN/ISSN</span>
		</label>
	</div>
</div>