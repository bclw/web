package com.ysd.entity;

import org.springframework.stereotype.Component;

@Component
public class Roles {
private Integer rId;
private String rName;
public Integer getrId() {
	return rId;
}
public void setrId(Integer rId) {
	this.rId = rId;
}
public String getrName() {
	return rName;
}
public void setrName(String rName) {
	this.rName = rName;
}
@Override
public String toString() {
	return "Roles [rId=" + rId + ", rName=" + rName + "]";
}





}
