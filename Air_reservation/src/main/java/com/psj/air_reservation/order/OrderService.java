package com.psj.air_reservation.order;

import java.util.List;

import com.psj.air_reservation.rv.AirDayVO;

public interface OrderService {

	public List<AirDayVO> getAirSearchDep(String AIR_RV_DEP, String AIR_RV_ARR, String AIR_RV_GO);

	public List<AirDayVO> getAirSearchArr(String AIR_RV_DEP, String AIR_RV_ARR, String AIR_RV_BACK);

	public AirDayVO getfindList(int AIR_RV_IDX);

	public void listInput(int AIR_RV_IDX, String AIR_AIR_CODE, String AIR_USER_MID, String AIR_RV_DEP,
			String AIR_RV_ARR, String AIR_RV_DAY, String AIR_RV_TIME, int cnt,int AIR_ORDER_WAY, int AIR_RV_PP);

	public void listUpdate(int AIR_RV_IDX, String AIR_USER_MID, String AIR_RV_DAY, int cnt);

	public List<OrderVO> findway(String mid);

}
