package com.spring.board.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.UserDao;
import com.spring.board.vo.UserVo;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public String login(UserVo userVo) throws Exception {
		return sqlSession.selectOne("user.login", userVo);
	}

	@Override
	public int insertUser(UserVo userVo) throws Exception {
		return sqlSession.insert("user.insertUser", userVo);
	}
	
	@Override
	public int idCheck(String userId) throws Exception {
		int cnt = sqlSession.selectOne("user.idCheck", userId);
		return cnt;
	}

}
