package com.psj.air_reservation.user;

public interface UserService {

	public UserVO getIdCheck(String AIR_USER_MID);
	
	public UserVO getEmailCheck(String AIR_USER_EMAIL);

	public void setMemJoin(UserVO vo);

	public UserVO getMidConfirm(String name, String email);

	public UserVO getPwdConfirm(String mid, String name, String email);

	public void setPwdChange(String mid, String pwd);

	public void setMemDelete(String mid);

	public void setMyUpdate(UserVO vo);


}
