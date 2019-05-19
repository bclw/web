package com.ysd.entity;

import org.springframework.stereotype.Component;
@Component
public class Nefollows {
	private Integer nId;
	private Integer nStudentId;
	private String nStudentName;
	private String nFollowTime;//在数据库中改为datetime类型
	private String nNextFollowTime;
	private String nContent;
	private Integer nUserId;
	private String nFollowType;
	private String nCreateTime;
	private String nFollowState;
    //把学生维护到跟踪
	private Student student;
	private User user;
	

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getnId() {
		return nId;
	}

	public void setnId(Integer nId) {
		this.nId = nId;
	}

	public Integer getnStudentId() {
		return nStudentId;
	}

	public void setnStudentId(Integer nStudentId) {
		this.nStudentId = nStudentId;
	}

	public String getnStudentName() {
		return nStudentName;
	}

	public void setnStudentName(String nStudentName) {
		this.nStudentName = nStudentName;
	}

	public String getnFollowTime() {
		return nFollowTime;
	}

	public void setnFollowTime(String nFollowTime) {
		this.nFollowTime = nFollowTime;
	}

	public String getnNextFollowTime() {
		return nNextFollowTime;
	}

	public void setnNextFollowTime(String nNextFollowTime) {
		this.nNextFollowTime = nNextFollowTime;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public Integer getnUserId() {
		return nUserId;
	}

	public void setnUserId(Integer nUserId) {
		this.nUserId = nUserId;
	}

	public String getnFollowType() {
		return nFollowType;
	}

	public void setnFollowType(String nFollowType) {
		this.nFollowType = nFollowType;
	}

	public String getnCreateTime() {
		return nCreateTime;
	}

	public void setnCreateTime(String nCreateTime) {
		this.nCreateTime = nCreateTime;
	}

	public String getnFollowState() {
		return nFollowState;
	}

	public void setnFollowState(String nFollowState) {
		this.nFollowState = nFollowState;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Nefollows() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Nefollows(Integer nId, Integer nStudentId, String nStudentName, String nFollowTime, String nNextFollowTime,
			String nContent, Integer nUserId, String nFollowType, String nCreateTime, String nFollowState,
			Student student) {
		super();
		this.nId = nId;
		this.nStudentId = nStudentId;
		this.nStudentName = nStudentName;
		this.nFollowTime = nFollowTime;
		this.nNextFollowTime = nNextFollowTime;
		this.nContent = nContent;
		this.nUserId = nUserId;
		this.nFollowType = nFollowType;
		this.nCreateTime = nCreateTime;
		this.nFollowState = nFollowState;
		this.student = student;
	}

	@Override
	public String toString() {
		return "Nefollows [nId=" + nId + ", nStudentId=" + nStudentId + ", nStudentName=" + nStudentName
				+ ", nFollowTime=" + nFollowTime + ", nNextFollowTime=" + nNextFollowTime + ", nContent=" + nContent
				+ ", nUserId=" + nUserId + ", nFollowType=" + nFollowType + ", nCreateTime=" + nCreateTime
				+ ", nFollowState=" + nFollowState + ", student=" + student + ", user=" + user + "]";
	}



}
