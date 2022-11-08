package com.psj.air_reservation.user;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class UserController {
	String msgFlag="";
	
	@Autowired
	UserService userService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	// 회원 가입폼
	@RequestMapping(value="/join", method = RequestMethod.GET)
	public String joinGet() {
		return "user/join";
	}
	// 회원 가입처리하기
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public String joinPost(UserVO vo) {
		// 아이디 중복 체크
		if(userService.getIdCheck(vo.getAIR_USER_MID()) != null) {
			msgFlag = "memIdCheckNo";
			return "redirect:/msg/" + msgFlag;
		}
		// 이메일 중복 체크
		if(userService.getEmailCheck(vo.getAIR_USER_EMAIL()) != null) {
			msgFlag = "memEmailCheckNo";
			return "redirect:/msg/" + msgFlag;
		}
		// 비밀번호 암호화 처리
		vo.setAIR_USER_PWD(passwordEncoder.encode(vo.getAIR_USER_PWD()));
		// DB에 가입회원 등록하기
	    userService.setMemJoin(vo);
	    return "redirect:/msg/memJoinOk";
	}

	// 회원 아이디 검색하기
	@ResponseBody
	@RequestMapping(value="/idCheck", method = RequestMethod.POST)
	public String idCheckPost(String AIR_USER_MID) {
		String res = "0";
		UserVO vo = userService.getIdCheck(AIR_USER_MID);
		if(vo != null) res = "1";
		return res;
	}
	// 회원 이메일 검색하기
	@ResponseBody
	@RequestMapping(value="/emailCheck", method = RequestMethod.POST)
	public String emailCheckPost(String AIR_USER_EMAIL) {
		String res = "0";
		UserVO vo = userService.getEmailCheck(AIR_USER_EMAIL);
		if(vo != null) res = "1";
		return res;
	}
	
	// 로그인 홈 호출
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String loginGet(HttpServletRequest request) {
		return "/";
	}
	
	// 로그인 인증처리
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String loginPost(String AIR_USER_MID, String AIR_USER_PWD, HttpSession session, HttpServletResponse response, HttpServletRequest request) {
		UserVO vo = userService.getIdCheck(AIR_USER_MID);
		
		if(vo != null && passwordEncoder.matches(AIR_USER_PWD, vo.getAIR_USER_PWD()) && vo.getAIR_USER_DEL().equals("NO")) {
			String strLevel = "";
			if(vo.getAIR_USER_LEVEL() == 0) strLevel = "관리자";
			else if(vo.getAIR_USER_LEVEL() == 1) strLevel = "여행고수";
			else if(vo.getAIR_USER_LEVEL() == 2) strLevel = "여행중수";
			else if(vo.getAIR_USER_LEVEL() == 3) strLevel = "여행초보";
			else if(vo.getAIR_USER_LEVEL() == 4) strLevel = "여행입문";
			session.setAttribute("sMid", AIR_USER_MID);
			session.setAttribute("sName", vo.getAIR_USER_NAME());
			session.setAttribute("sLevel", vo.getAIR_USER_LEVEL());
			session.setAttribute("sTel", vo.getAIR_USER_NUMBER());
			session.setAttribute("sAdd", vo.getAIR_USER_ADDRESS());
			session.setAttribute("sEmail", vo.getAIR_USER_EMAIL());
			session.setAttribute("sStrLevel", strLevel);
			msgFlag = "loginOk";
		}
		else {
			msgFlag = "loginNo";
		}
		return "redirect:/msg/"+msgFlag;
	}
	
	// 로그아웃
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutGet(HttpSession session) {
		session.invalidate();
		return "/home";
	}

	// 아이디 찾기 폼
	@RequestMapping(value="/midConfirm", method = RequestMethod.GET)
	public String midConfirmGet() {
		return "user/midConfirm";
	}
	
	// 아이디 찾기
	@RequestMapping(value="/midConfirm", method = RequestMethod.POST)
	public String midConfirmPost(String name, String email, Model model) {
		UserVO vo = userService.getMidConfirm(name, email);
		if(vo != null) {
			String mid = vo.getAIR_USER_MID().substring(0,5)+"**";
			model.addAttribute("mid",mid);
			return "user/midConfirm2";
		}
		else {
			msgFlag = "midConfirmNo";
			return "redirect:/msg/" + msgFlag;
		}
	}
	// 비밀번호 찾기 폼
	@RequestMapping(value="/pwdConfirm", method = RequestMethod.GET)
	public String pwdConfirmGet() {
		return "user/pwdConfirm";
	}
	// 임시비밀번호 발급해서 메일로보냄
	@RequestMapping(value="/pwdConfirm", method = RequestMethod.POST)
	public String pwdConfirmPost(String mid, String name, String email, Model model) {
		UserVO vo = userService.getPwdConfirm(mid, name, email);
		if(vo != null) {
			// 임시비밀번호를 만들자
			UUID uid = UUID.randomUUID();
			String pwd = uid.toString().substring(0,8);
			userService.setPwdChange(mid, passwordEncoder.encode(pwd));
			String content = pwd;
			model.addAttribute("content",content);
			return "user/pwdConfirm2";
		}
		else {
			msgFlag = "pwdConfirmNo";
			return "redirect:/msg/" + msgFlag;
		}
	}
	
	//------------------마이페이지---------------
	
	// 마이페이지 홈 호출
	@RequestMapping(value="/myPage", method = RequestMethod.GET)
	public String myPageGet(Model model, HttpSession session) {
		return "user/mypage/mypage";
	}
	
	
	// 회원 탈퇴
	@RequestMapping(value="/userDelete")
	public String userDeleteGet(HttpSession session) {
		String mid = (String)session.getAttribute("sMid");
		userService.setMemDelete(mid);
		msgFlag = "memDeleteOk";
		return "redirect:/msg/"+msgFlag;
	}
	
	// 비밀번호 체크 홈
	@RequestMapping(value="/pwdCheck", method = RequestMethod.GET)
	public String pwdCheckGet() {
		return "user/mypage/pwdCheck";
	}
	// 비밀번호 확인 처리
	@RequestMapping(value="/pwdCheck", method = RequestMethod.POST)
	public String pwdCheckPost(String pwd, HttpSession session, Model model) {
		String mid = (String) session.getAttribute("sMid");
		UserVO vo = userService.getIdCheck(mid);
		if(vo != null && passwordEncoder.matches(pwd, vo.getAIR_USER_PWD())) {
			session.setAttribute("sPwd", pwd);
			model.addAttribute("vo", vo);
			return "redirect:/user/myUpdate";
		}
		else {
			msgFlag = "pwdCheckNo";
			return "redirect:/msg/"+msgFlag;
		}
	}
	// 회원 정보 변경폼 불러오기
	@RequestMapping(value="/myUpdate", method = RequestMethod.GET)
	public String memUpdateGet(Model model, HttpSession session) {
		String mid = (String) session.getAttribute("sMid");
		UserVO vo = userService.getIdCheck(mid);
		model.addAttribute("vo", vo);
		return "user/mypage/myUpdate";
	}
	
	// 회원 정보 변경하기
	@RequestMapping(value="/myUpdate", method = RequestMethod.POST)
	public String myUpdatePost(UserVO vo, HttpSession session) {
		String email = (String) session.getAttribute("sEmail");
		
		// 이메일 중복체크하기 ( 이메일이 변경되었으면 새롭게 이메일을 세션에 등록시켜준다.)
		if(!email.equals(vo.getAIR_USER_EMAIL())) {
			if(userService.getEmailCheck(vo.getAIR_USER_EMAIL()) != null) {
				msgFlag = "memEmailCheckNo";
				return "redirect:/msg/" + msgFlag;
			}
			else {
				session.setAttribute("sEmail", vo.getAIR_USER_EMAIL());
			}
		}
		vo.setAIR_USER_PWD(passwordEncoder.encode(vo.getAIR_USER_PWD()));
		
		userService.setMyUpdate(vo);
		return "redirect:/msg/myUpdateOk";
	}


	
}
