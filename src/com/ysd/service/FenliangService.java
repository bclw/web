package com.ysd.service;


import java.util.List;

import com.ysd.entity.Fenye;
import com.ysd.entity.Student;
import com.ysd.entity.User;

public interface FenliangService {
	
	//ѧ������
	Fenye<Student> selectStuends(Fenye<Student> fenye);
	//�鿴ѧ����Ϣ
	Student lookStuends(Integer sId);
	//���ѧ����Ϣ
	Integer InsertStuends(Student student);
	//ɾ��
	Integer deleteStudents(Integer sId);
	//�޸���ѯID
	Integer updateUserId(Student student);
	//��ѯ�Ѿ�ǩ����Ա��id������
	List<User> selectQD(String uExt);
}
