package com.ysd.service;


import com.ysd.entity.Fenye;
import com.ysd.entity.Student;

public interface StudentService {
			//ѧ������
			Fenye<Student> selectStu(Fenye<Student> fenye);
			
			Student lookStu(Integer  sId);
			
			//�޸�ѧ����Ϣ
			Integer updateStu(Student student);
			
			
			
			//���ѧ����Ϣ
			Integer insertStu(Student student);
}
