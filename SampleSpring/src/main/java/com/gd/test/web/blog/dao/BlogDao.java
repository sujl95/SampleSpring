package com.gd.test.web.blog.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BlogDao implements IBlogDao{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getListcnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.getListCnt",params);
	}

	@Override
	public int idCheck(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("blog.idCheck",params);
	}

	@Override
	public void insertBM(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("blog.insertBM",params);
	}

	@Override
	public HashMap<String, String> getBM(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.getBM",params);
	}

	@Override
	public int getBCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.getBCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getB(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("blog.getB",params);
	}

	@Override
	public List<HashMap<String, String>> getBlog(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("blog.getBlog",params);
	}

	@Override
	public int getBlogCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.getBlogCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getBlogList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("blog.getBlogList",params);
	}

	@Override
	public int getAllBCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.getAllBCnt",params);
	}

	@Override
	public void updateHit(HashMap<String, String> params) throws Throwable {
		sqlSession.update("blog.updateHit",params);
	}

	@Override
	public HashMap<String, String> getData(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.getData",params);
	}

	@Override
	public void deleteBMData(HashMap<String, String> params) throws Throwable {
		sqlSession.update("blog.deleteBMData",params);	
	}

	@Override
	public void updateBMData(HashMap<String, String> params) throws Throwable {
		sqlSession.update("blog.updateBMData",params);	
	}

	@Override
	public void insertData(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("blog.insertData",params);
	}

	@Override
	public HashMap<String, String> getBMM(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.getBMM",params);
	}

	@Override
	public HashMap<String, String> getBMCT(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.getBMCT",params);
	}

	@Override
	public void updateCT(HashMap<String, String> params) throws Throwable {
		sqlSession.update("blog.updateCT",params);
	}

	@Override
	public void insertCT(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("blog.insertCT",params);
	}

	@Override
	public int getCTCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.getCTCnt",params);
	}

	@Override
	public int getCTAllCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.getCTAllCnt",params);
	}

	@Override
	public void updateData(HashMap<String, String> params) throws Throwable {
		sqlSession.update("blog.updateData",params);
	}

	@Override
	public HashMap<String, String> getcateData(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.getcateData",params);
	}
	
}
