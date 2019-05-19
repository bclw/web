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
