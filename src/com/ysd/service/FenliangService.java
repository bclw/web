package com.ysd.service;


import java.util.List;

import com.ysd.entity.Fenye;
import com.ysd.entity.Student;
import com.ysd.entity.User;

public interface FenliangService {
	
	//学生总数
	Fenye<Student> selectStuends(Fenye<Student> fenye);
	//查看学生信息
	Student lookStuends(Integer sId);
	//添加学生信息
	Integer InsertStuends(Student student);
	//删除
	Integer deleteStudents(Integer sId);
	//修改咨询ID
	Integer updateUserId(Student student);
	//查询已经签到的员工id、姓名
	List<User> selectQD(String uExt);
}
