package com.kids.dao.senior;

import java.util.List;

import com.kids.dto.senior.SeniorDto;

import java.util.Map;

import com.kids.dto.image.ImageFileDTO;
import com.kids.dto.senior.SeniorDetailDto;
import com.kids.dto.senior.SeniorScheduleDto;

public interface SeniorDao {
	
	public List<SeniorDto> selectVerificationList(int displayArticle, int articleNum);
	
	public List<SeniorDto> selectVerificationListById(SeniorDto seniorDto);
	
	public int updateVerificationStatusAsCertified(SeniorDto seniorDto);

	public int updateVerificationStatusAsRejected(SeniorDto seniorDto);

	public int selectRegisterCount();
	
	public List<SeniorDetailDto> selectSeniorDetail();
	public SeniorDetailDto selectSeniorDetailById(String id);
	public int updateUserInfo(SeniorDetailDto seniorDetail);
	public List<SeniorScheduleDto> selectSeniorEnableSchedule(String id);
	public int updateSchedule(Map<String, String> map);
	public ImageFileDTO selectImgById(String id);
	public int updateScheduleWorkStatus(Map<String, String> map);

	public String selectVerificationStatus(String id); //시니어의 인증상태를 가져온다.
}
