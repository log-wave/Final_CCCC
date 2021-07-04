package com.kh.Final_cccc.Files.service;

import java.util.ArrayList;

import com.kh.Final_cccc.Event.model.vo.PageInfo;
import com.kh.Final_cccc.Files.vo.Files;

public interface FilesService {

	int insertFiles(Files fileList);

	ArrayList<Files> selectFiles(int eventNo);

	ArrayList<Files> selectFileList(PageInfo pi);

}
