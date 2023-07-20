<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sms_cf</title>
<style type="text/css">
input{
margin-bottom: 10px;

}

</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>



</head>
<body>
	<div class="container"></div>
	
	<div id="contents">
			<br>
			휴대전화 : <input type="text" id="phoneNum" name="phoneNumber" placeholder="숫자만 입력해주세요" />
			<input type="button" id="send" value="전송" /><br>
			인증번호 : <input type="text" id="authNum">
			<input type="button" id="enterBtn" value="확인">
			<input type="hidden" id="checkAuth" name="checkAuth"  placeholder="인증번호 대조">
			<input type="hidden" name="smsPass" id="smsPass" placeholder="인증상태">

	</div>
	<script>
    $(document).ready(function() {
      $("#send").click(getPhoneNumber);
      $("#enterBtn").click(compareAuthNumber);
    });
    

    function getPhoneNumber() {
    	  var phoneNumber = $("#phoneNum").val();
    	  var regPhone= /^01([0|1|6|7|8|9])?([0-9]{3,4})?([0-9]{4})$/;
    	  
    	  
    	  if (phoneNumber === "" || phoneNumber === null) {
    	    alert("전화번호를 입력해주세요.");
    	  }
    	  if (regPhone.test(phoneNumber) != true) {
    		 
      	    alert("숫자만 입력 가능합니다.");
			return false;
      	  } 
    	  
    	  else {
    	    var con_test = confirm("해당번호로 인증문자를 발송하시겠습니까?");
    	    if (con_test == true) {
    	      $.ajax({
    	        type :"post",
    	        url: "/sendSms",
    	        data: {
    	          "phoneNum": phoneNumber
    	        },
    	        success: function(response) {
    	            // 인증 번호를 체크 값에 저장합니다.
    	            $("#checkAuth").val(response.authNumber);
    	            console.log("전화번호를 전달했으며 성공적으로 난수가 생성되었습니다.");
    	            alert("인증번호를 발송하였습니다.");
    	          },
    	          error: function(request, status, error) {
    	            alert("다시 시도해주세요");
    	          }
    	        });
    	    }
    	  }
    	}

    function compareAuthNumber() {
	

 	
      var authNum = $("#authNum").val();
      var sysNum = $("#checkAuth").val();

      if (authNum == null || authNum == "") {
        alert("휴대폰으로 발송된 인증번호를 입력해주세요");
      } else {
        if (authNum.trim() == sysNum.trim()) {
          alert("인증 성공");
          //성공 이후에 어떻게 할것이냐~~~ 화면 이동? or 어디 요청을 다시? or 인증완료로 기록. 
          $("#smsPass").val(0);		  
        } else {
          alert("인증 실패");
          $("#smsPass").val(1);          
        }
      }
    }
  </script>
  
<!--   이 코드는 SMS 문자 인증 프로세스를 구현한 웹 페이지입니다. -->

<!-- 1. HTML: 사용자에게 휴대전화 번호와 인증번호를 입력할 수 있는 입력란과 '전송' 및 '확인' 버튼을 제공합니다. 또한 인증번호 대조 및 인증상태를 저장하는 데 사용되는 hidden input 필드가 있습니다. -->

<!-- 2. jQuery: 페이지 로드 후, '전송' 버튼을 클릭하면 `getPhoneNumber()` 함수가 실행되며, '확인' 버튼을 클릭하면 `compareAuthNumber()` 함수가 실행됩니다. -->

<!-- 3. `getPhoneNumber()` 함수: -->
<!--    - 전화번호가 유효한지 확인합니다. 유효하지 않으면 에러 메시지를 표시합니다. -->
<!--    - 전화번호가 유효하면 사용자에게 인증 문자를 발송할 것인지 확인하는 메시지 창이 나타납니다. -->
<!--    -자가 확인을 누르면 AJAX 요청을 통해 서버에서 인증 문자를 발송하는 코드를 호출합니다(`/sendSms` URL). 서버로부터 받은 인증 번호는 hidden input 필드에 저장됩니다. -->

<!-- 4. `compareAuthNumber()` 함수: -->
<!--    - 사용자가 입력한 인증번호와 서버에서 받은 인증를 비교합니다. -->
<!--    - 인증번호가 일치하면 "인증 성공" 메시지를 표시하고, 인증 상태(hidden input 필드)를 0으로 설정합니다. -->
<!--    - 인증번호가 일치하지 않으면 "인증 실패" 메시지를 표시하고 인증 상태를 1로 설정합니다. -->

<!-- 위 코드 분석을 통해 이 페이지에서 SMS 문자 인증 과정이 어떻게 실행되는지 파악할 수 있습니다. 사용자는 휴대전화 번호를 입력하고 인증 문자를 받은 후, 인증번호를 입력하여 인증 과정을 완료합니다. 서버 측 코드는 이 예제에 포함되어 있 않으므로, `/sendSms` 경로를 처리하여 실제 SMS 발송 로직을 구현해야 합니다. -->
</body>
</html>
