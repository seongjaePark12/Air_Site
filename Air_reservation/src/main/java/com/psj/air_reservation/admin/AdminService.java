package com.psj.air_reservation.admin;

import java.util.ArrayList;

import com.psj.air_reservation.user.UserVO;

public interface AdminService {

	public int getNewMember();

	public int totRecCnt(int level);

	public int totRecCntMid(String mid);

	public ArrayList<UserVO> getMemberList(int startIndexNo, int pageSize, int level);

	public ArrayList<UserVO> getMemberListMid(int startIndexNo, int pageSize, String mid);

	public void setLevelUpdate(int idx, int level);

	public void setMemberDelete(int idx);

	public void setMemberLevel(int idx, int level);

}
