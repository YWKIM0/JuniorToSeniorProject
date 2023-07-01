<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>
<link href="${path}/resources/css/table1.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}

	#container {
		width: 100%;
	}
	.table {
		width: 80%;
		margin: auto;
		text-align: center;
	}
	a {
		text-decoration: none;
	}
	
	.btn {
		margin-top: 15px;
	}
	.emphasis {
		text-emphasis: sesame #198754;
		-webkt-text-emphasis: sesame #e5c046; 
	}
	
</style>
</head>
<body>
	<h1 style="text-align: center"><span class="emphasis">관리자</span>에게 <span class="emphasis">문의</span>하기</h1>
	<div id="container">
		<div style="margin-right: 130px; text-align: right">
			<c:if test="${sessionScope.userId != 'admin' }">
				<button type="button" class="btn btn-secondary" onclick="location.href='/addNewArticle'">문의하기</button>
			</c:if>
		</div>
		<table>
		<!-- <table class="table table-bordered" style="width: 80%; margin-top: 20px;"> -->
			<tr>
				<th class="table-secondary" style="width: 10%">NO</th>
				<th class="table-secondary" style="width: 35%">제목</th>
				<th class="table-secondary" style="width: 15%">작성자</th>
				<th class="table-secondary" style="width: 30%">작성일</th>
				<th class="table-secondary" style="width: 10%">조회수</th>
			</tr>
			<c:forEach var="item" items="${articleList}">
				<tr>
					<td>${item.articleNo}</td>
					<td style="text-align: left">
						<c:if test="${item.parentNo > 0}">
							&nbsp;&nbsp;&nbsp; RE: 
						</c:if>
						<a href="/viewArticle?articleNo=${item.articleNo}">${item.title}</a></td>
					<td>${item.id}</td>
					<td>${item.createdAt}</td>
					<td>${item.views}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div style="text-align: center">
	<c:if test="${prev}">
		<span><a href="/boardList?num=${startPageNum - 1}">
			<button class="btn btn-primary">이전</button>
		</a>
		</span>
	</c:if>

		<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
			<span> <c:if test="${select != num}">
					<a href="/boardList?num=${num}"><button type="button" class="btn btn-light">${num}</button></a>
				</c:if> <c:if test="${select == num}">
					<button type="button" class="btn btn-success"><b>${num}</b></button>
				</c:if>

			</span>
		</c:forEach>

		<c:if test="${next}">
		<span><a href="/boardList?num=${endPageNum + 1}">
				<button class="btn btn-ligth">다음</button>
			</a>
		</span>
	</c:if>
	</div>
	
</body>
</html>