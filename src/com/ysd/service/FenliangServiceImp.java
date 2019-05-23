package com.ysd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.FenliangMapper;
import com.ysd.entity.Fenye;
import com.ysd.entity.Student;
import com.ysd.entity.User;
@Service
public class FenliangServiceImp implements FenliangService{
	
	@Autowired
	private FenliangMapper fenliangMapper;

	public Fenye<Student> selectStuends(Fenye<Student> fenye) {
		 List<Student> selectUser = fenliangMapper.selectStuends(fenye);
		 Integer selectUserCount = fenliangMapper.selectAllStudents(fenye);
		 fenye.setTotal(selectUserCount);
		 fenye.setRows(selectUser);
		 
		 return fenye;
	}

	public Student lookStuends(Integer sId) {
		return fenliangMapper.lookStuends(sId);
	}

	public Integer InsertStuends(Student student) {
		return fenliangMapper.InsertStuends(student);
	}

	public Integer deleteStudents(Integer sId) {
		return fenliangMapper.deleteStudents(sId);
	}

	public Integer updateUserId(Student student) {
		return fenliangMapper.updateUserId(student);
	}

	public List<User> selectQD(String uExt) {
		return fenliangMapper.selectQD(uExt);
	}

}
