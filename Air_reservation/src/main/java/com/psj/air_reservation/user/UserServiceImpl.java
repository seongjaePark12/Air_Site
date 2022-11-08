package com.psj.air_reservation.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psj.air_reservation.dao.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDAO;
	
	@Override
	public UserVO getIdCheck(String AIR_USER_MID) {
		return userDAO.getIdCheck(AIR_USER_MID);
	}
	@Override
	public UserVO getEmailCheck(String AIR_USER_EMAIL) {
		return userDAO.getEmailCheck(AIR_USER_EMAIL);
	}
	@Override
	public void setMemJoin(UserVO vo) {
		userDAO.setMemJoin(vo);
	}
	@Override
	public UserVO getMidConfirm(String name, String email) {
		return userDAO.getMidConfirm(name,email);
	}
	@Override
	public UserVO getPwdConfirm(String mid, String name, String email) {
		return userDAO.getPwdConfirm(mid,name,email);
	}
	@Override
	public void setPwdChange(String mid, String pwd) {
		userDAO.setPwdChange(mid,pwd);
	}
	@Override
	public void setMemDelete(String mid) {
		userDAO.setMemDelete(mid);		
	}
	@Override
	public void setMyUpdate(UserVO vo) {
		userDAO.setMyUpdate(vo);
	}

}
