package com.gd.test.web.test.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.test.web.test.dao.ITestDao2;

@Service
public class TestService2 implements ITestService2{
	@Autowired
	public ITestDao2 iTestDao2;

	@Override
	public int idCheck(HashMap<String, String> params) throws Throwable {
		return iTestDao2.idCheck(params);
	}

	@Override
	public void insertBM(HashMap<String, String> params) throws Throwable {
		iTestDao2.insertBM(params);
		
	}

	@Override
	public HashMap<String, String> getBM(HashMap<String, String> params) throws Throwable {
		return iTestDao2.getBM(params);
	}

	@Override
	public int getBCnt(HashMap<String, String> params) throws Throwable {
		return iTestDao2.getBCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getB(HashMap<String, String> params) throws Throwable {
		return iTestDao2.getB(params);
	}

	@Override
	public HashMap<String, String> getMem(HashMap<String, String> params) throws Throwable {
		return iTestDao2.getMem(params);
	}

	@Override
	public void insertData(HashMap<String, String> params) throws Throwable {
		iTestDao2.insertData(params);		
	}

	@Override
	public void updateHit(HashMap<String, String> params) throws Throwable {
		iTestDao2.updateHit(params);	
	}

	@Override
	public HashMap<String, String> getData(HashMap<String, String> params) throws Throwable {
		return iTestDao2.getData(params);
	}

	@Override
	public void updateData(HashMap<String, String> params) throws Throwable {
		iTestDao2.updateData(params);	
	}

	@Override
	public void deleteData(HashMap<String, String> params) throws Throwable {
		iTestDao2.deleteData(params);	
	}

	@Override
	public void updateBMData(HashMap<String, String> params) throws Throwable {
		iTestDao2.updateBMData(params);	
	}

	@Override
	public HashMap<String, String> getBMM(HashMap<String, String> params) throws Throwable {
		return iTestDao2.getBMM(params);
	}

	@Override
	public void deleteBMData(HashMap<String, String> params) throws Throwable {
		iTestDao2.deleteBMData(params);	
	}
}
