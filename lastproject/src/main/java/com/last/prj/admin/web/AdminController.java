package com.last.prj.admin.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.board.service.BoardService;
import com.last.prj.board.service.BoardVO;

@Controller
public class AdminController {
	
	@Autowired
	private BoardService boardDao;
	
	@RequestMapping("/main.do")
	public String main() {
		return "admin/main/main";
	}
	
	//공지사항 리스트 출력
	@RequestMapping("/boardTables.do")
	public String btables(Model model) {
		model.addAttribute("boardList", boardDao.boardSelectList());
		return "admin/table/boardTable";
	}
	
	
	@RequestMapping("/pmemberTables.do")
	public String pTables()	{
		return "admin/table/pmemberTable";
	}
	
	@RequestMapping("/reportTables.do")
	public String rTables()	{
		return "admin/table/reportTable";
	}	
	
}
