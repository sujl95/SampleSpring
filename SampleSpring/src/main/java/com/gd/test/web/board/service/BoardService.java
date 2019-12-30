package com.gd.test.web.board.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.test.web.board.dao.IBoardDao;


@Service
public class BoardService implements IBoardService{
	@Autowired
	public IBoardDao iBoardDao;
	
	
	@Override
	public int Idcnt(HashMap<String, String> params) throws Throwable {
		return iBoardDao.Idcnt(params);
	}

	@Override
	public void insertbData(HashMap<String, String> params) throws Throwable {
		iBoardDao.insertbData(params);
		
	}

	@Override
	public HashMap<String, String> getMem(HashMap<String, String> params) throws Throwable {
		return iBoardDao.getMem(params);
	}

	@Override
	public int getListcnt(HashMap<String, String> params) throws Throwable {
		return iBoardDao.getListcnt(params);
	}

	@Override
	public List<HashMap<String, String>> getList(HashMap<String, String> params) throws Throwable {
		return iBoardDao.getList(params);
	}

	@Override
	public void updateHit(HashMap<String, String> params) throws Throwable {
		iBoardDao.updateHit(params);
	}

	@Override
	public HashMap<String, String> getData(HashMap<String, String> params) throws Throwable {
		return iBoardDao.getData(params);
	}

	@Override
	public void insertData(HashMap<String, String> params) throws Throwable {
		iBoardDao.insertData(params);
	}

	@Override
	public void updateData(HashMap<String, String> params) throws Throwable {
		iBoardDao.updateData(params);
	}

	@Override
	public void deleteData(HashMap<String, String> params) throws Throwable {
		iBoardDao.deleteData(params);
	}

	@Override
	public HashMap<String, String> getmoMem(HashMap<String, String> params) throws Throwable {
		return iBoardDao.getmoMem(params);
	}

	@Override
	public void updatemData(HashMap<String, String> params) throws Throwable {
		iBoardDao.updatemData(params);
	}

	
	
}
