package com.last.prj.board.service;

import java.util.List;



public interface BoardService {

	List<BoardVO> boardSelectList();
	BoardVO boardSelect(int b_no);
	int boardInsert(BoardVO board);
	int boardUpdate(BoardVO board);
	int boardDelete(int b_no);
	
	int boardIdUpdate(int b_no);
	List<BoardVO> boardSearch(String key, String val);
}