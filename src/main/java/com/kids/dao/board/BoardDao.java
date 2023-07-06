package com.kids.dao.board;

import java.util.List;
import java.util.Map;

import com.kids.dto.board.BoardDto;

public interface BoardDao {

	public int insertNewArticle(BoardDto boardDto);
	
	public List<BoardDto> selectAllArticleList();

	public BoardDto selectArticleByArticleNo(int articleNo);
	
	public int selectCountByArticleNo(int articleNo);
	
	public int modifyArticle(BoardDto boardDto);
	
	public int deleteArticle(int articleNo);
	
	public int increaseViews(int articleNo);
	
	public int countArticle();
	
	public List<BoardDto> listPage(int displayArticle, int articleNum);
}
