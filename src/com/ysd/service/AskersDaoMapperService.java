package com.ysd.service;
import com.ysd.entity.Fenye;
import com.ysd.entity.Student;
public interface AskersDaoMapperService {
	Fenye<Student> selectStudent(Fenye<Student> fenye);
    // 修改
    Integer  updateStudent(Student student);
}
