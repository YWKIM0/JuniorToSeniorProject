package com.kids.dao.senior.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kids.dao.senior.SeniorDao;
import com.kids.dto.senior.SeniorDto;

import java.util.Map;

import com.kids.dto.image.ImageFileDTO;
import com.kids.dto.senior.SeniorDetailDto;
import com.kids.dto.senior.SeniorScheduleDto;


@Repository
public class SeniorDaoImpl implements SeniorDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<SeniorDto> selectVerificationList(int displayArticle, int articleNum) {
		// TODO Auto-generated method stub
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("displayArticle", displayArticle);
		map.put("articleNum", articleNum);
		
		List<SeniorDto> list = 
				sqlSessionTemplate.selectList("senior_mapper.select_senior_verification_list", map);
		
		return list;
	}

	@Override
	public List<SeniorDto> selectVerificationListById(SeniorDto seniorDto) {
		// TODO Auto-generated method stub
		
		List<SeniorDto> list = sqlSessionTemplate.selectList("senior_mapper.select_senior_verification_list_by_id", seniorDto);
		return list;
	}

	@Override
	public int updateVerificationStatusAsCertified(SeniorDto seniorDto) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.update("senior_mapper.update_verification_status_as_Y", seniorDto);
		return result;
	}

	@Override
	public int updateVerificationStatusAsRejected(SeniorDto seniorDto) {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.update("senior_mapper.update_verification_status_as_Rejected", seniorDto);
		return result;
	}

	@Override
	public int selectRegisterCount() {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.selectOne("senior_mapper.select_register_count");
		return result;
	}



	@Override
	public List<SeniorDetailDto> selectSeniorDetail() {
		// TODO Auto-generated method stub
		List<SeniorDetailDto> list = sqlSessionTemplate.selectList("senior_mapper.select_senior_detail");
		
		return list;
	}

	@Override
	public SeniorDetailDto selectSeniorDetailById(String id) {
		// TODO Auto-generated method stub
		SeniorDetailDto senior = sqlSessionTemplate.selectOne("senior_mapper.select_senior_detail_by_id", id);
		return senior;
	}

	@Override
	public int updateUserInfo(SeniorDetailDto seniorDetail) {
		// TODO Auto-generated method stub
		int result_info = sqlSessionTemplate.update("senior_mapper.update_user_info", seniorDetail);
		int result_snr = sqlSessionTemplate.update("senior_mapper.update_snr", seniorDetail);
		
		return result_info+result_snr;
	}

	@Override
	public List<SeniorScheduleDto> selectSeniorEnableSchedule(String id) {
		// TODO Auto-generated method stub
		List<SeniorScheduleDto> list = sqlSessionTemplate.selectList("senior_mapper.select_senior_schedule_by_id", id);
		return list;
	}

	@Override
	public int updateSchedule(Map<String, String> map) {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.update("senior_mapper.update_schedule", map);
		
		return result;
	}

	@Override
	public ImageFileDTO selectImgById(String id) {
		// TODO Auto-generated method stub
		
		ImageFileDTO result = sqlSessionTemplate.selectOne("senior_mapper.select_img_by_id", id);
		
		return result;
	}

	@Override
	public int updateScheduleWorkStatus(Map<String, String> map) {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.update("senior_mapper.update_schedule_work_status", map);
		return result;
	}

	@Override
	public String selectVerificationStatus(String id) {
		// TODO Auto-generated method stub
		
		String result = sqlSessionTemplate.selectOne("senior_mapper.select_verification_status", id);
		return result;
	}

}
