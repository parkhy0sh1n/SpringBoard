package com.spring.board.service;

import javax.servlet.http.HttpSession;

import com.spring.board.vo.UserVo;

public interface userService {

	public String login(UserVo userVo, HttpSession session) throws Exception;

	public void logout(HttpSession session) throws Exception;

	public void insertUser(UserVo userVo) throws Exception;
	
	public int idCheck(String userId) throws Exception;

}