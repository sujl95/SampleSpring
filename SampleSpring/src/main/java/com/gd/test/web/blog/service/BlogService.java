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

	@Override
	public HashMap<String, String> getBMM(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getBMM(params);
	}

	@Override
	public HashMap<String, String> getBMCT(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getBMCT(params);
	}

	@Override
	public void updateCT(HashMap<String, String> params) throws Throwable {
		iBlogDao.updateCT(params);
	}

//	카테고리 등록
	@Override
	public void insertCT(HashMap<String, String> params) throws Throwable {
		iBlogDao.insertCT(params);
	}

//	카테고리 cnt
	@Override
	public int getCTCnt(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getCTCnt(params);
	}

	@Override
	public int getCTAllCnt(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getCTAllCnt(params);
	}

	@Override
	public void updateData(HashMap<String, String> params) throws Throwable {
		iBlogDao.updateData(params);
	}

	@Override
	public HashMap<String, String> getcateData(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getcateData(params);
	}

	@Override
	public int geticateData(HashMap<String, String> params) throws Throwable {
		return iBlogDao.geticateData(params);
	}

	@Override
	public HashMap<String, String> getBMWCT(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getBMWCT(params);
	}

	@Override
	public int getCTWAllCnt(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getCTWAllCnt(params);
	}

	@Override
	public int getCTWCnt(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getCTWCnt(params);
	}

	@Override
	public int getBlogReplyCnt(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getBlogReplyCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getreplylist(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getreplylist(params);
	}

	@Override
	public void deleteData(HashMap<String, String> params) throws Throwable {
		iBlogDao.deleteData(params);
	}

	@Override
	public void insertReply(HashMap<String, String> params) throws Throwable {
		iBlogDao.insertReply(params);
	}

	@Override
	public void deleteReply(HashMap<String, String> params) throws Throwable {
		iBlogDao.deleteReply(params);
	}



		

}
