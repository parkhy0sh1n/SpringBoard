package com.spring.board.service.impl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.UserDao;
import com.spring.board.service.userService;
import com.spring.board.vo.UserVo;

@Service
public class userServiceImpl implements userService {

	@Autowired
	private UserDao userDao;

	@Override
	public String login(UserVo userVo, HttpSession session) throws Exception {
		String userName = userDao.login(userVo);
		if (userName != null) { // 세션 변수 저장
			session.setAttribute("userId", userVo.getUserId());
			session.setAttribute("userName", userName);
		}
		return userName;
	}

	@Override
	public void logout(HttpSession session) throws Exception {
		session.invalidate(); 
	}

	@Override
	public void insertUser(UserVo userVo) throws Exception {
		userDao.insertUser(userVo);
	}

	@Override
	public int idCheck(String userId) throws Exception {
		int cnt = userDao.idCheck(userId);
		return cnt;
	}

}