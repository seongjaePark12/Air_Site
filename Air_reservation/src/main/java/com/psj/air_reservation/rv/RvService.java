package com.psj.air_reservation.rv;

import java.util.List;

public interface RvService {

	public List<AirVO> getAirList();

	public AirVO getAirOne(String AIR_AIR_CODE, String AIR_AIR_NAME);

	public void airInput(AirVO vo);

	public void delAir(String AIR_AIR_CODE);

	public void getAirInput(AirDayVO vo);

	public List<AirDayVO> getAirDayList(int startIndexNo, int pageSize);

	public int viewCnt();


}
