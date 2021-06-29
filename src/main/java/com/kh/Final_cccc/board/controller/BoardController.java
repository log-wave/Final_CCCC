package com.kh.Final_cccc.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.Final_cccc.board.exception.BoardException;
import com.kh.Final_cccc.board.model.vo.Board;
import com.kh.Final_cccc.board.model.vo.PageInfo;
import com.kh.Final_cccc.board.service.BoardService;
import com.kh.Final_cccc.common.Pagination;



@Controller
public class BoardController {
	// 다시
	@Autowired
	private BoardService bService;
	
	@RequestMapping("blist.bo")
	public ModelAndView boardList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1; // 연산에 사용할 변수
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = bService.getListCount();
		
		// 페이징 처리를 위한 연산 : Pagination
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> list = bService.selectList(pi);
		
		if(list != null) {
			mv.addObject("list", list).addObject("pi", pi).setViewName("noticeList/noticeList");
		} else {
			throw new BoardException("게시글 전체 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("bdetail.bo")
	public String boardDetail(@RequestParam("page") int page, @RequestParam("bNo") int bNo, Model model) {
		
		Board board = bService.selectBoard(bNo);
		
		if(board != null) {
			model.addAttribute("page", page).addAttribute("board", board);
			System.out.println(board.getbContent());
			return "noticeDetail/noticeDetail";
		} else {
			throw new BoardException("게시판 상세보기에 실패하였습니다.");
		}
	}
	
	@RequestMapping("binsertView.bo")
	public String boardInsertForm() {
		return "insertNotice/insertNotice";
	}
	
	@RequestMapping("binsert.bo")
	public String insertBoard(@ModelAttribute Board b, HttpServletRequest request) {
		
		int result = bService.insertBoard(b);
		
		if(result > 0) {
			return "redirect:blist.bo";
		} else {
			throw new BoardException("게시글 등록에 실패하였습니다.");
		}
	}
}
