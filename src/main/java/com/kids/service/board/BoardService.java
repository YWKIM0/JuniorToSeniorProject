package com.kids.service.board;

import java.util.List;
import java.util.Map;

import com.kids.dto.board.BoardDto;


public interface BoardService {

	public int addNewArticle(BoardDto boardDto);
	
	public int getCountByArticleNo(int articleNo);
	
	public List<BoardDto> getAllArticleList();

	public BoardDto getArticleByArticleNo(int articleNo);
	
	public int updateArticle(BoardDto boardDto);
	
	public int removeArticle(int articleNo);
	
	public int updateViews(int articleNo);
	
	public int getArticleCount();
	
	public List<BoardDto> getListPage(int displayArticle, int articleNum);
}
