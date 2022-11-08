package com.psj.air_reservation.order;

import lombok.Data;

@Data
public class OrderVO {
	private int AIR_ORDER_IDX;
	private int AIR_RV_IDX;
	private String AIR_AIR_CODE;
	private String AIR_USER_MID;
	private String AIR_RV_DEP;
	private String AIR_RV_ARR;
	private String AIR_RV_GO;
	private String AIR_RV_TIME;
	private int AIR_ORDER_WAY;
	private int AIR_ORDER_FC;
	private int AIR_ORDER_BC;
	private int AIR_ORDER_EC;
	private int AIR_RV_PP;
	private int AIR_ORDER_ORDER;
}
