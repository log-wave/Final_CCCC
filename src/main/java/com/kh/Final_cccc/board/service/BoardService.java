package com.kh.Final_cccc.board.service;
// 주석
import java.util.ArrayList;

import com.kh.Final_cccc.board.model.vo.Board;
import com.kh.Final_cccc.board.model.vo.PageInfo;

public interface BoardService{

	int getListCount();

	ArrayList<Board> selectList(PageInfo pi);

}
