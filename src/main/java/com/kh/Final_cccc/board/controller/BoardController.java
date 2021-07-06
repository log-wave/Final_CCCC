package com.kh.Final_cccc.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.Final_cccc.board.exception.BoardException;
import com.kh.Final_cccc.board.model.vo.Board;
import com.kh.Final_cccc.board.model.vo.PageInfo;
import com.kh.Final_cccc.board.model.vo.QA_Answer;
import com.kh.Final_cccc.board.service.BoardService;
import com.kh.Final_cccc.common.Pagination;



@Controller
public class BoardController {
	// 다시
	@Autowired
	private BoardService bService;
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
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
			return "redirect:adminBoard.ad";
		} else {
			throw new BoardException("게시글 등록에 실패하였습니다.");
		}
	}
	
	@RequestMapping("bupView.bo")
	public String boardUpdateForm(@RequestParam("bNo") int bNo, @RequestParam("page") int page, Model model) {
		
		Board board = bService.selectBoard(bNo);
		
		model.addAttribute("board", board);
		model.addAttribute("page", page);
		return "updateNotice/updateNotice";
	}
	
	@RequestMapping("bupdate.bo")
	public String updateBoard(@ModelAttribute Board b, @RequestParam("page") int page, HttpServletRequest request) {
		
		int result = bService.updateBoard(b);
		
		if(result > 0) {
			return "redirect:bdetail.bo?bNo="+b.getbNo() + "&page=" + page;
		} else {
			throw new BoardException("게시글 수정에 실패하였습니다.");
		}
		
	}
	
	@RequestMapping("bdelete.bo")
	public String deleteBoard(@RequestParam("bNo") int bNo) {
		int result = bService.deleteBoard(bNo);
		
		if(result > 0) {
			return "redirect:blist.bo";
		}else {
			throw new BoardException("게시글 삭제에 실패하였습니다.");
		}
	}
	
	@RequestMapping("qlist.qa")
	public ModelAndView qaList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1; // 연산에 사용할 변수
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = bService.getqListCount();
		
		// 페이징 처리를 위한 연산 : Pagination
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> list = bService.selectqList(pi);
		
		if(list != null) {
			mv.addObject("list", list).addObject("pi", pi).setViewName("qaList/qaList");
		} else {
			throw new BoardException("게시글 전체 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	@RequestMapping("qdetail.qa")
	public String qaDetail(@RequestParam("page") int page, @RequestParam("bNo") int bNo, Model model) {
		
		Board board = bService.selectqaBoard(bNo);
		
		if(board != null) {
			model.addAttribute("page", page).addAttribute("board", board);
			return "qaDetail/qaDetail";
		} else {
			throw new BoardException("게시판 상세보기에 실패하였습니다.");
		}
	}
	
	
	@RequestMapping("qinsertView.qa")
	public String qaInsertForm() {
		return "insertQA/insertQA";
	}
	
	@RequestMapping("qinsert.qa")
	public String insertqaBoard(@ModelAttribute Board b, HttpServletRequest request, @RequestParam("buserNo") int buserNo) {
		
		b.setbUserNo(buserNo);

		int result = bService.insertqaBoard(b);
		
		if(result > 0) {
			return "redirect:qlist.qa";
		} else {
			throw new BoardException("게시글 등록에 실패하였습니다.");
		}
	}
	@RequestMapping("qupView.qa")
	public String qaUpdateForm(@RequestParam("bNo") int bNo, @RequestParam("page") int page, Model model) {
		
		Board board = bService.selectqaBoard(bNo);
		
		model.addAttribute("board", board);
		model.addAttribute("page", page);
		return "updateQA/updateQA";
	}
	
	@RequestMapping("qupdate.qa")
	public String updateqaBoard(@ModelAttribute Board b, @RequestParam("page") int page, HttpServletRequest request) {
		
		int result = bService.updateqaBoard(b);
		
		if(result > 0) {
			return "redirect:qdetail.qa?bNo="+b.getbNo() + "&page=" + page;
		} else {
			throw new BoardException("게시글 수정에 실패하였습니다.");
		}
		
	}
	
	@RequestMapping("qdelete.qa")
	public String deleteqaBoard(@RequestParam("bNo") int bNo) {
		int result = bService.deleteqaBoard(bNo);
		
		if(result > 0) {
			return "redirect:qlist.qa";
		}else {
			throw new BoardException("게시글 삭제에 실패하였습니다.");
		}
	}
	
	@RequestMapping("addAnswer.qa")
    @ResponseBody
    public String addAnswer(@ModelAttribute QA_Answer qa,@RequestParam("rContent")String Answer_Content,@RequestParam("refBno")int bNo ) {
		
        qa.setAnswer_Content(Answer_Content);
        qa.setbNo(bNo);
        
        System.out.println(qa);
        logger.info("답변 작성 컨트롤러 진입");
        int result = bService.insertAnswer(qa);
        System.out.println(qa);
        if(result > 0) {
        	
            return "success";
        } else {
            System.out.println("답변 등록에 실패하였습니다.");
            throw new BoardException("답변 등록에 실패하였습니다.");
        }
	}
	
	@RequestMapping("qaList.qa")
	@ResponseBody
	public void getAnswerList(@RequestParam("bNo") int bNo, HttpServletResponse response) throws JsonIOException, IOException {
		
		ArrayList<QA_Answer> list = bService.selectAnswerList(bNo);
		System.out.println("아ㅓ뇌라ㅓㅁ노이ㅏㄴ뫼ㅏ로" + list);
		response.setContentType("application/json;charset=utf-8");
//		Gson gson = new Gson();
		GsonBuilder gb = new GsonBuilder();
		GsonBuilder dateGb = gb.setDateFormat("yyyy-MM-dd");
		Gson gson = dateGb.create();
		gson.toJson(list, response.getWriter());	
	}
}
