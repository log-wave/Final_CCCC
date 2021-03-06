package com.kh.Final_cccc.board.model.dao;
//다시
import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kh.Final_cccc.board.controller.BoardController;
import com.kh.Final_cccc.board.model.vo.Board;
import com.kh.Final_cccc.board.model.vo.PageInfo;
import com.kh.Final_cccc.board.model.vo.QA_Answer;

@Repository("bDAO")
public class BoardDAO {
	private static final Logger logger = LoggerFactory.getLogger(BoardDAO.class);
	
	
	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.getListCount");
	}

	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectNoticeList", null, rowBounds);
	}

	public int addReadCount(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.update("boardMapper.addReadCount", bNo);
	}

	public Board selectBoard(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.selectOne("boardMapper.selectBoard", bNo);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoard", b);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateBoard", b);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, String bNum) {
		int bNo = Integer.parseInt(bNum);
		
		return sqlSession.update("boardMapper.deleteBoard", bNo);
	}

	public int getqListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.getqListCount");
	}

	public ArrayList<Board> selectqList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectqaList", null, rowBounds);
	}

	public int addReadqaCount(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.update("boardMapper.addReadqaCount", bNo);
	}

	public Board selectqaBoard(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.selectOne("boardMapper.selectqaBoard", bNo);
	}

	public int insertqaBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertqaBoard", b);
	}

	public int updateqaBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateqaBoard", b);
	}

	public int deleteqaBoard(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.update("boardMapper.deleteqaBoard", bNo);
	}

	public int insertAnswer(SqlSessionTemplate sqlSession, QA_Answer qa) {
		logger.info("답변 작성 BoardDAO 진입");
		return sqlSession.insert("boardMapper.insertAnswer", qa);
	}

	public ArrayList<QA_Answer> selectAnswerList(SqlSessionTemplate sqlSession, int bNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectAnswerList", bNo);
	}

	public int deleteAnswer(SqlSessionTemplate sqlSession, String bNum) {
		int bNo = Integer.parseInt(bNum);
		
		return sqlSession.delete("boardMapper.deleteAnswer", bNo);
	}

	public ArrayList<Board> selectAdminQList(SqlSessionTemplate sqlSession,
			com.kh.Final_cccc.admin.model.vo.PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectqaList", null, rowBounds);
	}

	public ArrayList<Board> selectAdminList(SqlSessionTemplate sqlSession,
			com.kh.Final_cccc.admin.model.vo.PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectNoticeList", null, rowBounds);
	}

	
	
}
