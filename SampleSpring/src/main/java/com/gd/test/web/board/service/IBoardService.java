package com.gd.test.web.board.service;

import java.util.HashMap;
import java.util.List;




public interface IBoardService {

	public int Idcnt(HashMap<String, String> params) throws Throwable;

	public void insertbData(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getMem(HashMap<String, String> params) throws Throwable;

	public int getListcnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getList(HashMap<String, String> params) throws Throwable;

	public void updateHit(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getData(HashMap<String, String> params) throws Throwable;

	public void insertData(HashMap<String, String> params) throws Throwable;

	public void updateData(HashMap<String, String> params) throws Throwable;

	public void deleteData(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getmoMem(HashMap<String, String> params) throws Throwable;

	public void updatemData(HashMap<String, String> params) throws Throwable;


	

	
}
