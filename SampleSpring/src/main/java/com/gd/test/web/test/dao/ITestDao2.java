package com.gd.test.web.test.dao;

import java.util.HashMap;
import java.util.List;

public interface ITestDao2 {

	int idCheck(HashMap<String, String> params) throws Throwable;

	void insertBM(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getBM(HashMap<String, String> params) throws Throwable;

	int getBCnt(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getB(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getMem(HashMap<String, String> params) throws Throwable;

	void insertData(HashMap<String, String> params) throws Throwable;

	void updateHit(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getData(HashMap<String, String> params) throws Throwable;

	void updateData(HashMap<String, String> params) throws Throwable;

	void deleteData(HashMap<String, String> params) throws Throwable;

	void updateBMData(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getBMM(HashMap<String, String> params) throws Throwable;

	void deleteBMData(HashMap<String, String> params) throws Throwable;

}
