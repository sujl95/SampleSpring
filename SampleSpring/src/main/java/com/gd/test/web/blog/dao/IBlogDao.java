package com.gd.test.web.blog.dao;

import java.util.HashMap;
import java.util.List;

public interface IBlogDao {

	int getListcnt(HashMap<String, String> params) throws Throwable;

	int idCheck(HashMap<String, String> params) throws Throwable;

	void insertBM(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getBM(HashMap<String, String> params) throws Throwable;

	int getBCnt(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getB(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getBlog(HashMap<String, String> params) throws Throwable;

	int getBlogCnt(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getBlogList(HashMap<String, String> params) throws Throwable;

	int getAllBCnt(HashMap<String, String> params) throws Throwable;

	void updateHit(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getData(HashMap<String, String> params) throws Throwable;

	void deleteBMData(HashMap<String, String> params) throws Throwable;

	void updateBMData(HashMap<String, String> params) throws Throwable;

	void insertData(HashMap<String, String> params) throws Throwable;


}
