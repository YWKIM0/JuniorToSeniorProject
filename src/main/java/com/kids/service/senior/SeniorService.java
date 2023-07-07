package com.kids.service.senior;

import java.util.List;

import com.kids.dto.senior.SeniorDto;

import java.util.Map;

import com.kids.dto.image.ImageFileDTO;
import com.kids.dto.senior.SeniorDetailDto;
import com.kids.dto.senior.SeniorScheduleDto;

public interface SeniorService {

	public List<SeniorDto> getSeniorVerificationList(int displayArticle, int articleNum);

	public List<SeniorDto> getSeniorVerificationListById(SeniorDto seniorDto);
	
	public int setSeniorVerificationStatusAsCertified(SeniorDto seniorDto);

	public int setSeniorVerificationStatusAsRejected(SeniorDto seniorDto);

	public int getRegisterCount();

	public List<SeniorDetailDto> getSeniorDetail();
	public SeniorDetailDto getSeniorDetailById(String id);
	public int updateUserInfo(SeniorDetailDto seniorDetail);
	public List<SeniorScheduleDto> getSeniorEnableSchedule(String id);
	public int updateSchedule(Map<String, String> map);
	public ImageFileDTO getImgById(String id);
	public int updateScheduleWorkStatus(Map<String, String> map);

	public String getVerificationStatus(String id); //시니어 인증상태를 가져오는 메소드
	
}
