package com.last.prj.board.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.board.service.BoardService;
import com.last.prj.board.service.BoardVO;


@Controller
public class BoardController {

	@Autowired
	private BoardService boardDao;
	

	
	
	//admBoardSearch
	@RequestMapping("/admBoardSearch")
	@ResponseBody
	public List<BoardVO> admBoardSearch(@RequestParam("key")String key, @RequestParam("data")String data) {
		System.out.println("key : " + key);
		System.out.println("data : "+data);
		System.out.println(boardDao.boardSearch(key, data));
		return boardDao.boardSearch(key, data);
	}

	// board 게시판 홈페이지 출력 admBoard
	@RequestMapping("/admBoard")
	public String boardPage(Model model) {
		List<BoardVO> list = boardDao.boardSelectList();
		System.out.println(list);
		model.addAttribute("boardList", list);
		return "board/admBoard";

	}

	// board 게시판 리스트
	@RequestMapping("/boardTables")
	public String boardTables(Model model) {
		List<BoardVO> list = boardDao.boardSelectList();
		System.out.println(list);
		model.addAttribute("boardList", list);
		return "admin/board/boardTable";

	}

	// 게시글 입력 창
	@RequestMapping("/boardInsertForm")
	public String boardInsert() {
		return "admin/board/boardInsertForm";
	}

	// 게시글 입력
	@RequestMapping("/boardInsert")
	public String boardInsert(BoardVO board, Model model) {
		// System.out.println(board.getNotice_title());
		boardDao.boardInsert(board);

		return "redirect:boardTables";
	}

	// 게시글 상세조회 및 수정 화면
	@RequestMapping("/boardUpdateForm")
	public String noticeSelect(@RequestParam(value = "b_no") int b_no, Model model) {

		model.addAttribute("boards", boardDao.boardSelect(b_no));
		return "admin/board/boardUpdateForm";
	}

	// 게시글 수정 
	@RequestMapping(value="/boardUpdate")
	public String boardUpdate(BoardVO board, Model model) {
		boardDao.boardUpdate(board);
		return "redirect:boardTables";

	}

	@RequestMapping("/boardDelete")
	public String boardDelete(@RequestParam("b_no") int b_no, BoardVO board, Model model) {
		boardDao.boardDelete(b_no);
		return "redirect:boardTables";
	}
	

	// 게시글 순번 업데이트
	/*
	 * @RequestMapping("/boardIdUpdate") public String boardIdUpdate(Model model) {
	 * model.addAttribute("boards", boardDao.boardIdUpdate(0)); return
	 * "board/boardIdUpdate"; }
	 */

	// 게시글 조회수
	/*
	 * @RequestMapping("/boardHitUpdate.do") public String
	 * boardHitUpdate(@RequestParam(value="b_no")int b_no,Model model) {
	 * System.out.println(b_no); return ""; }
	 */
	
	
	// =====자주 묻는 QnA Top 10 리스트 출력 ======

}