package com.gd.test.web.test.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TestDao2 implements ITestDao2{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int idCheck(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("test2.idCheck",params);
	}

	@Override
	public void insertBM(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("test2.insertBM",params);
	}

	@Override
	public HashMap<String, String> getBM(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("test2.getBM",params);
	}

	@Override
	public int getBCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("test2.getBCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getB(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("test2.getB",params);
	}

	@Override
	public HashMap<String, String> getMem(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("test2.getMem",params);
	}

	@Override
	public void insertData(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("test2.insertData",params);
	}

	@Override
	public void updateHit(HashMap<String, String> params) throws Throwable {
		sqlSession.update("test2.updateHit",params);		
	}

	@Override
	public HashMap<String, String> getData(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("test2.getData",params);
	}

	@Override
	public void updateData(HashMap<String, String> params) throws Throwable {
		sqlSession.update("test2.updateData",params);
	}

	@Override
	public void deleteData(HashMap<String, String> params) throws Throwable {
		sqlSession.update("test2.deleteData",params);		
	}

	@Override
	public void updateBMData(HashMap<String, String> params) throws Throwable {
		sqlSession.update("test2.updateBMData",params);	
	}

	@Override
	public HashMap<String, String> getBMM(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("test2.getBMM",params);
	}

	@Override
	public void deleteBMData(HashMap<String, String> params) throws Throwable {
		sqlSession.update("test2.deleteBMData",params);	
	}
}
