package com.psj.air_reservation.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.psj.air_reservation.user.UserVO;

public interface AdminDAO {

	public int getNewMember();

	public int totRecCnt(@Param("level")int level);

	public int totRecCntMid(@Param("mid")String mid);

	public ArrayList<UserVO> getMemberList(@Param("startIndexNo")int startIndexNo, @Param("pageSize")int pageSize, @Param("level")int level);

	public ArrayList<UserVO> getMemberListMid(@Param("startIndexNo")int startIndexNo, @Param("pageSize")int pageSize, @Param("mid")String mid);

	public void setLevelUpdate(@Param("idx")int idx, @Param("level")int level);

	public void setMemberDelete(@Param("idx")int idx);

	public void setMemberLevel(@Param("idx")int idx, @Param("level")int level);
}
