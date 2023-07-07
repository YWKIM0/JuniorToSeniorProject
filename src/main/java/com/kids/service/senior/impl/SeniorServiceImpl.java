package com.kids.service.senior.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kids.dao.senior.SeniorDao;
import com.kids.dto.senior.SeniorDto;
import com.kids.dto.user.UserDto;
import com.kids.service.senior.SeniorService;

import java.util.Map;

import com.kids.dto.image.ImageFileDTO;
import com.kids.dto.senior.SeniorDetailDto;
import com.kids.dto.senior.SeniorScheduleDto;


@Service
public class SeniorServiceImpl implements SeniorService{

	@Autowired
	SeniorDao seniorDao;

	@Override
	public List<SeniorDto> getSeniorVerificationList(int displayArticle, int articleNum) {
		// TODO Auto-generated method stub

		List<SeniorDto> seniorVeriList = seniorDao.selectVerificationList(displayArticle, articleNum);
		
		return seniorVeriList;
	}

	@Override
	public List<SeniorDto> getSeniorVerificationListById(SeniorDto seniorDto) {
		// TODO Auto-generated method stub

		List<SeniorDto> seniorVeriList = seniorDao.selectVerificationListById(seniorDto);
		
		return seniorVeriList;
	}

	@Override
	public int setSeniorVerificationStatusAsCertified(SeniorDto seniorDto) {
		// TODO Auto-generated method stub
		
		int result = seniorDao.updateVerificationStatusAsCertified(seniorDto);
		
		return result;
	}

	@Override
	public int setSeniorVerificationStatusAsRejected(SeniorDto seniorDto) {
		// TODO Auto-generated method stub
		
		int result = seniorDao.updateVerificationStatusAsRejected(seniorDto);
		
		return result;
	}

	@Override
	public int getRegisterCount() {
		// TODO Auto-generated method stub
		
		int result = seniorDao.selectRegisterCount();
		
		return result;
	}

	@Override
	public List<SeniorDetailDto> getSeniorDetail() {
		// TODO Auto-generated method stub
		List<SeniorDetailDto> list = seniorDao.selectSeniorDetail();
		
		return list;
	}

	@Override
	public SeniorDetailDto getSeniorDetailById(String id) {
		// TODO Auto-generated method stub
		SeniorDetailDto senior = seniorDao.selectSeniorDetailById(id);
		return senior;
	}

	@Override
	public int updateUserInfo(SeniorDetailDto seniorDetail) {
		// TODO Auto-generated method stub
		int result = seniorDao.updateUserInfo(seniorDetail);
		return result;
	}

	@Override
	public List<SeniorScheduleDto> getSeniorEnableSchedule(String id) {
		// TODO Auto-generated method stub
		List<SeniorScheduleDto> list = seniorDao.selectSeniorEnableSchedule(id);
		return list;
	}

	@Override
	public int updateSchedule(Map<String, String> map) {
		// TODO Auto-generated method stub
		int result = seniorDao.updateSchedule(map);
		return result;
	}

	@Override
	public ImageFileDTO getImgById(String id) {
		// TODO Auto-generated method stub
		
		ImageFileDTO result = seniorDao.selectImgById(id);
		
		return result;
	}

	@Override
	public int updateScheduleWorkStatus(Map<String, String> map) {
		// TODO Auto-generated method stub
		int result = seniorDao.updateScheduleWorkStatus(map);
		return result;
	}

	@Override
	public String getVerificationStatus(String id) {
		// TODO Auto-generated method stub
		
		String result = seniorDao.selectVerificationStatus(id);
		return result;
	}

}
