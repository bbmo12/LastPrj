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

	// 게시글 상세조회

	@RequestMapping("/boardSelect.do")
	public String noticeSelect(BoardVO board, Model model) { // boardDao.boardHitUpdate(board.getB_no()); //
		System.out.println(board.getB_no());
		model.addAttribute("boards", boardDao.boardSelect(board));
		return "admin/board/boardUpdateForm";
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

	// 게시글 수정 :
	@RequestMapping("/boardUpdate.do")
	public String boardUpdate(@RequestParam("b_no") int b_no, BoardVO board, Model model) {
		System.out.println(b_no);
		boardDao.boardUpdate(b_no);
		List<BoardVO> list = boardDao.boardSelectList();
		System.out.println(list);
		model.addAttribute("boardList", list);
		return "admin/table/boardTable";
	}

	// 게시글 삭제
	/*
	 * @RequestMapping(value = "/deleteBoard", method = RequestMethod.GET)
	 * 
	 * @ResponseBody public String deleteBoard(RedirectAttributes
	 * rttr, @RequestParam("b_no") int b_no) throws Exception {
	 * boardDao.boardDelete(b_no); return "redirect:admin/table/boardTable"; }
	 */
	/*
	 * @DeleteMapping("/board/{b_no}") public void delete(@PathVariable("b_no") int
	 * b_no){ //logger.info("DELETE bno : " + bno); boardDao.boardDelete(b_no); }
	 */

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