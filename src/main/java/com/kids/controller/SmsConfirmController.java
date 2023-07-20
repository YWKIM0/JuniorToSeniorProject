package com.kids.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.kids.dto.SmsResponseDto;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;
//import net.nurigo.sdk.message.model.Message;


@Controller
public class SmsConfirmController {

	
	
	
	final DefaultMessageService messageService;	
	public SmsConfirmController() {
		messageService = NurigoApp.INSTANCE.initialize( "NCSSRKGGR3BRRUES", "3VBZM45JXWK2ZCR95QW8BSDQU9XFPYKB" , "https://api.coolsms.co.kr");
	}

	
	@RequestMapping("/sms_cf")
	public String smsCf() {
		return "sms_cf";
	}
	
	
	/**
     * 단일 메시지 발송 예제
     */
    @PostMapping("/sendSms")
    @ResponseBody
    public SmsResponseDto sendOne(@RequestParam("phoneNum") String phoneNum, HttpServletRequest request) {
    	//net.nurigo.sdk.message.model.Message message = new net.nurigo.sdk.message.model.Message();
    	Message message = new Message();
//    	 인증 번호 난수 생성
    	
    	//미션1. 인증번호 자리수를 고정으로 추출하기
	    int authNumber = (int)Math.floor(Math.random() * 100000) + 10000;
    	
	    
	    //미션2. 뽑아낸 인증번호를 문자로 전송하기
	    //미션3. 뽑아낸 인증번호를 저장!! (그래야 나중에 맞나 비교하니까...) -> 세션에 저장
	    
	    //미션4. 사용자가 인증번호 입력해서 요청!!! -> 요청을 어디로??? ->세션으로..
	    //미션5. 요청 온거를 어디서 번호를 전달받나..? -> 세션에서
	    //미션6. 요청온 번호랑 아까 저장해둔 인증번호랑 비교!!!!
	    //미션7. return 비교 결과를 다시 화면에 전달 -> "인증성공!"
	    
        // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
        message.setFrom("01083389611");
        message.setTo(phoneNum);
        message.setText("인증번호 : " + authNumber);

        
        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
        System.out.println(response);
        
        SmsResponseDto smsResponseDto = new SmsResponseDto();
//        smsResponseDto.setAuthNumber(response.getTo());
        smsResponseDto.setAuthNumber(String.valueOf(authNumber));

      HttpSession session = request.getSession();
      session.setAttribute("authNumber", String.valueOf(authNumber));//인증번호 세션에 저장
      session.setMaxInactiveInterval(2 * 60); // 세션 유효 시간을 2분으로 설정 

        
        return smsResponseDto;
    }

}
//a href 링크 
//js ajax
//	@PostMapping("/sendSms")
//	@ResponseBody
//	public ResponseEntity<Map<String, String>> sendSms(@RequestParam("to") String phoneNumber, HttpServletRequest request) {		
//		// 인증 번호 난수 생성
//	    int authNumber = (int)Math.floor(Math.random() * 100000) + 10000;
//		
//		//sms 처리
//	    net.nurigo.sdk.message.model.Message message = new net.nurigo.sdk.message.model.Message();
//
//        // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
//	    message.setFrom("01054111512"); //발신번호 입력
//	    message.setTo(phoneNumber);      //수신번호 입력
//	    message.setText("인증번호: " + authNumber); // 인증번호 포함된 메시지 텍스트 설정
////	    message.setType("net.nurigo.sdk.message.model.Message.MessageType.SMS");
//
//
//        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
//        System.out.println(response);
//
//        HttpSession session = request.getSession();
//        session.setAttribute("authNumber", String.valueOf(authNumber));
//        session.setMaxInactiveInterval(2 * 60); // 세션 유효 시간을 2분으로 설정
//        
//        // 생성된 인증 번호를 JSON 객체로 변환하여 클라이언트에게 반환합니다.
//        Map<String, String> responseBody = new HashMap<>();
//        responseBody.put("authNumber", String.valueOf(authNumber));
//        return ResponseEntity.ok(responseBody);
//	}

