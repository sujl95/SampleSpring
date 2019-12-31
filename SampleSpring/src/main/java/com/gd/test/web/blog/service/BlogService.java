package com.gd.test.web.blog.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.test.web.blog.dao.IBlogDao;

@Service
public class BlogService implements IBlogService {
	@Autowired
	public IBlogDao iBlogDao;

	@Override
	public int getListcnt(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getListcnt(params);
	}

	@Override
	public int idCheck(HashMap<String, String> params) throws Throwable {
		return iBlogDao.idCheck(params);
	}

	@Override
	public void insertBM(HashMap<String, String> params) throws Throwable {
		iBlogDao.insertBM(params);
	}

	@Override
	public HashMap<String, String> getBM(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getBM(params);
	}

	@Override
	public int getBCnt(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getBCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getB(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getB(params);
	}

	@Override
	public List<HashMap<String, String>> getBlog(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getBlog(params);
	}

	@Override
	public int getBlogCnt(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getBlogCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getBlogList(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getBlogList(params);
	}

	@Override
	public int getAllBCnt(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getAllBCnt(params);
	}

	@Override
	public void updateHit(HashMap<String, String> params) throws Throwable {
		iBlogDao.updateHit(params);
	}

	@Override
	public HashMap<String, String> getData(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getData(params);
	}

	@Override
	public void deleteBMData(HashMap<String, String> params) throws Throwable {
		iBlogDao.deleteBMData(params);
	}

	@Override
	public void updateBMData(HashMap<String, String> params) throws Throwable {
		iBlogDao.updateBMData(params);
	}

	@Override
	public void insertData(HashMap<String, String> params) throws Throwable {
		iBlogDao.insertData(params);
	}

		

}
