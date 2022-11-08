package com.psj.air_reservation.rv;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psj.air_reservation.dao.RvDAO;


@Service
public class RvServiceImpl implements RvService {
	@Autowired
	RvDAO rvDAO;

	@Override
	public List<AirVO> getAirList() {
		return rvDAO.getAirList();
	}

	@Override
	public AirVO getAirOne(String AIR_AIR_CODE, String AIR_AIR_NAME) {
		return rvDAO.getAirOne(AIR_AIR_CODE,AIR_AIR_NAME);
	}

	@Override
	public void airInput(AirVO vo) {
		rvDAO.airInput(vo);
	}

	@Override
	public void delAir(String AIR_AIR_CODE) {
		rvDAO.delAir(AIR_AIR_CODE);
	}

	@Override
	public void getAirInput(AirDayVO vo) {
		rvDAO.getAirInput(vo);		
	}

	@Override
	public List<AirDayVO> getAirDayList(int startIndexNo, int pageSize) {
		return rvDAO.getAirDayList(startIndexNo, pageSize);
	}

	@Override
	public int viewCnt() {
		return rvDAO.viewCnt();
	}
	
}
