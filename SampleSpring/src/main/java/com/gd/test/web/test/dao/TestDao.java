package com.gd.test.web.test.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TestDao implements ITestDao{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getList(HashMap<String,String> params) throws Throwable {
		//selectList(쿼리위치) : List형태의 조회
		//selectList(쿼리위치, 값) : List형태의 조회. 값을 쿼리에 넘겨줌.
		//쿼리 위치 : namespace.id(클래스.메소드와 동일)
		return sqlSession.selectList("test.getList", params);
	}

	@Override
	public int getListCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("test.getListCnt",params);
	}

	@Override
	public HashMap<String, String> getData(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("test.getData",params);
	}

	@Override
	public void updateHit(HashMap<String, String> params) throws Throwable {
		sqlSession.update("test.updateHit",params);
	}

	@Override
	public void insertData(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("test.insertData",params);
	}

	@Override
	public void updateData(HashMap<String, String> params) throws Throwable {
		sqlSession.update("test.updateData",params);		
	}

	@Override
	public void deleteData(HashMap<String, String> params) throws Throwable {
		sqlSession.delete("test.deleteData",params);
	}

	@Override
	public String tselectData(HashMap<String,String> params) throws Throwable {
		return sqlSession.selectOne("MEM.getIds",params);
	}

	@Override
	public HashMap<String, String> tselectData1(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("MEM.getId",params);
	}

	@Override
	public int Idcnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("MEM.Idcnt",params);
	}

	@Override
	public void inserttData(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("MEM.inserttData",params);
		
	}

	@Override
	public HashMap<String, String> getMem(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("test.getMem",params);
	}
}
