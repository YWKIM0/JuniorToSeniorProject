<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>

<style>
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

.admin {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 1.8rem;
	margin: 10px;
}

.pd {
	align-items: center;
	padding: 110px 100px 10px 100px;
	
}

.card-body {
	font-size: 15px;
	background: #FAF3E6;
}

body {
	background:#D8E0A5;
}

#qna,
#regSnr,
#mngRpt,
#lgLst {
	font-size: 25px;
	height:50px;
}
</style>

<%@ include file="header.jsp"%>

<%-- <%
if ( !(userId.equals("admin")) || userId == null) {
response.sendRedirect("main");
}
%> --%> 
<%
	if ( !(userId.equals("admin")) ) {
	response.sendRedirect("main");
	}
%> 

<body>
<div class="pd">
<div class="admin">관리자 페이지</div>

	<div class="row row-cols-1 row-cols-md-4 g-4">
		<div class="col">
			<div class="card">
				<button id="qna" class="btn btn-success"
					onclick="location.href ='boardList'">문의 답변</button>
				<div class="card-body">
					<p class="card-text">
						<br>문의 게시판에 남겨진 질문 목록에 답변합니다.<br>
						<br>
					</p>
				</div>
			</div>
		</div>
		<div class="col">
			<div class="card">
				<button id="regSnr" class="btn btn-success"
					onclick="location.href ='verifySenior'">시니어 등록 관리</button>
				<div class="card-body">
					<p class="card-text">
						<br>시니어 사용자가 제출한 신분증 사본과 범죄 이력 조회 캡처본을 확인하고, 승인 또는 거절 처리를 하여
						서비스 접근 권한을 부여하거나 제한합니다.<br>
						<br>
					</p>
				</div>
			</div>
		</div>
		<div class="col">
			<div class="card">
				<button id="mngRpt" class="btn btn-success"
					onclick="location.href ='reportedList'">신고 관리</button>
				<div class="card-body">
					<p class="card-text">
						<br>부모 사용자가 신고한 내역을 확인하고, 신고 사유를 파악하여 '신고 반려' 처리를 하거나 해당 시니어
						사용자 '경고' 처리를 할 수 있습니다. 2회 이상 경고가 누적된 경우에는 '블랙 회원 등록' 기능으로 서비스 접근
						권한을 제한합니다. <br>
						<br>
					</p>
				</div>
			</div>
		</div>
		<div class="col">
			<div class="card">
				<button id="lgLst" class="btn btn-success"
					onclick="location.href ='matchingLogList'">매칭 / 동행 이력 조회</button>
				<div class="card-body">
					<p class="card-text">
						<br>전체 사용자의 매칭 이력 및 동행 여부를 조회할 수 있습니다.<br>
						<br>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>