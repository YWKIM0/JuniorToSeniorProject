<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매칭이력조회</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>
<style>
.mLog {
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

#dtBtn,
#snrIdBtn,
#parIdBtn{
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
th:nth-child(6),
th:nth-child(9){
	padding-left: 30px;
	padding-right: 30px;
}

th:nth-child(4),
th:nth-child(5){
	padding-left: 20px;
	padding-right: 20px;
}

th:nth-child(7),
th:nth-child(8){
	padding-left: 50px;
	padding-right: 50px;
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
if ( !(userId.equals("admin")) || userId == null) {
response.sendRedirect("main");
}
%> 

<div class="pd">
<div class="mLog">매칭 이력</div>

<body>
	<table id="table">
		<thead>
			<tr>
				<th>NO.</th>
				<th>시니어 아이디</th>
				<th>부모 아이디</th>
				<th>시작일자</th>
				<th>종료일자</th>
				<th>픽업장소</th>
				<th>도착장소</th>
				<th>매칭상태</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="mList" items="${matchingLogList}">
				<tr>
					<td><a id="dtBtn" href="matchingDetailLog?matchingNumber=${mList.matchingNumber}">${mList.matchingNumber}</a></td>
					<td><a id="snrIdBtn" href="matchingLogList?snrId=${mList.snrId}">${mList.snrId}</a></td>
					<td><a id="parIdBtn" href="matchingLogList?parId=${mList.parId}">${mList.parId}</a></td>
					<td><c:out value="${fn:substring(mList.startDate, 0, 10)}"/></td>
					<td><c:out value="${fn:substring(mList.endDate, 0, 10)}"/></td>
					<td>${mList.pickUpPlace}</td>
					<td>${mList.arrivePlace}</td>
					<td>${mList.status}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 페이징 처리 부분 -->
	<div style="text-align: center">
		<c:if test="${prev}">
			<span>
				<a href="/matchingLogList?num=${startPageNum - 1}">
					<button class="btn btn-success" style="margin-top: 10px">이전</button>
				</a>
			</span>
		</c:if>

		<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
			<span> 
			<c:if test="${select != num and select != null}">
					<a href="/matchingLogList?num=${num}"><button type="button" class="btn btn-light" style="margin-top: 10px">${num}</button></a>
				</c:if> <c:if test="${select == num}">
					<button type="button" class="btn btn-success" style="margin-top: 10px"><b>${num}</b></button>
				</c:if>

			</span>
		</c:forEach>

		<c:if test="${next}">
			<span>
				<a href="/matchingLogList?num=${endPageNum + 1}">
					<button class="btn btn-success" style="margin-top: 10px">다음</button>
				</a>
			</span>
		</c:if>
	</div>
	<!-- 페이징 처리 끝 부분 -->

</body>
</div>
</html>