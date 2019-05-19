package com.ysd.entity;

import java.util.Date;

public class User {
private Integer uId;
private String loginName;
private String password;
private Integer isLockOut;
private String lastLoginTime;
private String createTime;
private Integer padWrongTime;
private String lockTime;
private String eMail;
private String mTel;
public Integer getuId() {
	return uId;
}
public void setuId(Integer uId) {
	this.uId = uId;
}
public String getLoginName() {
	return loginName;
}
public void setLoginName(String loginName) {
	this.loginName = loginName;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public Integer getIsLockOut() {
	return isLockOut;
}
public void setIsLockOut(Integer isLockOut) {
	this.isLockOut = isLockOut;
}
public String getLastLoginTime() {
	return lastLoginTime;
}
public void setLastLoginTime(String lastLoginTime) {
	this.lastLoginTime = lastLoginTime;
}


public String getCreateTime() {
	return createTime;
}
public void setCreateTime(String createTime) {
	this.createTime = createTime;
}
public Integer getPadWrongTime() {
	return padWrongTime;
}
public void setPadWrongTime(Integer padWrongTime) {
	this.padWrongTime = padWrongTime;
}
public String getLockTime() {
	return lockTime;
}
public void setLockTime(String lockTime) {
	this.lockTime = lockTime;
}
public String geteMail() {
	return eMail;
}
public void seteMail(String eMail) {
	this.eMail = eMail;
}
public String getmTel() {
	return mTel;
}
public void setmTel(String mTel) {
	this.mTel = mTel;
}





}
