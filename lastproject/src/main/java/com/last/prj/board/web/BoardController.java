package com.last.prj.board.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.last.prj.board.service.BoardService;
import com.last.prj.board.service.BoardVO;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardDao;

	// board 게시판 홈페이지 출력
	@RequestMapping("/bTables.do")
	public String boardPage(Model model) {
		List<BoardVO> list = boardDao.boardSelectList();
		System.out.println(list);
		model.addAttribute("boardList", list);
		return "board/boardList";

	}

	// board 게시판 홈페이지 상세조회
	/* @RequestMapping("/bSelect.do") */

	// board 게시판 화면 이동 + list
	@RequestMapping("/boardTables.do")
	public String boardTables(Model model) {
		List<BoardVO> list = boardDao.boardSelectList();
		System.out.println(list);
		model.addAttribute("boardList", list);
		return "admin/table/boardTable";

	}

	// 게시글 입력창
	@RequestMapping("/boardInsertForm.do")
	public String boardInsert() {
		return "admin/board/boardInsertForm";
	}

	// 게시글 입력
	@RequestMapping("/boardInsert.do")
	public String boardInsert(BoardVO board, Model model) {
		// System.out.println(board.getNotice_title());
		boardDao.boardInsert(board);
		List<BoardVO> list = boardDao.boardSelectList();
		System.out.println(list);
		model.addAttribute("boardList", list);
		return "admin/table/boardTable";
	}
	
	// 게시글 상세조회 및 수정 화면

	@RequestMapping("/boardUpdateForm.do")
	public String noticeSelect(@RequestParam(value = "b_no") int b_no, Model model) { 
		
		model.addAttribute("boards", boardDao.boardSelect(b_no));
		return "admin/board/boardUpdateForm";
	}
	
	// 게시글 수정 :
	@RequestMapping("/boardUpdate.do")
	public String boardUpdate(BoardVO board, Model model) {
		boardDao.boardUpdate(board);
		List<BoardVO> list = boardDao.boardSelectList();
		System.out.println(list);
		model.addAttribute("boardList", list);
		return "admin/table/boardTable";
	}
	

	@RequestMapping("/boardDelete.do")
	public String boardDelete(@RequestParam("b_no") int b_no, BoardVO board, Model model) {
		boardDao.boardDelete(b_no);
		List<BoardVO> list = boardDao.boardSelectList();
		System.out.println(list);
		model.addAttribute("boardList", list);
		return "admin/table/boardTable";
	}

	// 게시글 순번 업데이트
	@RequestMapping("/boardIdUpdate.do")
	public String boardIdUpdate(Model model) {
		model.addAttribute("boards", boardDao.boardIdUpdate(0));
		return "board/boardIdUpdate";
	}

	// 게시글 조회수
	/*
	 * @RequestMapping("/boardHitUpdate.do") public String
	 * boardHitUpdate(@RequestParam(value="b_no")int b_no,Model model) {
	 * System.out.println(b_no); return ""; }
	 */
}