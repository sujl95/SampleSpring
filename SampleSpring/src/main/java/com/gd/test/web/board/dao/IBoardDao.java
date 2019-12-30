package com.gd.test.web.board.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface IBoardDao {

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

	public HashMap<String, String> getmoMem(HashMap<String, String> params)  throws Throwable;

	public void updatemData(HashMap<String, String> params) throws Throwable;



}
