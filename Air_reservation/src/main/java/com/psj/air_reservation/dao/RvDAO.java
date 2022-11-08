package com.psj.air_reservation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.psj.air_reservation.rv.AirDayVO;
import com.psj.air_reservation.rv.AirVO;

public interface RvDAO {

	public List<AirVO> getAirList();

	public AirVO getAirOne(@Param("AIR_AIR_CODE")String AIR_AIR_CODE, @Param("AIR_AIR_NAME")String AIR_AIR_NAME);

	public void airInput(@Param("vo")AirVO vo);

	public void delAir(@Param("AIR_AIR_CODE")String AIR_AIR_CODE);

	public void getAirInput(@Param("vo")AirDayVO vo);

	public List<AirDayVO> getAirDayList(@Param("startIndexNo")int startIndexNo, @Param("pageSize")int pageSize);

	public int viewCnt();


}
