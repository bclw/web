package com.ysd.service;

import java.util.List;

import com.ysd.entity.Fenye;
import com.ysd.entity.Roles;
import com.ysd.entity.User;
import com.ysd.entity.Userroles;

public interface UserService {
	//�������Ʋ�ѯ�û��Ƿ����(��½)
	List<User> selectByname(User u);
	//���µ�½�û���Ϣ
	Integer updateUserLoginInfo(User u);
	//��ѯ�����û�
	Fenye<User> selectUser(Fenye<User> fenye);
	//����û�
	Integer insertUser(User user);
	//ɾ���û�
	Integer deleteUser(Integer  uId);
	//�޸��û�
	Integer updateUser(User user);
	//��������
	Integer resetPsd(User user);
	//�����û�
	Integer suodingUser(User user);
	//�����û�
	Integer jiesuoUser(User user);
	
	
	

	
	//�鿴���н�ɫ
	List<Roles> selectRoles();
	//��ʾ�����û���ɫ
	List<Roles> selectUserRoles(Integer id);
	
	
	//����û���ɫ
	Integer insertUserRoles(Userroles userroles);
	//ɾ���û���ɫ
	Integer deleteUserRoles(Integer roleId);
}
