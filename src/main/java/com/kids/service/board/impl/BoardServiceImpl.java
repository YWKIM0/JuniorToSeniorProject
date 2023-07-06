package com.kids.service.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kids.dao.board.BoardDao;
import com.kids.dto.board.BoardDto;
import com.kids.service.board.BoardService;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardDao boardDao;
	
	@Override
	public int addNewArticle(BoardDto boardDto) {
		
		int result = boardDao.insertNewArticle(boardDto);
		
		return result;
	}

	@Override
	public List<BoardDto> getAllArticleList() {
		
		List<BoardDto> list = boardDao.selectAllArticleList();
		
		return list;
	}

	@Override
	public BoardDto getArticleByArticleNo(int articleNo) {
		
		BoardDto article = boardDao.selectArticleByArticleNo(articleNo);
		
		return article;
	}

	@Override
	public int updateArticle(BoardDto boardDto) {
		int result = boardDao.modifyArticle(boardDto);
		return result;
	}

	@Override
	public int removeArticle(int articleNo) {
		
		int result = boardDao.deleteArticle(articleNo);
		
		return result;
	}

	@Override
	public int updateViews(int articleNo) {
		
		int result = boardDao.increaseViews(articleNo);
		
		return result;
	}

	@Override
	public int getArticleCount() {
		int result = boardDao.countArticle();
		return result;
	}

	@Override
	public List<BoardDto> getListPage(int displayArticle, int articleNum) {
		
		List<BoardDto> list = boardDao.listPage(displayArticle, articleNum);
		
		return list;
	}

	@Override
	public int getCountByArticleNo(int articleNo) {
		// TODO Auto-generated method stub
		
		int result = boardDao.selectCountByArticleNo(articleNo);
		
		return result;
	}

}
