package com.kh.Final_cccc.board.service;

import java.util.ArrayList;

import com.kh.Final_cccc.board.model.vo.Board;
import com.kh.Final_cccc.board.model.vo.PageInfo;
//다시
public interface BoardService{

	int getListCount();

	ArrayList<Board> selectList(PageInfo pi);

	Board selectBoard(int bNo);

	int insertBoard(Board b);

	int updateBoard(Board b);

	int deleteBoard(int bNo);

	int getqListCount();

	ArrayList<Board> selectqList(PageInfo pi);

	Board selectqaBoard(int bNo);


}
