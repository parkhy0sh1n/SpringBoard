package com.spring.board.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.board.HomeController;
import com.spring.board.service.boardService;
import com.spring.board.service.recruitService;
import com.spring.board.service.userService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;
import com.spring.board.vo.RecruitVo;
import com.spring.board.vo.UserVo;
import com.spring.common.CommonUtil;

@Controller
public class BoardController {

	@Autowired
	boardService boardService;

	@Autowired
	userService userService;

	@Autowired
	recruitService recruitServcie;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	// 게시글 목록 조회
	@RequestMapping(value = "/board/boardList.do", method = RequestMethod.GET)
	public String boardList(Locale locale, Model model, PageVo pageVo) throws Exception {
		// 페이지당 보여질 게시글 수와 총 게시글 수 설정
		int itemsPerPage = 10;
		int totalCnt = boardService.selectBoardCnt();
		// 현재 페이지 번호 설정
		int pageNo = pageVo.getPageNo();
		if (pageNo == 0) {
			pageNo = 1;
			pageVo.setPageNo(pageNo);
		}
		// 선택된 카테고리가 없을 경우 기본 카테고리 설정
		String[] selectedCategories = pageVo.getSelectedCategories();
		if (selectedCategories == null || selectedCategories.length == 0) {
			selectedCategories = new String[] { "일반", "자유", "질문", "익명" };
			pageVo.setSelectedCategories(selectedCategories);
		}
		// 게시글 목록 조회
		List<BoardVo> boardList = boardService.SelectBoardList(pageVo);
		// 모델에 속성 추가
		model.addAttribute("boardList", boardList);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageNo", pageNo);
		return "board/boardList";
	}

	// 게시글 상세 조회
	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardView.do", method = RequestMethod.GET)
	public String boardView(Locale locale, Model model, @PathVariable("boardType") String boardType,
			@PathVariable("boardNum") int boardNum, HttpSession session) throws Exception {
		// 게시글 상세 조회
		BoardVo boardVo = boardService.selectBoard(boardType, boardNum);
		// 모델에 속성 추가
		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);
		return "board/boardView";
	}

	// 게시글 작성 페이지 이동
	@RequestMapping(value = "/board/boardWrite.do", method = RequestMethod.GET)
	public String boardWrite(Locale locale, Model model, HttpSession session) throws Exception {
		// 세션에서 'userName' 속성을 가져옴
		String userName = (String) session.getAttribute("userName");
		// 로그인 여부 확인
		if (userName == null) {
			// 로그인되지 않은 경우 로그인 페이지로 리다이렉션
			return "redirect:/user/login.do";
		}
		// 카테고리 목록 설정
		List<String> boardTypes = Arrays.asList("일반", "자유", "질문", "익명");
		model.addAttribute("boardTypes", boardTypes);
		// 기본 카테고리 설정 및 모델에 속성 추가
		String selectedType = "일반";
		model.addAttribute("board", new BoardVo());
		model.addAttribute("board.boardType", selectedType);
		return "board/boardWrite";
	}

	@RequestMapping(value = "/board/boardWriteAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardWriteAction(Locale locale, BoardVo boardVo, HttpSession session) throws Exception {
		// 세션에서 'userName' 속성을 가져옴
		String userName = (String) session.getAttribute("userName");
		// 로그인 여부 확인
		if (userName == null) {
			// 로그인되지 않은 경우 로그인 페이지로 리다이렉션
			return "redirect:/user/login.do";
		}
		// 작성자 정보 설정
		boardVo.setCreator(userName);
		// 게시글 삽입 및 결과 반환
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		int resultCnt = boardService.boardInsert(boardVo);
		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);
		System.out.println("callbackMsg::" + callbackMsg);
		return callbackMsg;
	}

	// 게시글 수정 액션
	@RequestMapping(value = "/board/boardUpdate.do", method = RequestMethod.POST)
	public String boardUpdate(BoardVo boardVo) throws Exception {
		// 게시글 수정
		boardService.boardUpdate(boardVo);
		return "redirect:/board/boardList.do";
	}

	// 게시글 삭제
	@RequestMapping(value = "/board/boardRemove.do", method = RequestMethod.GET)
	public String boardRemove(@RequestParam(value = "boardNum", required = false) Integer boardNum) throws Exception {
		// 게시글 삭제
		boardService.boardRemove(boardNum);
		return "redirect:/board/boardList.do";
	}

	// 로그인 페이지 이동(게시판)
	@RequestMapping("/user/login.do")
	public String login() {
		return "user/login";
	}

	// 로그인 처리(게시판)
	@RequestMapping("/user/login_check.do")
	public ModelAndView login_check(@ModelAttribute UserVo userVo, HttpSession session) throws Exception {
		// 사용자 로그인 처리
		String userName = userService.login(userVo, session);
		ModelAndView mav = new ModelAndView();
		if (userName != null) {
			// 로그인 성공 시 세션에 사용자 이름 저장 및 게시글 목록 페이지로 리다이렉션
			session.setAttribute("userName", userName);
			mav.setViewName("redirect:/board/boardList.do");
		} else {
			// 로그인 실패 시 로그인 페이지로 이동
			mav.setViewName("user/login");
			mav.addObject("message", "error");
		}
		return mav;
	}

	// 로그아웃 처리
	@RequestMapping("/user/logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) throws Exception {
		// 사용자 로그아웃 처리
		userService.logout(session);
		mav.setViewName("redirect:/board/boardList.do");
		mav.addObject("message", "logout");
		return mav;
	}

	// 회원 가입 페이지 이동
	@RequestMapping("/user/join.do")
	public String join() {
		return "user/join";
	}

	// 회원 가입 처리
	@RequestMapping(value = "/user/join.do", method = RequestMethod.POST)
	public String insertUser(@ModelAttribute("userVo") UserVo userVo, RedirectAttributes rttr) throws Exception {
		// 회원 가입 처리
		userService.insertUser(userVo);
		return "redirect:/board/boardList.do";
	}

	// 아이디 중복 확인
	@RequestMapping(value = "/user/idCheck.do", method = RequestMethod.GET)
	public @ResponseBody int idCheck(@RequestParam("userId") String userId) throws Exception {
		// 아이디 중복 확인
		int cnt = userService.idCheck(userId);
		return cnt;
	}

	// MBTI 테스트 페이지 이동
	@RequestMapping(value = "/board/mbti.do", method = RequestMethod.GET)
	public String mbti(HttpSession session) throws Exception {
		String userName = (String) session.getAttribute("userName");
		return "mbti/mbti";
	}

	// 로그인 페이지 이동(입사지원)
	@RequestMapping("/recruit/login.do")
	public String recruitLogin() {
		return "recruit/login";
	}

	// 입사지원서 페이지 이동(입사지원)
	@RequestMapping("/recruit/main.do")
	public String main() {
		return "recruit/main";
	}

	// 입사지원서 페이지 입장(입사지원)
	@RequestMapping(value = "/recruit/appJoin.do", method = RequestMethod.POST)
	public String appJoin(@RequestParam("name") String name, @RequestParam("phone") String phone, Model model) {
	    model.addAttribute("name", name);
	    model.addAttribute("phone", phone);
	    return "recruit/main"; // 요청을 직접 main.jsp로 포워딩
	}

}
