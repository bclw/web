package com.ysd.entity;

public class Modules {
private Integer mId;
private String mName;
private Integer mParentId;
private String mPath;
private Integer mWeight;
public Modules(Integer mId, String mName, Integer mParentId, String mPath,
		Integer mWeight) {
	super();
	this.mId = mId;
	this.mName = mName;
	this.mParentId = mParentId;
	this.mPath = mPath;
	this.mWeight = mWeight;
}
public Modules() {
	super();
	// TODO Auto-generated constructor stub
}
public Integer getmId() {
	return mId;
}
public void setmId(Integer mId) {
	this.mId = mId;
}
public String getmName() {
	return mName;
}
public void setmName(String mName) {
	this.mName = mName;
}
public Integer getmParentId() {
	return mParentId;
}
public void setmParentId(Integer mParentId) {
	this.mParentId = mParentId;
}
public String getmPath() {
	return mPath;
}
public void setmPath(String mPath) {
	this.mPath = mPath;
}
public Integer getmWeight() {
	return mWeight;
}
public void setmWeight(Integer mWeight) {
	this.mWeight = mWeight;
}
@Override
public String toString() {
	return "Modules [mId=" + mId + ", mName=" + mName + ", mParentId="
			+ mParentId + ", mPath=" + mPath + ", mWeight=" + mWeight + "]";
}


}
