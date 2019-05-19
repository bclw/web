package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Fenye;
import com.ysd.entity.Student;

public interface StudentMapper {
		//学生总数
		Integer selectStuCount(Fenye<Student> fenye);
		
		//分页多条件查询
		List<Student> selectStu(Fenye<Student> fenye);
		
		Student lookStu(Integer sId);
		
		
		//修改学生信息
		Integer updateStu(Student student);
		

		//修改学生信息
		Integer InsertStu(Student student);
	
}
