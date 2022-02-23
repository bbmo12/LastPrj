package com.last.prj.board.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;



public interface BoardMapper {

	List<BoardVO> boardSelectList();
	BoardVO boardSelect(BoardVO board);
	int boardInsert(BoardVO board);
	int boardDelete(BoardVO board);
	int boardUpdate(BoardVO board);
	
	int boardIdUpdate(int b_no);
	List<BoardVO> boardSearch(@Param("key")String key, @Param("val")String val);
	
	//int boardHitUpdate(int b_hit);
}