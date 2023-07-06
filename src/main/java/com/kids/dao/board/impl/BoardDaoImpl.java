package com.kids.dao.board.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kids.dao.board.BoardDao;
import com.kids.dto.board.BoardDto;

@Repository
public class BoardDaoImpl implements BoardDao{

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insertNewArticle(BoardDto boardDto) {
		
		int result = sqlSessionTemplate.insert("board_mapper.insert_article", boardDto);
		
		return result;
	}

	@Override
	public List<BoardDto> selectAllArticleList() {
		
		List<BoardDto> list = sqlSessionTemplate.selectList("board_mapper.select_article_list");
		return list;
	}

	@Override
	public BoardDto selectArticleByArticleNo(int articleNo) {
		BoardDto article = sqlSessionTemplate.selectOne("board_mapper.select_article_by_articleNo", articleNo);
		return article;
	}

	@Override
	public int modifyArticle(BoardDto boardDto) {
		int result = sqlSessionTemplate.update("board_mapper.modify_article", boardDto);
		return result;
	}

	@Override
	public int deleteArticle(int articleNo) {
		
		int result = sqlSessionTemplate.update("board_mapper.delete_article", articleNo);
		
		return result;
	}

	@Override
	public int increaseViews(int articleNo) {
		
		int result = sqlSessionTemplate.update("board_mapper.increase_view_count", articleNo);
		
		return result;
	}

	@Override
	public int countArticle() {
		
		int result = sqlSessionTemplate.selectOne("board_mapper.total_count_of_article");
		
		return result;
	}

	@Override
	public List<BoardDto> listPage(int displayArticle, int articleNum) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("displayArticle", displayArticle);
		map.put("articleNum", articleNum);
		
		List<BoardDto> list = sqlSessionTemplate.selectList("board_mapper.list_page", map);
		return list;
	}

	@Override
	public int selectCountByArticleNo(int articleNo) {
		// TODO Auto-generated method stub
		
		int result  = sqlSessionTemplate.selectOne("board_mapper.select_count_by_articleNo", articleNo);
		
		return result;
	}

}
