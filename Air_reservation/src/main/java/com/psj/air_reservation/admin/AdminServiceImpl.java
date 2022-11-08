package com.psj.air_reservation.admin;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psj.air_reservation.dao.AdminDAO;
import com.psj.air_reservation.user.UserVO;


@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminDAO adminDAO;
	
	@Override
	public int getNewMember() {
		return adminDAO.getNewMember();
	}

	@Override
	public int totRecCnt(int level) {
		return adminDAO.totRecCnt(level);
	}
	
	@Override
	public int totRecCntMid(String mid) {
		return adminDAO.totRecCntMid(mid);
	}

	@Override
	public ArrayList<UserVO> getMemberList(int startIndexNo, int pageSize, int level) {
		return adminDAO.getMemberList(startIndexNo, pageSize, level);
	}

	@Override
	public ArrayList<UserVO> getMemberListMid(int startIndexNo, int pageSize, String mid) {
		return adminDAO.getMemberListMid(startIndexNo, pageSize, mid);
	}

	@Override
	public void setLevelUpdate(int idx, int level) {
		adminDAO.setLevelUpdate(idx, level);
	}

	@Override
	public void setMemberDelete(int idx) {
		adminDAO.setMemberDelete(idx);
	}

	@Override
	public void setMemberLevel(int idx, int level) {
		adminDAO.setMemberLevel(idx, level);	
	}
}
