package com.gd.test.web.test.service;

import java.util.HashMap;
import java.util.List;


public interface ITestService {

	public List<HashMap<String, String>> getList(HashMap<String,String> params) throws Throwable;

	public int getListcnt(HashMap<String, String> params) throws Throwable ;

	public HashMap<String, String> getData(HashMap<String, String> params) throws Throwable;

	public void updateHit(HashMap<String, String> params) throws Throwable;

	public void insertData(HashMap<String, String> params) throws Throwable;

	public void updateData(HashMap<String, String> params) throws Throwable;

	public void deleteData(HashMap<String, String> params) throws Throwable;

	public String tselectData(HashMap<String, String> params) throws Throwable;
	public HashMap<String,String> tselectData1(HashMap<String, String> params) throws Throwable;

	public int Idcnt(HashMap<String, String> params) throws Throwable;

	public void inserttData(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getMem(HashMap<String, String> params) throws Throwable;
	
}
