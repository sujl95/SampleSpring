package com.gd.test.web.board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao implements IBoardDao{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int Idcnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("board.Idcnt",params);
	}

	@Override
	public void insertbData(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("board.insertbData",params);
		
	}

	@Override
	public HashMap<String, String> getMem(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("board.getMem",params);
	}

	@Override
	public int getListcnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("board.getListCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("board.getList",params);
	}

	@Override
	public void updateHit(HashMap<String, String> params) throws Throwable {
		sqlSession.update("board.updateHit",params);
	}

	@Override
	public HashMap<String, String> getData(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("board.getData",params);
	}

	@Override
	public void insertData(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("board.insertData",params);
	}

	@Override
	public void updateData(HashMap<String, String> params) throws Throwable {
		sqlSession.update("board.updateData",params);		
	}

	@Override
	public void deleteData(HashMap<String, String> params) throws Throwable {
		sqlSession.update("board.deleteData",params);		
	}

	@Override
	public HashMap<String, String> getmoMem(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("board.getmoMem",params);
	}

	@Override
	public void updatemData(HashMap<String, String> params) throws Throwable {
		sqlSession.update("board.updatemData",params);		
	}

}
