package com.kh.Final_cccc.common;

import com.kh.Final_cccc.recipe.model.vo.PageInfo;

public class PagenationRecipe {
public static PageInfo getPageInfo(int currentPage, int listCount) {
		
		int pageLimit = 5;
		int boardLimit = 12;
		
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
