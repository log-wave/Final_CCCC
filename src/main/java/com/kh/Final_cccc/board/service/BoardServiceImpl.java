package com.kh.Final_cccc.board.service;
//다시
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.Final_cccc.board.controller.BoardController;
import com.kh.Final_cccc.board.model.dao.BoardDAO;
import com.kh.Final_cccc.board.model.vo.Board;
import com.kh.Final_cccc.board.model.vo.PageInfo;
import com.kh.Final_cccc.board.model.vo.QA_Answer;

@Service("bService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDAO bDAO;
	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	@Override
	public int getListCount() {
		return bDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return bDAO.selectList(sqlSession, pi);
	}

	@Override
	public Board selectBoard(int bNo) {
		Board b = null;
		
		int result = bDAO.addReadCount(sqlSession, bNo);
		
		if(result > 0) {
			b = bDAO.selectBoard(sqlSession, bNo);
		}
		return b;
	}

	@Override
	public int insertBoard(Board b) {
		return bDAO.insertBoard(sqlSession, b);
	}

	@Override
	public int updateBoard(Board b) {
		return bDAO.updateBoard(sqlSession, b);
	}

	@Override
	public int deleteBoard(String bNo) {
		return bDAO.deleteBoard(sqlSession, bNo);
	}

	@Override
	public int getqListCount() {
		return bDAO.getqListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectqList(PageInfo pi) {
		return bDAO.selectqList(sqlSession, pi);
	}

	@Override
	public Board selectqaBoard(int bNo) {
		Board b = null;
		
		int result = bDAO.addReadqaCount(sqlSession, bNo);
		
		if(result > 0) {
			b = bDAO.selectqaBoard(sqlSession, bNo);
		}
		return b;
	}

	@Override
	public int insertqaBoard(Board b) {
		return bDAO.insertqaBoard(sqlSession, b);
	}

	@Override
	public int updateqaBoard(Board b) {
		return bDAO.updateqaBoard(sqlSession, b);
	}

	@Override
	public int deleteqaBoard(int bNo) {
		return bDAO.deleteqaBoard(sqlSession, bNo);
	}

	@Override
	public int insertAnswer(QA_Answer qa) {
		logger.info("답변 작성 serviceImpl 진입");
		return bDAO.insertAnswer(sqlSession, qa);
	}

	@Override
	public ArrayList<QA_Answer> selectAnswerList(int bNo) {
		return bDAO.selectAnswerList(sqlSession, bNo);
	}

	@Override
	public int deleteAnswer(String bNo) {
		return bDAO.deleteAnswer(sqlSession, bNo);
	}

	@Override
	public ArrayList<Board> selectAdminQList(com.kh.Final_cccc.admin.model.vo.PageInfo pi) {
		return bDAO.selectAdminQList(sqlSession, pi);
	}

	@Override
	public ArrayList<Board> selectAdminList(com.kh.Final_cccc.admin.model.vo.PageInfo pi) {
		// TODO Auto-generated method stub
		return bDAO.selectAdminList(sqlSession, pi);
	}

	
}
