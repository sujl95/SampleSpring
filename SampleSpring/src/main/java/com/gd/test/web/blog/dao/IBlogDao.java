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

	HashMap<String, String> getBMM(HashMap<String, String> params) throws Throwable;

	void updateCT(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getBMCT(HashMap<String, String> params) throws Throwable;

	void insertCT(HashMap<String, String> params) throws Throwable;

	int getCTCnt(HashMap<String, String> params) throws Throwable;

	int getCTAllCnt(HashMap<String, String> params) throws Throwable;

	void updateData(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getcateData(HashMap<String, String> params) throws Throwable;

	int geticateData(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getBMWCT(HashMap<String, String> params) throws Throwable;

	int getCTWAllCnt(HashMap<String, String> params) throws Throwable;

	int getCTWCnt(HashMap<String, String> params) throws Throwable;

	int getBlogReplyCnt(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getreplylist(HashMap<String, String> params) throws Throwable;

	void deleteData(HashMap<String, String> params) throws Throwable;

	void insertReply(HashMap<String, String> params) throws Throwable;







}
