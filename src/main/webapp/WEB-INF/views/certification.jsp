<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>인증 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
* {
	margin: 0 auto;
	padding: 0 auto;
}

body {
	background-color: #FAF3E6;
	text-align: center;
}

.certification {
	border: 0;
	outline: none;
	font-size: 20px;
	margin-top: 50px;
	background: orange;
	color: white;
	padding: 10px;
	cursor: pointer;
	border-radius: 10px;
}

.formdiv {
	background-color:white;
	margin-top: 100px;

	border-radius: 12px;
	width: 900px;
	display: inline-block;
}
</style>
</head>
<body>
	<%@include file="header.jsp"%>s
	<h1 style="margin-top: 100px;">시니어 인증</h1>
	<div class="formdiv">
		<form id="uploadForm" action="/certification/upload" method="post"
			enctype="multipart/form-data">
			<h3 style="font-size: 2rem">신분증사진</h3>

			<input class="certification" type="file" name="idcFile"
				class="picture" onchange="previewImage(this, 'idcPreview')"
				title="사진 선택" /><br> <img id="idcPreview" src="#"
				alt="IDC Preview"
				style="max-width: 300px; max-height: 200px; display: none; position: relative; left: 33%; margin-top: 20px;" /><br>
			<br>

			<h3 style="font-size: 2rem">범죄경력조회사진</h3>
			<Br> <a
				href="https://crims.police.go.kr/uat/uia/egovLoginUsr.do"
				style="font-size: 20px; border-bottom: 1px solid black;">범죄경력조회하러가기</a><br>
			<input class="certification bottom" type="file" name="cmnFile"
				class="picture" onchange="previewImage(this, 'cmnPreview')"
				title="사진 선택" /><br> <img id="cmnPreview" src="#"
				alt="CMN Preview"
				style="max-width: 300px; max-height: 200px; display: none; position: relative; left: 33%; margin-top: 20px;" /><br>
			<br> <input type="submit" value="인증하기" id="uploadButton"
				class="btn btn-success" disabled style="margin-bottom: 10px;" />
		</form>
	</div>
	<script>
        var pictureInputs = document.getElementsByClassName('picture');

        function checkInputs() {
            var allFilled = true;

            // Check if all picture inputs have values
            for (var i = 0; i < pictureInputs.length; i++) {
                if (!pictureInputs[i].value) {
                    allFilled = false;
                    break;
                }
            }

            // Enable or disable the upload button based on input values
            var uploadButton = document.getElementById('uploadButton');
            uploadButton.disabled = !allFilled;
        }

        function previewImage(input, previewId) {
            var previewElement = document.getElementById(previewId);
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    previewElement.src = e.target.result;
                    previewElement.style.display = 'block';
                };
                reader.readAsDataURL(input.files[0]);
            } else {
                previewElement.src = '#';
                previewElement.style.display = 'none';
            }

            checkInputs();
        }

        // Add event listeners to picture inputs
        for (var i = 0; i < pictureInputs.length; i++) {
            pictureInputs[i].addEventListener('change', function() {
                var previewId = this.getAttribute('data-preview');
                previewImage(this, previewId);
            });
        }
    </script>
</body>
</html>
