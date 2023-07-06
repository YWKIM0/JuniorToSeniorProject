<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<style>
.rptList {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 1.8rem;
	margin: 10px;
}

.pd {
	align-items: center;
	padding: 110px 50px 110px 50px;
}

#idBtn {
	font-weight: bold;
	color: green;
	
}

@charset "UTF-8";

@font-face {
	font-family: 'omyu_pretty';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

* {
	text-align: center;
	font-family: 'omyu_pretty';
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	background: #D8E0A5;
}
#table {
	border-collapse: separate;
	border-spacing: 0;
	text-align: center;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	margin: 0 auto;
	background: #FAF3E6;
}

th {
	background: #198754;
	color: #fff;
	text-align: center;
	height: 50px;
	width: 15px;
	font-size: 20px;
}

th:nth-child(1),
th:nth-child(8){
	padding-left: 15px;
	padding-right: 15px;
}

th:nth-child(2),
th:nth-child(3),
th:nth-child(4),
th:nth-child(6),
th:nth-child(7){
	padding-left: 20px;
	padding-right: 20px;
}

th:nth-child(5){
	padding-left: 70px;
	padding-right: 70px;
}

tr:first-child th:first-child {
	border-top-left-radius: 6px;
}

tr:first-child th:last-child {
	border-top-right-radius: 6px;
}

td {
	border-right: 1px solid #c6c9cc;
	border-bottom: 1px solid #c6c9cc;
	height: 50px;
}

td:first-child {
	border-left: 1px solid #c6c9cc;
}

tr:last-child td:first-child {
	border-bottom-left-radius: 6px;
}

tr:last-child td:last-child {
	border-bottom-right-radius: 6px;
}

</style>

<%@ include file="header.jsp"%>

<%
if ( !(userId.equals("admin")) ) {
response.sendRedirect("main");
}
%> 

<div class="pd">
<div class="rptList">신고 목록</div>

<body>
	<table id="table">
		<thead>
			<tr>
				<th>NO.</th>
				<th>신고자아이디</th>
				<th>시니어아이디</th>
				<th>이름</th>
				<th>신고사유</th>
				<th>신고일자</th>
				<th>신고처리상태</th>
				<th>경고누적횟수</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="list" items="${reportedList}">
				<tr>
					<td>${list.reportNum}</td>
					<td>${list.parentId}</td>
					<td><a id="idBtn" href="reportedList?seniorId=${list.seniorId}">${list.seniorId}</a></td>
					<td>${list.name}</td>
					<td style="max-width: 200px; word-break: break-all;">${list.reportedReason}</td>
					<td>${list.reportDate}</td>
					<td><c:choose>
							<c:when test="${list.reportConfirmStatus eq 'N' && list.reportCount eq 3}">처리완료</c:when>
							<c:when test="${list.reportConfirmStatus eq 'N'}">접수상태</c:when>
							<c:when test="${list.reportConfirmStatus eq 'Y'}">처리완료</c:when>
							<c:when test="${list.reportConfirmStatus eq 'Rejected'}">신고반려</c:when>
						</c:choose></td>
					<td>${list.reportCount}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<!-- 페이징 처리 부분 -->
	<div style="text-align: center">
	<c:if test="${prev}">
		<span>
		<a href="/reportedList?num=${startPageNum - 1}">
			<button class="btn btn-success" style="margin-top: 10px">이전</button>
		</a>
		</span>
	</c:if>

		<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
			<span> <c:if test="${select != num}">
					<a href="/reportedList?num=${num}"><button type="button" class="btn btn-light" style="margin-top: 10px">${num}</button></a>
				</c:if> <c:if test="${select == num}">
					<button type="button" class="btn btn-success" style="margin-top: 10px"><b>${num}</b></button>
				</c:if>

			</span>
		</c:forEach>

		<c:if test="${next}">
		<span>
			<a href="/reportedList?num=${endPageNum + 1}">
				<button class="btn btn-success" style="margin-top: 10px">다음</button>
			</a>
		</span>
	</c:if>
	</div>
	<!-- 페이징 처리 끝 부분 -->

</body>
</div>
</html>