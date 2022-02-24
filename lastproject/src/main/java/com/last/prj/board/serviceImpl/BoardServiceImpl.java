package com.last.prj.board.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.board.service.BoardMapper;
import com.last.prj.board.service.BoardService;
import com.last.prj.board.service.BoardVO;

@Repository("boardDao")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper bo;
	
	@Override
	public List<BoardVO> boardSelectList() {
		return bo.boardSelectList();
	}

	@Override
	public BoardVO boardSelect(int b_no) {
		return bo.boardSelect(b_no);
	}

	@Override
	public int boardInsert(BoardVO board) {
		return bo.boardInsert(board);
	}

	@Override
	public int boardDelete(int b_no) {
		return bo.boardDelete(b_no);
	}

	@Override
	public int boardUpdate(BoardVO board) {
		return bo.boardUpdate(board);
	}

	@Override
	public int boardIdUpdate(int b_no) {
		return bo.boardIdUpdate(b_no);
	}

	@Override
	public List<BoardVO> boardSearch(String key, String val) {
		return bo.boardSearch(key, val);
	}

}