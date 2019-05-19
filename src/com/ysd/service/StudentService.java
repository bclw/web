package com.ysd.service;


import com.ysd.entity.Fenye;
import com.ysd.entity.Student;

public interface StudentService {
			//学生总数
			Fenye<Student> selectStu(Fenye<Student> fenye);
			
			Student lookStu(Integer  sId);
			
			//修改学生信息
			Integer updateStu(Student student);
			
			
			
			//添加学生信息
			Integer insertStu(Student student);
}
