package com.ysd.entity;

import org.springframework.stereotype.Component;

@Component
public class Student {
private Integer sId;
private String sName;
private Integer sAge;
private Integer sSex;
private String sPhone;
private String sStuState;
private String sState;
private String sMsgSource;
private String sSourceUrl;
private String sSourceKeyWord;
private String sAddress;
private String sNetPusherId;
private String sStuConcern;
private Integer sQQ;
private String sWeiXin;
private String sContent;
private String sCreateTime;
private String sLearnForward;
private Integer sIsValid;
private String sRecord;
private Integer sIsReturnVist;
private String sFirstVisitTime;
private Integer sIsHome;
private String sHomeTime;    //************************闇�瑕佹敼鎴怱tring
private String sLostValid;
private String sIsPay;
private String sPayTime;
private String   sMoney;    //*************闇�瑕佹敼鎴怱tring
private Integer sIsReturnMoney;
private String sReturnMoneyReason;
private Integer sIsInClass;
private Integer sInClassTime;//鏀逛负int绫诲瀷
private String sInClassContent;
private Integer sIsBaoBei;
private Integer sZiXunId;
private Integer sCreateUserId;
private Double sPreMoney;
private String sPreMoneyTime;
//鎶婂挩璇㈠笀缁存姢鍒板鐢熶腑

private User user;




public User getUser() {
	return user;
}
public void setUser(User user) {
	this.user = user;
}
private Askers askers;
public Integer getsId() {
	return sId;
}
public void setsId(Integer sId) {
	this.sId = sId;
}
public String getsName() {
	return sName;
}
public void setsName(String sName) {
	this.sName = sName;
}
public Integer getsAge() {
	return sAge;
}
public void setsAge(Integer sAge) {
	this.sAge = sAge;
}
public Integer getsSex() {
	return sSex;
}
public void setsSex(Integer sSex) {
	this.sSex = sSex;
}
public String getsPhone() {
	return sPhone;
}
public void setsPhone(String sPhone) {
	this.sPhone = sPhone;
}
public String getsStuState() {
	return sStuState;
}
public void setsStuState(String sStuState) {
	this.sStuState = sStuState;
}
public String getsState() {
	return sState;
}
public void setsState(String sState) {
	this.sState = sState;
}
public String getsMsgSource() {
	return sMsgSource;
}
public void setsMsgSource(String sMsgSource) {
	this.sMsgSource = sMsgSource;
}
public String getsSourceUrl() {
	return sSourceUrl;
}
public void setsSourceUrl(String sSourceUrl) {
	this.sSourceUrl = sSourceUrl;
}
public String getsSourceKeyWord() {
	return sSourceKeyWord;
}
public void setsSourceKeyWord(String sSourceKeyWord) {
	this.sSourceKeyWord = sSourceKeyWord;
}
public String getsAddress() {
	return sAddress;
}
public void setsAddress(String sAddress) {
	this.sAddress = sAddress;
}
public String getsNetPusherId() {
	return sNetPusherId;
}
public void setsNetPusherId(String sNetPusherId) {
	this.sNetPusherId = sNetPusherId;
}
public String getsStuConcern() {
	return sStuConcern;
}
public void setsStuConcern(String sStuConcern) {
	this.sStuConcern = sStuConcern;
}
public Integer getsQQ() {
	return sQQ;
}
public void setsQQ(Integer sQQ) {
	this.sQQ = sQQ;
}
public String getsWeiXin() {
	return sWeiXin;
}
public void setsWeiXin(String sWeiXin) {
	this.sWeiXin = sWeiXin;
}
public String getsContent() {
	return sContent;
}
public void setsContent(String sContent) {
	this.sContent = sContent;
}
public String getsCreateTime() {
	return sCreateTime;
}
public void setsCreateTime(String sCreateTime) {
	this.sCreateTime = sCreateTime;
}
public String getsLearnForward() {
	return sLearnForward;
}
public void setsLearnForward(String sLearnForward) {
	this.sLearnForward = sLearnForward;
}
public Integer getsIsValid() {
	return sIsValid;
}
public void setsIsValid(Integer sIsValid) {
	this.sIsValid = sIsValid;
}
public String getsRecord() {
	return sRecord;
}
public void setsRecord(String sRecord) {
	this.sRecord = sRecord;
}
public Integer getsIsReturnVist() {
	return sIsReturnVist;
}
public void setsIsReturnVist(Integer sIsReturnVist) {
	this.sIsReturnVist = sIsReturnVist;
}
public String getsFirstVisitTime() {
	return sFirstVisitTime;
}
public void setsFirstVisitTime(String sFirstVisitTime) {
	this.sFirstVisitTime = sFirstVisitTime;
}
public Integer getsIsHome() {
	return sIsHome;
}
public void setsIsHome(Integer sIsHome) {
	this.sIsHome = sIsHome;
}
public String getsHomeTime() {
	return sHomeTime;
}
public void setsHomeTime(String sHomeTime) {
	this.sHomeTime = sHomeTime;
}
public String getsLostValid() {
	return sLostValid;
}
public void setsLostValid(String sLostValid) {
	this.sLostValid = sLostValid;
}
public String getsIsPay() {
	return sIsPay;
}
public void setsIsPay(String sIsPay) {
	this.sIsPay = sIsPay;
}
public String getsPayTime() {
	return sPayTime;
}
public void setsPayTime(String sPayTime) {
	this.sPayTime = sPayTime;
}
public String getsMoney() {
	return sMoney;
}
public void setsMoney(String sMoney) {
	this.sMoney = sMoney;
}
public Integer getsIsReturnMoney() {
	return sIsReturnMoney;
}
public void setsIsReturnMoney(Integer sIsReturnMoney) {
	this.sIsReturnMoney = sIsReturnMoney;
}
public String getsReturnMoneyReason() {
	return sReturnMoneyReason;
}
public void setsReturnMoneyReason(String sReturnMoneyReason) {
	this.sReturnMoneyReason = sReturnMoneyReason;
}
public Integer getsIsInClass() {
	return sIsInClass;
}
public void setsIsInClass(Integer sIsInClass) {
	this.sIsInClass = sIsInClass;
}
public Integer getsInClassTime() {
	return sInClassTime;
}
public void setsInClassTime(Integer sInClassTime) {
	this.sInClassTime = sInClassTime;
}
public String getsInClassContent() {
	return sInClassContent;
}
public void setsInClassContent(String sInClassContent) {
	this.sInClassContent = sInClassContent;
}
public Integer getsIsBaoBei() {
	return sIsBaoBei;
}
public void setsIsBaoBei(Integer sIsBaoBei) {
	this.sIsBaoBei = sIsBaoBei;
}
public Integer getsZiXunId() {
	return sZiXunId;
}
public void setsZiXunId(Integer sZiXunId) {
	this.sZiXunId = sZiXunId;
}
public Integer getsCreateUserId() {
	return sCreateUserId;
}
public void setsCreateUserId(Integer sCreateUserId) {
	this.sCreateUserId = sCreateUserId;
}
public Double getsPreMoney() {
	return sPreMoney;
}
public void setsPreMoney(Double sPreMoney) {
	this.sPreMoney = sPreMoney;
}
public String getsPreMoneyTime() {
	return sPreMoneyTime;
}
public void setsPreMoneyTime(String sPreMoneyTime) {
	this.sPreMoneyTime = sPreMoneyTime;
}
public Askers getAskers() {
	return askers;
}
public void setAskers(Askers askers) {
	this.askers = askers;
}


public Student() {
	super();
	// TODO Auto-generated constructor stub
}
public Student(Integer sId, String sName, Integer sAge, Integer sSex, String sPhone, String sStuState, String sState,
		String sMsgSource, String sSourceUrl, String sSourceKeyWord, String sAddress, String sNetPusherId,
		String sStuConcern, Integer sQQ, String sWeiXin, String sContent, String sCreateTime, String sLearnForward,
		Integer sIsValid, String sRecord, Integer sIsReturnVist, String sFirstVisitTime, Integer sIsHome,
		String sHomeTime, String sLostValid, String sIsPay, String sPayTime, String sMoney, Integer sIsReturnMoney,
		String sReturnMoneyReason, Integer sIsInClass, Integer sInClassTime, String sInClassContent, Integer sIsBaoBei,
		Integer sZiXunId, Integer sCreateUserId, Double sPreMoney, String sPreMoneyTime, Askers askers) {
	super();
	this.sId = sId;
	this.sName = sName;
	this.sAge = sAge;
	this.sSex = sSex;
	this.sPhone = sPhone;
	this.sStuState = sStuState;
	this.sState = sState;
	this.sMsgSource = sMsgSource;
	this.sSourceUrl = sSourceUrl;
	this.sSourceKeyWord = sSourceKeyWord;
	this.sAddress = sAddress;
	this.sNetPusherId = sNetPusherId;
	this.sStuConcern = sStuConcern;
	this.sQQ = sQQ;
	this.sWeiXin = sWeiXin;
	this.sContent = sContent;
	this.sCreateTime = sCreateTime;
	this.sLearnForward = sLearnForward;
	this.sIsValid = sIsValid;
	this.sRecord = sRecord;
	this.sIsReturnVist = sIsReturnVist;
	this.sFirstVisitTime = sFirstVisitTime;
	this.sIsHome = sIsHome;
	this.sHomeTime = sHomeTime;
	this.sLostValid = sLostValid;
	this.sIsPay = sIsPay;
	this.sPayTime = sPayTime;
	this.sMoney = sMoney;
	this.sIsReturnMoney = sIsReturnMoney;
	this.sReturnMoneyReason = sReturnMoneyReason;
	this.sIsInClass = sIsInClass;
	this.sInClassTime = sInClassTime;
	this.sInClassContent = sInClassContent;
	this.sIsBaoBei = sIsBaoBei;
	this.sZiXunId = sZiXunId;
	this.sCreateUserId = sCreateUserId;
	this.sPreMoney = sPreMoney;
	this.sPreMoneyTime = sPreMoneyTime;
	this.askers = askers;
}
@Override
public String toString() {
	return "Student [sId=" + sId + ", sName=" + sName + ", sAge=" + sAge + ", sSex=" + sSex + ", sPhone=" + sPhone
			+ ", sStuState=" + sStuState + ", sState=" + sState + ", sMsgSource=" + sMsgSource + ", sSourceUrl="
			+ sSourceUrl + ", sSourceKeyWord=" + sSourceKeyWord + ", sAddress=" + sAddress + ", sNetPusherId="
			+ sNetPusherId + ", sStuConcern=" + sStuConcern + ", sQQ=" + sQQ + ", sWeiXin=" + sWeiXin + ", sContent="
			+ sContent + ", sCreateTime=" + sCreateTime + ", sLearnForward=" + sLearnForward + ", sIsValid=" + sIsValid
			+ ", sRecord=" + sRecord + ", sIsReturnVist=" + sIsReturnVist + ", sFirstVisitTime=" + sFirstVisitTime
			+ ", sIsHome=" + sIsHome + ", sHomeTime=" + sHomeTime + ", sLostValid=" + sLostValid + ", sIsPay=" + sIsPay
			+ ", sPayTime=" + sPayTime + ", sMoney=" + sMoney + ", sIsReturnMoney=" + sIsReturnMoney
			+ ", sReturnMoneyReason=" + sReturnMoneyReason + ", sIsInClass=" + sIsInClass + ", sInClassTime="
			+ sInClassTime + ", sInClassContent=" + sInClassContent + ", sIsBaoBei=" + sIsBaoBei + ", sZiXunId="
			+ sZiXunId + ", sCreateUserId=" + sCreateUserId + ", sPreMoney=" + sPreMoney + ", sPreMoneyTime="
			+ sPreMoneyTime + ", askers=" + askers + "]";
}
}