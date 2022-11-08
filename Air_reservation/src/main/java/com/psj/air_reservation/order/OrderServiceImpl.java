package com.psj.air_reservation.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psj.air_reservation.dao.OrderDAO;
import com.psj.air_reservation.rv.AirDayVO;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDAO orderDAO;
	
	@Override
	public List<AirDayVO> getAirSearchDep(String AIR_RV_DEP, String AIR_RV_ARR, String AIR_RV_GO) {
		return orderDAO.getAirSearchDep(AIR_RV_DEP, AIR_RV_ARR, AIR_RV_GO);
	}

	@Override
	public List<AirDayVO> getAirSearchArr(String AIR_RV_DEP, String AIR_RV_ARR, String AIR_RV_BACK) {
		return orderDAO.getAirSearchArr(AIR_RV_DEP, AIR_RV_ARR, AIR_RV_BACK);
	}

	@Override
	public AirDayVO getfindList(int AIR_RV_IDX) {
		return orderDAO.getfindList(AIR_RV_IDX);
	}

	@Override
	public void listInput(int AIR_RV_IDX, String AIR_AIR_CODE, String AIR_USER_MID, String AIR_RV_DEP,
			String AIR_RV_ARR, String AIR_RV_DAY, String AIR_RV_TIME, int cnt,int AIR_ORDER_WAY, int AIR_RV_PP) {
		orderDAO.listInput(AIR_RV_IDX,AIR_AIR_CODE,AIR_USER_MID,AIR_RV_DEP,AIR_RV_ARR,AIR_RV_DAY,AIR_RV_TIME,cnt,AIR_ORDER_WAY,AIR_RV_PP);
	}

	@Override
	public void listUpdate(int AIR_RV_IDX, String AIR_USER_MID, String AIR_RV_DAY, int cnt) {
		orderDAO.listUpdate(AIR_RV_IDX,AIR_USER_MID,AIR_RV_DAY,cnt);
	}

	@Override
	public List<OrderVO> findway(String mid) {
		return orderDAO.findway(mid);
	}

}
