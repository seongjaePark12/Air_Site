package com.psj.air_reservation.dao;

import org.apache.ibatis.annotations.Param;

import com.psj.air_reservation.user.UserVO;

public interface UserDAO {

	public UserVO getIdCheck(@Param("AIR_USER_MID") String AIR_USER_MID);

	public UserVO getEmailCheck(@Param("AIR_USER_EMAIL") String AIR_USER_EMAIL);

	public void setMemJoin(@Param("vo") UserVO vo);

	public UserVO getMidConfirm(@Param("name")String name,@Param("email") String email);

	public UserVO getPwdConfirm(@Param("mid")String mid,@Param("name") String name,@Param("email") String email);

	public void setPwdChange(@Param("mid")String mid,@Param("pwd") String pwd);

	public void setMemDelete(@Param("mid")String mid);

	public void setMyUpdate(@Param("vo")UserVO vo);

	
}
