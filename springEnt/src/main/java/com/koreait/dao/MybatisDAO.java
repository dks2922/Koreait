package com.koreait.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.koreait.vo.ContentboardVO;
import com.koreait.vo.Param;
@Repository
public interface MybatisDAO {

	/* 여기부터 페이지 제목*/
	void insertGA(ContentboardVO contentboardVO);

	int selectCounts(String subject);

	ArrayList<ContentboardVO> selectLists(Param param);

	ContentboardVO selectByIdxGame(int idx);

	void deleteCO(int idx);

	void updateCO(ContentboardVO contentboardVO);

	int selectCount();

	ArrayList<ContentboardVO> selectList(HashMap<String, Integer> hmap);










	
	
}
