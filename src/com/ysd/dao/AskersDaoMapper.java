package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Fenye;
import com.ysd.entity.Student;

public interface AskersDaoMapper {
	//查询咨询师总条数
	Integer	selectStudentCount(Fenye fenye);
		/**
		 * 查询咨询师信息
		 * @param fenye
		 * @return
		 */
	List<Student>selectStudent(Fenye fenye);
	//Integer insertStudent(Student student);
	/**
	 * 修改
	 * @param student
	 * @return
	 */
	Integer updateStudent(Student student);	
	//List<Student> getStudent();
	
	
}
