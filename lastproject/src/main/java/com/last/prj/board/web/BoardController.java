package com.last.prj.board.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.last.prj.board.service.BoardService;
import com.last.prj.board.service.BoardVO;



@Controller
public class BoardController {

	@Autowired
	private BoardService boardDao;
	
	
	//board 게시판 홈페이지 출력
	@RequestMapping("/boardPage.do")
	public String boardPage(Model model) {
		List<BoardVO> list = boardDao.boardSelectList();
		System.out.println(list);
		model.addAttribute("boardList", list);
		return "board/boardList";
		
	}
	
	
	
	//board 게시판 화면 이동 + DB데이터
	@RequestMapping("/boardTables.do")
	public String boardTables(Model model) {
		List<BoardVO> list = boardDao.boardSelectList();
		System.out.println(list);
		model.addAttribute("boardList", list);
		return "admin/table/boardTable";
		
	}
	
	//게시글 상세조회
	@RequestMapping("/boardSelect.do")
	   public String noticeSelect(BoardVO board, Model model) {
	      //boardDao.boardHitUpdate(board.getB_no());
	      //System.out.println(board.getB_no());
	      model.addAttribute("boards", boardDao.boardSelect(board));
	      return "admin/board/boardUpdateForm";
	}
	
	
	//게시글 입력
	 @RequestMapping("/boardInsertForm.do") 
	  public String boardInsert() {
		  return "admin/board/boardInsert";
	  }
	
	  @RequestMapping("/boardInsert.do") 
	  public String noticeInsert(BoardVO board, Model model) {
		  //System.out.println(board.getNotice_title());
		  boardDao.boardInsert(board);
		model.addAttribute("notices", boardDao.boardSelectList());
		  return "admin/board/boardInsert";
	  }
	
	
	
	//게시글 수정
	
	
	
	
	//게시글 삭제
	@RequestMapping("/boardDelete.do")
	public String boardDelete() {
		
		return "";
		//삭제를 하면
	}
	
	//게시글 순번 업데이트
	@RequestMapping("/boardIdUpdate.do")
	public String boardIdUpdate(Model model) {
		model.addAttribute("boards", boardDao.boardIdUpdate(0));
		return "board/boardIdUpdate";
	}
	
	
	//게시글 조회수
	/*
	 * @RequestMapping("/boardHitUpdate.do") public String
	 * boardHitUpdate(@RequestParam(value="b_no")int b_no,Model model) {
	 * System.out.println(b_no); return ""; }
	 */
}