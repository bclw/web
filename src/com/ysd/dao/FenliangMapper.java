package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Fenye;
import com.ysd.entity.Student;
import com.ysd.entity.User;

public interface FenliangMapper {
	 
			//学生总数
			Integer selectAllStudents(Fenye<Student> fenye);
			//分页多条件查询
			List<Student> selectStuends(Fenye<Student> fenye);
			//查看学生信息
			Student lookStuends(Integer sId);
			//添加学生信息
			Integer InsertStuends(Student student);
			//删除
			Integer deleteStudents(Integer sId);
			
			//修改咨询ID
			Integer updateUserId(Student student);
			//查询已签到的员工姓名与Id
			List<User> selectQD(String uExt);
			
	
}
