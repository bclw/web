package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Fenye;
import com.ysd.entity.Student;
import com.ysd.entity.User;

public interface FenliangMapper {
	 
			//ѧ������
			Integer selectAllStudents(Fenye<Student> fenye);
			//��ҳ��������ѯ
			List<Student> selectStuends(Fenye<Student> fenye);
			//�鿴ѧ����Ϣ
			Student lookStuends(Integer sId);
			//���ѧ����Ϣ
			Integer InsertStuends(Student student);
			//ɾ��
			Integer deleteStudents(Integer sId);
			
			//�޸���ѯID
			Integer updateUserId(Student student);
			//��ѯ��ǩ����Ա��������Id
			List<User> selectQD(String uExt);
			
	
}
