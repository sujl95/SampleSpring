package com.gd.test.web.test.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.test.web.test.dao.ITestDao;


@Service
public class TestService implements ITestService{
	@Autowired
	public ITestDao iTestDao;
	
	@Override
	public List<HashMap<String, String>> getList(HashMap<String,String> params) throws Throwable {
		return iTestDao.getList(params);
	}

	@Override
	public int getListcnt(HashMap<String, String> params) throws Throwable {
		return iTestDao.getListCnt(params);
	}

	@Override
	public HashMap<String, String> getData(HashMap<String, String> params) throws Throwable {
		return iTestDao.getData(params);
	}

	@Override
	public void updateHit(HashMap<String, String> params) throws Throwable {
		iTestDao.updateHit(params);
	}

	@Override
	public void insertData(HashMap<String, String> params) throws Throwable{
		iTestDao.insertData(params);
	}

	@Override
	public void updateData(HashMap<String, String> params) throws Throwable {
		iTestDao.updateData(params);		
	}

	@Override
	public void deleteData(HashMap<String, String> params) throws Throwable {
		iTestDao.deleteData(params);	
	}

	@Override
	public String tselectData(HashMap<String, String> params) throws Throwable {
		return iTestDao.tselectData(params);
		
	}

	@Override
	public HashMap<String, String> tselectData1(HashMap<String, String> params) throws Throwable {
		return iTestDao.tselectData1(params);
	}

	@Override
	public int Idcnt(HashMap<String, String> params) throws Throwable {
		return iTestDao.Idcnt(params);
	}

	@Override
	public void inserttData(HashMap<String, String> params) throws Throwable {
		iTestDao.inserttData(params);
		
	}

	@Override
	public HashMap<String, String> getMem(HashMap<String, String> params) throws Throwable {
		return iTestDao.getMem(params);
	}
}
