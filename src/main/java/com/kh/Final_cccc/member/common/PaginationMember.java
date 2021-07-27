package com.kh.Final_cccc.member.common;

import com.kh.Final_cccc.member.model.vo.PageInfo;

public class PaginationMember {
public static PageInfo getPageInfo(int currentPage, int listCount) {
		
		int pageLimit = 5;
		int boardLimit = 9;
		
		int maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		int endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		return pi;
	}
}
