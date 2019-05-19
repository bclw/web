package com.ysd.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ysd.dao.AskersDaoMapper;
import com.ysd.entity.Fenye;
import com.ysd.entity.Student;

@Component
public class AskersDaoMapperServiceImpl implements AskersDaoMapperService {
	@Autowired
	private AskersDaoMapper askersDaoMapper;
	@Override
		public Fenye<Student> selectStudent(Fenye<Student> fenye){
			Integer selectStudentCount = askersDaoMapper.selectStudentCount(fenye);
			List<Student> selectStudent = askersDaoMapper.selectStudent(fenye);
			fenye.setTotal(selectStudentCount);
			fenye.setRows(selectStudent);
			return fenye;	
		}
	@Override
	public Integer updateStudent(Student student) {
		
		return askersDaoMapper.updateStudent(student);
	}
	

	}


