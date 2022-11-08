package com.psj.air_reservation.order;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.psj.air_reservation.rv.AirDayVO;

@Controller
@RequestMapping("/order")
public class OrderController {
	String msgFlag="";
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	// 비행편 검색
	@RequestMapping(value="/airSearch", method = RequestMethod.POST)
	public String airSearchPost(Model model,int AIR_ORDER_WAY, String AIR_RV_DEP,String AIR_RV_ARR, String AIR_RV_GO, String AIR_RV_BACK) {
		if(AIR_ORDER_WAY == 1) { // 편도
			List<AirDayVO> vos = orderService.getAirSearchDep(AIR_RV_DEP,AIR_RV_ARR,AIR_RV_GO); // 출발지역으로 가져오기
			model.addAttribute("vos", vos);
			model.addAttribute("AIR_ORDER_WAY", AIR_ORDER_WAY);
			
		}
		else if(AIR_ORDER_WAY == 2) { // 왕복
			List<AirDayVO> vos = orderService.getAirSearchDep(AIR_RV_DEP,AIR_RV_ARR,AIR_RV_GO); // 출발지역, 가는날짜 시작으로 가져오기
			List<AirDayVO> vos1 = orderService.getAirSearchArr(AIR_RV_DEP,AIR_RV_ARR,AIR_RV_BACK); // 도착지역, 도착날짜 시작으로 가져오기
			model.addAttribute("vos", vos);
			model.addAttribute("vos1", vos1);
			model.addAttribute("AIR_ORDER_WAY", AIR_ORDER_WAY);
		}
		return "order/orderAirList";
	}
	// 비행편 겟
	@ResponseBody
	@RequestMapping(value="/orderAirList", method = RequestMethod.POST)
	public String orderAirList(HttpSession session, int AIR_RV_PP, int AIR_RV_IDX, String AIR_RV_DAY, int AIR_ORDER_WAY) {
		OrderVO odVO = new OrderVO();
		// 리스트 저장을 위해 값 읽어오기
		AirDayVO vo = orderService.getfindList(AIR_RV_IDX);
		String AIR_USER_MID = (String)session.getAttribute("sMid");
		int cnt =0;
		if(vo.getAIR_RV_BP() == AIR_RV_PP) {
			odVO.setAIR_RV_PP(vo.getAIR_RV_BP());
			cnt = 1;
		}else if(vo.getAIR_RV_EP() == AIR_RV_PP) {
			odVO.setAIR_RV_PP(AIR_RV_PP);
			cnt = 2;
		}else if(vo.getAIR_RV_FP() == AIR_RV_PP) {
			odVO.setAIR_RV_PP(AIR_RV_PP);
			cnt = 3;
		}
		orderService.listInput(vo.getAIR_RV_IDX(),vo.getAIR_AIR_CODE(),AIR_USER_MID,vo.getAIR_RV_DEP(),vo.getAIR_RV_ARR(),vo.getAIR_RV_DAY(),vo.getAIR_RV_TIME(),cnt,AIR_ORDER_WAY,AIR_RV_PP);
		orderService.listUpdate(AIR_RV_IDX,AIR_USER_MID,vo.getAIR_RV_DAY(),cnt);
		return "/";
	}
	
	@RequestMapping(value="/ordergo", method = RequestMethod.GET)
	public String ordergo(HttpSession session,Model model) {
		String mid = (String)session.getAttribute("sMid");
		List<OrderVO> vos = orderService.findway(mid);
		model.addAttribute("vos", vos);
		return "order/orderGo";
	}
	@RequestMapping(value="/ordergo", method = RequestMethod.POST)
	public String ordergo(OrderVO vo,Model model) {
		model.addAttribute("vo", vo);
		return "order/pay";
	}
}
