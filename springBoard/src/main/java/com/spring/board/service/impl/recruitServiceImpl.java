package com.spring.board.service.impl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.RecruitDao;
import com.spring.board.service.recruitService;
import com.spring.board.vo.RecruitVo;

@Service
public class recruitServiceImpl implements recruitService {

	@Autowired
	private RecruitDao recruitDao;

	@Override
	public String appJoin(RecruitVo recruitVo, HttpSession session) throws Exception {
		String name = recruitDao.appJoin(recruitVo);
		if (name != null) { // 세션 변수 저장
			session.setAttribute("seq", recruitVo.getSeq());
			session.setAttribute("name", name);
		}
		return name;
	}

}