package com.ysd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.StudentMapper;
import com.ysd.entity.Fenye;
import com.ysd.entity.Student;
@Service
public class StudentServiceImp implements StudentService{
@Autowired
private Fenye<Student> fenye;
@Autowired
private StudentMapper studentMapper;
	@Override
	public Fenye<Student> selectStu(Fenye<Student> fenye) {
		Integer stuCount = studentMapper.selectStuCount(fenye);
		List<Student> selectStu = studentMapper.selectStu(fenye);
		fenye.setTotal(stuCount);
		fenye.setRows(selectStu);
		System.out.println(stuCount);
		System.out.println(selectStu);
		return fenye;
	}



	@Override
	public Integer updateStu(Student student) {
		return studentMapper.updateStu(student);
	}



	@Override
	public Integer insertStu(Student student) {
		return studentMapper.InsertStu(student);
	}



	@Override
	public Student lookStu(Integer sId) {
		return studentMapper.lookStu(sId);
	}

}
