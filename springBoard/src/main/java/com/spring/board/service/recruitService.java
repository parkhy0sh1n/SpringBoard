package com.spring.board.service;

import javax.servlet.http.HttpSession;

import com.spring.board.vo.RecruitVo;

public interface recruitService {

	public String appJoin(RecruitVo recruitVo, HttpSession session) throws Exception;

}