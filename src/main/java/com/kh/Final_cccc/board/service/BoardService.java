package com.kh.Final_cccc.board.service;

import java.util.ArrayList;




import com.kh.Final_cccc.board.model.vo.Board;
import com.kh.Final_cccc.board.model.vo.PageInfo;
import com.kh.Final_cccc.board.model.vo.QA_Answer;
//다시
public interface BoardService{

	int getListCount();

	ArrayList<Board> selectList(PageInfo pi);

	Board selectBoard(int bNo);

	int insertBoard(Board b);

	int updateBoard(Board b);

	int deleteBoard(String check);

	int getqListCount();

	ArrayList<Board> selectqList(PageInfo pi);

	Board selectqaBoard(int bNo);

	int insertqaBoard(Board b);

	int updateqaBoard(Board b);

	int deleteqaBoard(int bNo);

	int insertAnswer(QA_Answer qa);

	ArrayList<QA_Answer> selectAnswerList(int bNo);

}
