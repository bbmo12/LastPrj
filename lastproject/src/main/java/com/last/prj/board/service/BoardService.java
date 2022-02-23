package com.last.prj.board.service;

import java.util.List;



public interface BoardService {

	List<BoardVO> boardSelectList();
	BoardVO boardSelect(BoardVO board);
	int boardInsert(BoardVO board);
	int boardDelete(BoardVO board);
	int boardUpdate(BoardVO board);
	
	int boardIdUpdate(int b_no);
	List<BoardVO> boardSearch(String key, String val);
}