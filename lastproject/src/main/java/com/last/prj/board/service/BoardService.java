package com.last.prj.board.service;

import java.util.List;



public interface BoardService {

	List<BoardVO> boardSelectList();
	BoardVO boardSelect(BoardVO board);
	int boardInsert(BoardVO board);
	int boardUpdate(int b_no);
	int boardDelete(int b_no);
	
	int boardIdUpdate(int b_no);
	List<BoardVO> boardSearch(String key, String val);
}