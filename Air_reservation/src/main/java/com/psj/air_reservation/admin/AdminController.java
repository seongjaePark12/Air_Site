package com.psj.air_reservation.admin;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.psj.air_reservation.user.UserVO;


@Controller
@RequestMapping("/admin")
public class AdminController {
	String msgFlag="";
	@Autowired
	AdminService adminService;
	
	// 관리자 폼 호출
	@RequestMapping(value="/adminpage", method = RequestMethod.GET)
	public String adminGet(Model model){
		int newMember = adminService.getNewMember();
//		int newQuestion= adminService.getNewQuestion();
//		int newOrder = adminService.getNewOrder();
		model.addAttribute("newMember",newMember);
//		model.addAttribute("newQuestion",newQuestion);
//		model.addAttribute("newOrder",newOrder);
		return "adminpage/adminMain";
	}
////--------------------------회원 관리----------------------------------------	
	// 회원리스트
	@RequestMapping(value="/userlist", method = RequestMethod.GET)
	public String adMemberListGet(
			@RequestParam(name="pag", defaultValue="1", required=false) int pag,
			@RequestParam(name="pageSize", defaultValue = "5", required = false) int pageSize,
			@RequestParam(name="level", defaultValue="99", required=false) int level,
			@RequestParam(name="mid", defaultValue="", required=false) String mid,
			Model model) {
		/* 이곳부터 페이징 처리(블록페이지) 변수 지정 시작 */
	  int totRecCnt = 0;
	  if(mid.equals("")) {
	  	totRecCnt = adminService.totRecCnt(level);// 전체자료 갯수 검색(level처리)
	  }
	  else {
	  	totRecCnt = adminService.totRecCntMid(mid);	// 개별자료 검색
	  }
	  int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
	  int startIndexNo = (pag - 1) * pageSize;
	  int curScrStartNo = totRecCnt - startIndexNo;
	  int blockSize = 3;		// 한블록의 크기를 3개의 Page로 본다.(사용자가 지정한다.)
	  int curBlock = (pag - 1) / blockSize;		// 현재페이지의 블록위치
	  int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
	  /* 블록페이징처리 끝 */
	  ArrayList<UserVO> vos = new ArrayList<UserVO>();
	  if(mid.equals("")) {	// 전체자료 갯수 검색(level처리)
	  	vos = adminService.getMemberList(startIndexNo, pageSize, level);
	  }
	  else {								// 개별자료 검색
	  	vos = adminService.getMemberListMid(startIndexNo, pageSize, mid);
	  }
		model.addAttribute("vos", vos);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totPage", totPage);
		model.addAttribute("curScrStartNo", curScrStartNo);
		model.addAttribute("blockSize", blockSize);
		model.addAttribute("curBlock", curBlock);
		model.addAttribute("lastBlock", lastBlock);
		model.addAttribute("level", level);
		model.addAttribute("mid", mid);
		return "adminpage/member/memberList";
	}
	
	// 등급 변경
	@ResponseBody
	@RequestMapping(value="/adminMemberLevel", method = RequestMethod.POST)
	public String adminMemberLevelPost(int idx,int level) {
		adminService.setLevelUpdate(idx, level);
		return "";
	}
	//회원 선택항목 삭제하기
	@ResponseBody
	@RequestMapping(value="/memberListDel", method = RequestMethod.POST)
	public String adminMemberDelPost(String delItems) {
		String[] idxs = delItems.split("/");
		for(String idx : idxs) {
			adminService.setMemberDelete(Integer.parseInt(idx));
		}
		return"";
	}
	//회원 선택항목 등급변경
	@ResponseBody
	@RequestMapping(value="/memberListLevel", method = RequestMethod.GET)
	public String adminMemberLevelPost(String levelItems, int level) {
		String[] idxs = levelItems.split("/");
		for(String idx : idxs) {
			adminService.setMemberLevel(Integer.parseInt(idx), level);
		}
		return"";
	}
}
