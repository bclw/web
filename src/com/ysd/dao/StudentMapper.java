package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Fenye;
import com.ysd.entity.Student;

public interface StudentMapper {

	//ѧ������
	Integer selectStuCount(Fenye fenye);
	
	//��ҳ��������ѯ
	List<Student> selectStu(Fenye fenye);
	
	//�޸�ѧ����Ϣ
	Integer updateStu(Student student);
	
}
