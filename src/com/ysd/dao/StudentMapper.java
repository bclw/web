package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Fenye;
import com.ysd.entity.Student;

public interface StudentMapper {
		//ѧ������
		Integer selectStuCount(Fenye<Student> fenye);
		
		//��ҳ��������ѯ
		List<Student> selectStu(Fenye<Student> fenye);
		
		Student lookStu(Integer sId);
		
		
		//�޸�ѧ����Ϣ
		Integer updateStu(Student student);
		

		//�޸�ѧ����Ϣ
		Integer InsertStu(Student student);
	
}
