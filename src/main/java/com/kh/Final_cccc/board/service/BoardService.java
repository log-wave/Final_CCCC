package com.kh.Final_cccc.board.service;

import java.util.ArrayList;

import com.kh.Final_cccc.board.model.vo.Board;
import com.kh.Final_cccc.board.model.vo.PageInfo;
//다시
public interface BoardService{

	int getListCount();

	ArrayList<Board> selectList(PageInfo pi);

}
