package com.last.prj.board.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;



public interface BoardMapper {

	List<BoardVO> boardSelectList();
	BoardVO boardSelect(int b_no);
	int boardInsert(BoardVO board);
	int boardUpdate(BoardVO board);
	int boardDelete(int b_no);
	
	int boardIdUpdate(int b_no);
	List<BoardVO> boardSearch(@Param("key")String key, @Param("data")String data);
	
	//int boardHitUpdate(int b_hit);
}