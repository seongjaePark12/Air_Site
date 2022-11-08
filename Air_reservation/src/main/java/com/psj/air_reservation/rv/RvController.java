package com.psj.air_reservation.rv;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/rv")
public class RvController {
	String msgFlag="";
	@Autowired
	RvService rvService;
	
	// 비행기등록 폼 호출
	@RequestMapping(value="/airinput", method = RequestMethod.GET)
	public String airGet(Model model){
		List<AirVO> airVos = rvService.getAirList();
		model.addAttribute("airVos", airVos);
		return"adminpage/air/airplane";
	}
	
	// 비행기 등록하기
	@ResponseBody
	@RequestMapping(value="/airplaneInput", method = RequestMethod.POST)
	public String airinput(AirVO vo) {
		AirVO imsiVo  = rvService.getAirOne(vo.getAIR_AIR_CODE(), vo.getAIR_AIR_NAME());
		if(imsiVo != null) return "0";
		rvService.airInput(vo);
		return "1";
	}
	
	// 비행기 삭제하기
	@ResponseBody
	@RequestMapping(value="/delAir", method = RequestMethod.POST)
	public String delair(String AIR_AIR_CODE) {
		rvService.delAir(AIR_AIR_CODE);
		return "";
	}
	
	// 비행기일정등록 폼 호출
	@RequestMapping(value="/airday", method = RequestMethod.GET)
	public String airdayGet(Model model){
		List<AirVO> airVos = rvService.getAirList();
		model.addAttribute("airVos", airVos);
		return"adminpage/air/airday";
	}
	
	// 비행기일정등록
	@RequestMapping(value="/airday", method = RequestMethod.POST)
	public String airdayPost(AirDayVO vo){
		System.out.println(vo);
		rvService.getAirInput(vo);
		msgFlag = "AirInput";
		return "redirect:/msg/" + msgFlag;
	}
	
	// 비행기일정 폼 호출
	@RequestMapping(value="/airdayList", method = RequestMethod.GET)
	public String airdayListGet(Model model,
			@RequestParam(name="pag", defaultValue="1", required=false) int pag,
			@RequestParam(name="pageSize", defaultValue = "5", required = false) int pageSize
			){
		int totRecCnt = rvService.viewCnt();
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStartNo = totRecCnt - startIndexNo;
		int blockSize = 3;
		int curBlock = (pag - 1) / blockSize;
		int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
		List<AirDayVO> airVos = rvService.getAirDayList(startIndexNo, pageSize);
		model.addAttribute("airVos", airVos);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totPage", totPage);
		model.addAttribute("curScrStartNo", curScrStartNo);
		model.addAttribute("blockSize", blockSize);
		model.addAttribute("curBlock", curBlock);
		model.addAttribute("lastBlock", lastBlock);
		return"adminpage/air/airdayList";
	}
	
	
}
