package com.spring.board.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.RecruitDao;
import com.spring.board.vo.RecruitVo;

@Repository
public class RecruitDaoImpl implements RecruitDao {

	@Autowired
	private SqlSession sqlSession;


	@Override
	public String appJoin(RecruitVo recruitVo) throws Exception {
		return sqlSession.selectOne("recruit.appJoin", recruitVo);
	}

}
