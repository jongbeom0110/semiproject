<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Untree.co">
<link rel="shortcut icon" href="favicon.png">
<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap4" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&family=Source+Serif+Pro:wght@400;700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="resources/assets/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="resources/assets/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="resources/assets/fonts/icomoon/style.css">
<link rel="stylesheet"
	href="resources/assets/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="resources/assets/css/daterangepicker.css">
<link rel="stylesheet" href="resources/assets/css/aos.css">
<link rel="stylesheet" href="resources/assets/css/style.css">

<!-- 추가된 css -->
<link rel="stylesheet"
	href="resources/assets/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="resources/assets/assets/css/font-awesome.min.css">
<link rel="stylesheet"
	href="resources/assets/assets/css/themify-icons.css">
<link rel="stylesheet" href="resources/assets/assets/css/metisMenu.css">
<link rel="stylesheet"
	href="resources/assets/assets/css/slicknav.min.css">
<!-- amchart css -->
<link rel="stylesheet"
	href="https://www.amcharts.com/lib/3/plugins/export/export.css"
	type="text/css" media="all" />
<!-- others css -->
<link rel="stylesheet" href="resources/assets/assets/css/typography.css">
<link rel="stylesheet"
	href="resources/assets/assets/css/default-css.css">
<link rel="stylesheet" href="resources/assets/assets/css/styles.css">
<link rel="stylesheet" href="resources/assets/assets/css/responsive.css">
<!-- modernizr css -->
<script src="resources/assets/assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<title>회원목록</title>
<!-- 모바일 메뉴 -->
<div class="site-mobile-menu site-navbar-target">
	<div class="site-mobile-menu-header">
		<div class="site-mobile-menu-close">
			<span class="icofont-close js-menu-toggle"></span>
		</div>
	</div>
	<div class="site-mobile-menu-body"></div>
</div>
<jsp:include page="sidebar.jsp" />

<!-- 히어로 섹션 -->
<div class="hero hero-inner"
	style="background-color: rgb(105, 152, 171)">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-6 mx-auto text-center">
				<div class="intro-wrap">
					<h1 class="mb-0">회원목록</h1>
					<p class="text-white">"우리 길나들이고의 소중한 회원들의 목록입니다. 이곳에서 각 회원의 정보를
						확인하시고, 서로 더 가까워질 수 있는 기회를 만들어 보세요."</p>
				</div>
			</div>
		</div>
	</div>
</div>

<section class="section">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-11">
				<div class="card mb-5">
					<div class="card-body">
						<div class="pt-4 pb-4">
							<form action="mSearch" method="GET">
								<div class="row">
									<div class="col-md-6">
										<select name="category" class="form-control">
											<option value="MID">아이디</option>
											<option value="MNAME">이름</option>
											<option value="MPHONE">연락처</option>
										</select>

									</div>
									<div class="col-md-4">
										<input type="text" class="form-control" name="keyword">
									</div>
									<div class="col-md-2">
										<button type="submit" class="btn btn-primary">검색</button>
									</div>
								</div>

								<!-- Entries per page -->
								<c:if test="${pages ne 0}">
									<div class="row mt-3">
										<div class="col-md-12 text-right">
											<select id="limit" class="form-control">
												<option value="5">회원명수</option>
												<option value="5">5명씩</option>
												<option value="10">10명씩</option>
												<option value="20">20명씩</option>
											</select>
										</div>
									</div>
								</c:if>
							</form>
							<!-- Table -->
							<table class="table table-hover mt-4">
								<thead>
									<tr>
										<th scope="col">아이디</th>
										<th scope="col">이름</th>
										<th scope="col">성별</th>
										<th scope="col">생년월일</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach var="list" items="${memberList}">
										<tr>
											<td>${list.MId}</td>
											<td><a href="mView?mId=${list.MId}">${list.MName}</a></td>
											<td>${list.MGender}</td>
											<td>${list.MBirth}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- Pagination -->
							<nav aria-label="Page navigation">
								<ul class="pagination justify-content-center">
									<!-- Previous -->
									<c:if test="${paging.page <= 1}">
										<li class="page-item disabled"><a class="page-link"
											href="#" tabindex="-1" aria-disabled="true">이전</a></li>
									</c:if>
									<c:if test="${paging.page > 1}">
										<li class="page-item"><a class="page-link"
											href="list?page=${paging.page-1}&limit=${paging.limit}">이전</a>
										</li>
									</c:if>
									<!-- Page Numbers -->
									<c:forEach var="i"
										begin="${paging.startPage > 0 ? paging.startPage : 1}"
										end="${paging.endPage}">
										<li
											class="page-item <c:if test='${paging.page == i}'>active</c:if>">
											<a class="page-link"
											href="list?page=${i}&limit=${paging.limit}">${i}</a>
										</li>
									</c:forEach>

									<!-- Next -->
									<c:if test="${paging.page >= paging.maxPage}">
										<li class="page-item disabled"><a class="page-link"
											href="#" tabindex="-1" aria-disabled="true">다음</a></li>
									</c:if>
									<c:if test="${paging.page < paging.maxPage}">
										<li class="page-item"><a class="page-link"
											href="list?page=${paging.page+1}&limit=${paging.limit}">다음</a>
										</li>
									</c:if>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- 콜 투 액션 섹션 -->
<div class="py-5 cta-section">
	<div class="container">
		<div class="row text-center">
			<div class="col-md-12">
				<h2 class="mb-2 text-white">여행을 더 쉽게 계획하세요. 궁금한 점 있으면 언제든
					문의하세요.</h2>
				<p class="mb-4 lead text-white text-white-opacity">Plan your
					trip easier. Feel free to contact us if you have any questions.</p>
				<p class="mb-0">
					<a href="contact.html"
						class="btn btn-outline-white text-white btn-md font-weight-bold">문의하기</a>
				</p>
			</div>
		</div>
	</div>
</div>
<!-- 푸터 섹션 -->
<div class="site-footer">
	<%@ include file="footer.jsp"%>
</div>

<!-- 스크립트 -->
<script src="resources/assets/js/jquery-3.4.1.min.js"></script>
<script src="resources/assets/js/popper.min.js"></script>
<script src="resources/assets/js/bootstrap.min.js"></script>
<script src="resources/assets/js/owl.carousel.min.js"></script>
<script src="resources/assets/js/jquery.animateNumber.min.js"></script>
<script src="resources/assets/js/jquery.waypoints.min.js"></script>
<script src="resources/assets/js/jquery.fancybox.min.js"></script>
<script src="resources/assets/js/aos.js"></script>
<script src="resources/assets/js/moment.min.js"></script>
<script src="resources/assets/js/daterangepicker.js"></script>
<script src="resources/assets/js/bootstrap.bundle.min.js"></script>
<script src="resources/assets/js/typed.js"></script>

<script src="resources/assets/js/custom.js"></script>


<!-- 추가된 js -->
<script src="resources/assets/assets/js/scripts.js"></script>
</body>
<script>
        $("#limit").change(() => {
            let limit = $('#limit').val();
            location.href = `list?limit=` + limit;
        });
    </script>
</body>
</html>