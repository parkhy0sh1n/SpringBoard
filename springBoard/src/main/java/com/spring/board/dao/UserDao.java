package com.spring.board.dao;

import com.spring.board.vo.UserVo;

public interface UserDao {

	public String login(UserVo userVo) throws Exception;

	public int insertUser(UserVo userVo) throws Exception;
	
	public int idCheck(String userId) throws Exception;

}
