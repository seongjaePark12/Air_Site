package com.psj.air_reservation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.psj.air_reservation.order.OrderVO;
import com.psj.air_reservation.rv.AirDayVO;

@Service
public interface OrderDAO {

	public List<AirDayVO> getAirSearchDep(@Param("AIR_RV_DEP")String AIR_RV_DEP,@Param("AIR_RV_ARR")String AIR_RV_ARR,@Param("AIR_RV_GO")String AIR_RV_GO);

	public List<AirDayVO> getAirSearchArr(@Param("AIR_RV_DEP")String AIR_RV_DEP,@Param("AIR_RV_ARR")String AIR_RV_ARR,@Param("AIR_RV_BACK")String AIR_RV_BACK);

	public AirDayVO getfindList(@Param("AIR_RV_IDX") int AIR_RV_IDX);

	public void listInput(@Param("AIR_RV_IDX")int AIR_RV_IDX, @Param("AIR_AIR_CODE")String AIR_AIR_CODE, @Param("AIR_USER_MID")String AIR_USER_MID, @Param("AIR_RV_DEP")String AIR_RV_DEP,
			@Param("AIR_RV_ARR")String AIR_RV_ARR, @Param("AIR_RV_DAY")String AIR_RV_DAY, @Param("AIR_RV_TIME")String AIR_RV_TIME, @Param("cnt")int cnt,@Param("AIR_ORDER_WAY")int AIR_ORDER_WAY, @Param("AIR_RV_PP")int AIR_RV_PP);

	public void listUpdate(@Param("AIR_RV_IDX")int AIR_RV_IDX, @Param("AIR_USER_MID")String AIR_USER_MID, @Param("AIR_RV_DAY")String AIR_RV_DAY, @Param("cnt") int cnt);

	public List<OrderVO> findway(@Param("mid")String mid);

}
