package com.ysd.entity;

import java.util.List;

import org.springframework.stereotype.Component;
@Component
public class Fenye<T> {
	private Integer page;
	private Integer pageSize;
	private Integer total;
	private List<T> rows;
	private Student student;
	
	
	
	private String named;//根据用户名模糊查询
	private String startTime;//用户创建开始时间
	private String endTime;//用户创建结束时间
	private String lockd;//用户是否锁定
	//排序
	
	private String rName;
	
	
	// 姓名关键字、电话、咨询师、是否缴费、是否有效、是否回访、QQ、创建时间/上门时间/首次回访时间/缴费时间/进班时间 
		private String loginName;
		private String nContent;
		
	
	
	// 姓名关键字、电话、咨询师、是否缴费、是否有效、是否回访、QQ、创建时间/上门时间/首次回访时间/缴费时间/进班时间
	private String sName;
	private String sPhone;
	private Integer sZiXunId;
	private Integer sIsPay;
	private Integer sIsValid;
	private Integer sIsReturnVist;
	private Integer sQQ;
	private String sCreateTime;
	private String askerName;
	private Integer sIsHome;
	/*
	 * <!-- 11、nStudentName跟踪学生名称 12、nFollowTime跟踪时间 13、下次跟踪时间 nNextFollowTime
	 * 14、跟踪方式 nFollowType 15、nFollowState 跟踪状态 -->
	 */
	private Nefollows Nefollows;
	private String nStudentName;
	private String nFollowTime;
	private String nNextFollowTime;
	private String nFollowType;
	private String nFollowState;
	private Integer uId;//新加用户Id
	
	
	
	
	
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getnContent() {
		return nContent;
	}
	public void setnContent(String nContent) {
		this.nContent = nContent;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getsPhone() {
		return sPhone;
	}
	public void setsPhone(String sPhone) {
		this.sPhone = sPhone;
	}
	public Integer getsZiXunId() {
		return sZiXunId;
	}
	public void setsZiXunId(Integer sZiXunId) {
		this.sZiXunId = sZiXunId;
	}

	public Integer getsIsPay() {
		return sIsPay;
	}
	public void setsIsPay(Integer sIsPay) {
		this.sIsPay = sIsPay;
	}
	public Integer getsIsValid() {
		return sIsValid;
	}
	public void setsIsValid(Integer sIsValid) {
		this.sIsValid = sIsValid;
	}
	public Integer getsIsReturnVist() {
		return sIsReturnVist;
	}
	public void setsIsReturnVist(Integer sIsReturnVist) {
		this.sIsReturnVist = sIsReturnVist;
	}
	public Integer getsQQ() {
		return sQQ;
	}
	public void setsQQ(Integer sQQ) {
		this.sQQ = sQQ;
	}
	public String getsCreateTime() {
		return sCreateTime;
	}
	public void setsCreateTime(String sCreateTime) {
		this.sCreateTime = sCreateTime;
	}
	public String getAskerName() {
		return askerName;
	}
	public void setAskerName(String askerName) {
		this.askerName = askerName;
	}
	public Integer getsIsHome() {
		return sIsHome;
	}
	public void setsIsHome(Integer sIsHome) {
		this.sIsHome = sIsHome;
	}
	public Nefollows getNefollows() {
		return Nefollows;
	}
	public void setNefollows(Nefollows nefollows) {
		Nefollows = nefollows;
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
	public String getnFollowType() {
		return nFollowType;
	}
	public void setnFollowType(String nFollowType) {
		this.nFollowType = nFollowType;
	}
	public String getnFollowState() {
		return nFollowState;
	}
	public void setnFollowState(String nFollowState) {
		this.nFollowState = nFollowState;
	}
	public Integer getuId() {
		return uId;
	}
	public void setuId(Integer uId) {
		this.uId = uId;
	}
	public String getrName() {
		return rName;
	}
	public void setrName(String rName) {
		this.rName = rName;
	}
	public String getNamed() {
		return named;
	}
	public void setNamed(String named) {
		this.named = named;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getLockd() {
		return lockd;
	}
	public void setLockd(String lockd) {
		this.lockd = lockd;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	
	
	public Fenye() {
		super();
	}
	public Fenye(Integer page, Integer pageSize, Integer total, List<T> rows,
			Student student, String named, String startTime, String endTime,
			String lockd, String rName) {
		super();
		this.page = page;
		this.pageSize = pageSize;
		this.total = total;
		this.rows = rows;
		this.student = student;
		this.named = named;
		this.startTime = startTime;
		this.endTime = endTime;
		this.lockd = lockd;
		this.rName = rName;
	}
	@Override
	public String toString() {
		return "Fenye [page=" + page + ", pageSize=" + pageSize + ", total="
				+ total + ", rows=" + rows + ", student=" + student
				+ ", named=" + named + ", startTime=" + startTime
				+ ", endTime=" + endTime + ", lockd=" + lockd + ", rName="
				+ rName + "]";
	}
	
	
	
	
}
